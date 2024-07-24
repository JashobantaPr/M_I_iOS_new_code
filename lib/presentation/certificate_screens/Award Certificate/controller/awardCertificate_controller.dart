import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart' as audio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/Service/awardCertificate_service.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/customLoading.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/model/awardCertificate_model.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/controller/certificate_7_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AwardCertificateController extends GetxController {
  final TextEditingController discription = TextEditingController();
  final TextEditingController serchcontroller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  final getCertificate = Get.find<Certificate7Controller>();

  var selectedOption1 = false.obs;
  var selectedOption2 = false.obs;
  var isSelected = ''.obs;
  var isUserExpanded = false.obs;
  var selectedRadio = 'Text'.obs;
  var isDescriptionExpanded = false.obs;
  var isBehaviourExpanded = false.obs;

  var isCancelTapped = false.obs;
  var isBuzzTapped = false.obs;
  var isImageRemoving = false.obs;
  OverlayEntry? overlayEntry;

  var stepsCompleted = [false, false, false].obs;

  void selectOption1(bool value) {
    selectedOption1.value = value;
    if (value) selectedOption2.value = false;
  }

  void selectOption2(bool value) {
    selectedOption2.value = value;
    if (value) selectedOption1.value = false;
  }

  void toggleBehaviourExpanded() {
    isBehaviourExpanded.value = !isBehaviourExpanded.value;
  }

  void toggleCancel() {
    if (!isCancelTapped.value) {
      isCancelTapped.value = true;
      isBuzzTapped.value = false;
    }
  }

  void toggleBuzz() {
    if (!isBuzzTapped.value) {
      isBuzzTapped.value = true;
      isCancelTapped.value = false;
    }
  }

  var scopeId = ''.obs;
  var scopeName = ''.obs;

  var userList = <User>[].obs;
  var isLoading = true.obs;
  var filteredUsers = <User>[].obs;
  var selectedUsers = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserSearchList();
    step2discription();
    player.onPlayerStateChanged.listen((state) {
      isAudioPlaying.value = state == audio.PlayerState.playing;
    });
    player.onDurationChanged.listen((d) {
      duration.value = d;
    });
    player.onPositionChanged.listen((p) {
      position.value = p;
    });
    getArguments();
  }

  void getArguments() {
    final arguments = Get.arguments as Map<String, dynamic>;
    scopeId.value = arguments['scopeId'];
    scopeName.value = arguments['scopeName'];
  }

  void updateStepCompletion() {
    stepsCompleted[0] = selectedUsers.isNotEmpty;
    stepsCompleted[1] = discription.text.isNotEmpty ||
        discription.text != "" ||
        pickedFilePath.isNotEmpty;
    stepsCompleted[2] = pickedFilePath.isNotEmpty;
  }

  void fetchUserSearchList() async {
    try {
      isLoading(true);
      UserResponse response = await BuzzService().buzzUserSearch(selectedUsers);
      userList.assignAll(response.userdata);
      // filteredUsers
      //     .assignAll(userList);
    } catch (e) {
      print("Failed to fetch user list: $e");
    } finally {
      isLoading(false);
    }
  }

  void filterUsers(String value) {
    print(value);
    if (value.isEmpty) {
      filteredUsers.clear();
    } else {
      filteredUsers.value = userList.where((user) {
        return user.firstName!.toLowerCase().contains(value.toLowerCase()) ||
            user.lastName!.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
  }

  void addUserToSelection(User user) {
    selectedUsers.add(user);
    filteredUsers.clear();
    fetchUserSearchList();
    updateStepCompletion();
  }

  void step2discription() {
    updateStepCompletion();
  }

  void removeUserFromSelection(User user) {
    selectedUsers.remove(user);
  }

  //audiosection

  final record = AudioRecorder();
  final player = audio.AudioPlayer();
  var pickedFilePath = ''.obs;
  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var isRecording = false.obs;
  var isAudioPlaying = false.obs;
  var recordingDurationInSeconds = 0.obs;

  late Timer recordingTimer;

  void startRecordingTimer() {
    recordingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      recordingDurationInSeconds.value++;
    });
  }

  void stopRecordingTimer() {
    recordingTimer.cancel();
  }

  Future<void> startRecording() async {
    try {
      if (await record.hasPermission()) {
        final directory = await getApplicationDocumentsDirectory();
        final path = '${directory.path}/recording.m4a';
        // ignore: prefer_const_constructors
        final config = RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
        );
        await record.start(config, path: path);
        isRecording.value = true;
        pickedFilePath.value = path;
        recordingDurationInSeconds.value = 0;
        startRecordingTimer();
      }
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      await record.stop();
      isRecording.value = false;
      stopRecordingTimer();
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  Future<void> playRecording() async {
    try {
      if (pickedFilePath.value.isNotEmpty) {
        await player.play(audio.DeviceFileSource(pickedFilePath.value));
      }
    } catch (e) {
      print('Error playing recording: $e');
    }
  }

  Future<void> pauseRecording() async {
    try {
      await player.pause();
    } catch (e) {
      print('Error pausing recording: $e');
    }
  }

  void removeAudioFile() {
    if (pickedFilePath.value.isNotEmpty) {
      final file = File(pickedFilePath.value);
      if (file.existsSync()) {
        file.delete();
        pickedFilePath.value = '';
      }
    }
  }

  void seekToPosition(Duration position) {
    player.seek(position);
  }

  Future<void> stopAudio() async {
    try {
      await player.stop();
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  @override
  void onClose() {
    record.dispose();
    player.dispose();
    if (recordingTimer.isActive) {
      recordingTimer.cancel();
    }
    scrollController.dispose();
    super.onClose();
  }

  // audio upload api

  Future<void> uploadaudio() async {
    toggleBuzz();
    try {
      isLoading(true);
      File audioFile = File(pickedFilePath.value);
      List<int> fileBytes = await audioFile.readAsBytes();
      String base64String = base64Encode(fileBytes);
      bool response = await BuzzService().uploadaudio(base64String);

      if (response) {
        // Handle success
        print("Audio uploaded successfully");
      } else {
        // Handle failure
        print("Failed to upload audio");
      }
    } catch (e) {
      print("Failed to upload audio: $e");
    } finally {
      isLoading(false);
    }
  }

  //buzz create api

  Future<void> Createbuzz() async {
    toggleBuzz();
    Get.dialog(CustomloadingScreen(), barrierDismissible: false);
    List<String> selectedUserIds =
        selectedUsers.map((user) => user.userIdPk!).toList();
    String seUserIds = jsonEncode(selectedUserIds);
    try {
      isLoading(true);
      final dynamic response = await BuzzService().createbuzz(
        getCertificate.selectedCertificate.value?.bucketIdFk,
        getCertificate.selectedCertificate.value?.certificateDetailSubtitle,
        getCertificate.selectedCertificate.value?.certificateMasterIdPk,
        seUserIds,
        discription.text,
        getCertificate.selectedCertificate.value?.certificateTypeIdFk,
      );
      if (response != null) {
        if (response['status'] == true) {
          print(response['msg']);
          Get.back();
          Get.back();
        } else {
          print("Failed to create certificate");
          Get.snackbar(
            'Error',
            'Failed to create buzz: ${response['msg']}',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
          );
        }
      } else {
        print("Failed to create certificate");
      }
    } catch (e) {
      print("Failed to reate certificate: $e");
    } finally {
      isLoading(false);
    }
  }

  void cleardatacreatedbuzz() {
    pickedFilePath = ''.obs;
    filteredUsers.clear();
    selectedUsers.clear();

    discription.clear();
    serchcontroller.clear();
    selectedOption1 = false.obs;
    selectedOption2 = false.obs;
    isSelected = ''.obs;
    isUserExpanded = false.obs;
    selectedRadio = 'text'.obs;
    isDescriptionExpanded = false.obs;
    isBehaviourExpanded = false.obs;

    updateStepCompletion();
  }
}
