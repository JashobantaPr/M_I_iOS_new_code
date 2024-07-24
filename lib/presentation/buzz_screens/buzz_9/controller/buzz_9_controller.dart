import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart' as audio;
import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/model/buzz_9_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/utils/cache_service.dart';
import '../Buzz_9Service/Buzz_service.dart';
import '../model/behaviour.dart';
import '../model/loadingmodel.dart';

class Buzz9Controller extends GetxController {
  final CacheService _cacheService = CacheService();

  final TextEditingController discription = TextEditingController();
  final TextEditingController serchcontroller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final GlobalKey textFieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  var selectedOption1 = false.obs;
  var selectedOption2 = false.obs;
  var isSelected = ''.obs;
  var isUserExpanded = false.obs;
  var selectedRadio = 'Text'.obs;
  var isDescriptionExpanded = false.obs;
  var isBehaviourExpanded = false.obs;
  OverlayEntry? overlayEntry;
  OverlayEntry? listenerEntry;

  ////////

  var isCancelTapped = false.obs;
  var isBuzzTapped = false.obs;

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
      isBuzzTapped.value = false; // Deselect Buzz
      Get.back();
    }
  }

  void toggleBuzz() {
    if (!isBuzzTapped.value) {
      isBuzzTapped.value = true;
      isCancelTapped.value = false; // Deselect Cancel
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserSearchList();
    fetchbehaviours();
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

  var scopeId = ''.obs;
  var scopeName = ''.obs;

  void getArguments() {
    final arguments = Get.arguments as Map<String, dynamic>;
    scopeId.value = arguments['scopeId'];
    scopeName.value = arguments['scopeName'];
  }

  var stepsCompleted = [false, false, false].obs;

  void updateStepCompletion() {
    stepsCompleted[0] = selectedUsers.isNotEmpty;
    stepsCompleted[1] = discription.text.isNotEmpty ||
        discription.text != "" ||
        pickedFilePath.isNotEmpty;
    stepsCompleted[2] = selectedUser.isNotEmpty && behaviourid.isNotEmpty;
  }

  var userList = <User>[].obs;
  var isLoading = true.obs;
  var filteredUsers = <User>[].obs;
  var selectedUsers = <User>[].obs;

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

// getBehaviours

  final RxList<Behavior> behaviors = <Behavior>[].obs;
  var selectedUser = ''.obs;
  var behaviourid = ''.obs;

  void selectUser(String behaviorname, String behaviorid) {
    selectedUser.value = behaviorname;
    behaviourid.value = behaviorid;
    updateStepCompletion();
  }

  void fetchbehaviours() async {
    try {
      isLoading(true);
      List<Behavior> response = await BuzzService().buzzBehaviours();
      behaviors.assignAll(response);
    } catch (e) {
      print("Failed to fetch user list: $e");
    } finally {
      isLoading(false);
    }
  }

  //upload audio api

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

  Future<void> createBuzz() async {
    print('upto coming here');

    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    String? behaviurname = selectedUser.value;
    String? behaviurid = behaviourid.value;
    String? discriptionname = discription.text;
    String? buzzzposttype = selectedRadio.value;

    // Selected user IDs
    List<String> selectedUserIds =
        selectedUsers.map((user) => user.userIdPk!).toList();
    String seUserIds = jsonEncode(selectedUserIds);

    // Selected user first names
    List<String> selectedUserfirstnames =
        selectedUsers.map((user) => user.firstName!).toList();
    String selectedUserfnames = jsonEncode(selectedUserfirstnames);

    // Selected user last names
    List<String> selectedUserlastnames =
        selectedUsers.map((user) => user.lastName!).toList();
    String selectedUserlnames = jsonEncode(selectedUserlastnames);

    // Selected user emails
    List<String> selectedUseremail =
        selectedUsers.map((user) => user.email!).toList();
    String selectedUseremails = jsonEncode(selectedUseremail);

    // Create mapstring
    Map<String, String> mapstring = {
      'own_id': userId!,
      'company_id': companyId!,
      'comp_code': '91',
      'media_unique_id': '',
      'desc': discriptionname ?? '',
      'postData': seUserIds,
      'first_name': selectedUserfnames,
      'last_name': selectedUserlnames,
      'emailid': selectedUseremails,
      'reporting_manager': 'viru3.k@grgindia.in',
      'sess_fname': 'viru',
      'sess_lname': 'three',
      'sess_email': 'viru2.k@grgindia.in',
      'behaviour_name': behaviurname,
      'buzzz_post_type': buzzzposttype ?? "Text",
      'scope_id': scopeId.value ?? 'Global',
      'post_type': 'all',
      'behaviour_id': behaviurid
    };

    if (mapstring.isNotEmpty) {
      toggleBuzz();
      Get.dialog(CustomloadingScreen(), barrierDismissible: false);

      try {
        isLoading(true);

        if (selectedRadio.value == 'Video') {
          await uploadVideo();
        } else if (selectedRadio.value == 'Audio') {
          await uploadaudio();
        } else {
          print('your choosing description');
        }

        final String? response = await BuzzService().createbuzz(mapstring);
        if (response != null) {
          var jsonResponse = json.decode(response);
          if (jsonResponse['status'] == true) {
            print(' its Working ${jsonResponse['msg']}');
            cleardatacreatedbuzz();
            Get.back();
            Get.back();
          } else {
            print("Failed to create buzz");
            cleardatacreatedbuzz();
            Get.back();
          }
        } else {
          print("Failed to get create buzzzz");
          Get.back();
        }
      } catch (e) {
        print("Failed to create buzzzzzzzz: $e");
        Get.back();
      } finally {
        isLoading(false);
      }
    } else {
      print('fill all content');
    }
  }

  Future<void> uploadVideo() async {
    try {
      isLoading(true);
      if (selectedVideoFile.value != null) {
        print('selectedVideoFile${selectedVideoFile.value!.path}');
        List<int> fileBytes = await selectedVideoFile.value!.readAsBytes();
        String base64String = base64Encode(fileBytes);
        bool response =
            await BuzzService().uploadvideo(selectedVideoFile.value!.path);
        print('Encriptedvideo$base64String');
        if (response) {
          print("Video uploaded successfully");
        } else {
          // Handle failure
          print("Failed to upload video");
        }
      }
    } catch (e) {
      print("Failed to upload video: $e");
    } finally {
      isLoading(false);
    }
  }

//Step 1

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

  /////////////audiosection

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

//video section

  final ImagePicker _picker = ImagePicker();

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  var selectedVideoFile = Rx<File?>(null);
  var videoDuration = Rx<Duration?>(null);
  var videoSizeMB = Rx<double?>(null);
  var isvideoPlaying = false.obs;

  Future<void> pickVideo() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      if (!_isValidVideoFile(file)) return;

      _initializeVideoPlayer(file);
    }
    isvideoPlaying.value == true;
    updateStepCompletion();
  }

  Future<void> recordVideo() async {
    final XFile? video =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (video != null) {
      File file = File(video.path);
      selectedVideoFile.value = file;
      // Validate video file
      if (!_isValidVideoFile(file)) return;
      _initializeVideoPlayer(file);
    }
  }

  Future<void> _initializeVideoPlayer(File file) async {
    selectedVideoFile.value = file;
    videoSizeMB.value = file.lengthSync() / (1024 * 1024);
    videoPlayerController = VideoPlayerController.file(file);
    await videoPlayerController!.initialize();
    videoDuration.value = videoPlayerController!.value.duration;
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        aspectRatio: videoPlayerController!.value.aspectRatio,
        autoPlay: true,
        looping: false,
        showControls: false);
    update();
  }

  bool _isValidVideoFile(File file) {
    final fileSizeMB = file.lengthSync() / (1024 * 1024);
    final fileExtension = file.path.split('.').last.toLowerCase();
    if (fileExtension != 'mp4') {
      Get.snackbar('Error',
          'The selected file is not valid. The file should be in MP4 format.');
      return false;
    }
    if (fileSizeMB > 20) {
      Get.snackbar('Error',
          'The selected file is too large. The file should be less than 20MB.');
      return false;
    }

    return true;
  }

  void playVideo() {
    videoPlayerController?.play();
    isvideoPlaying.value = true;
    update();
  }

  void pauseVideo() {
    videoPlayerController?.pause();
    isvideoPlaying.value = false;
    update();
  }

  void scrollUp() {
    scrollController.animateTo(
      scrollController.position.pixels - 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void cleardatacreatedbuzz() {
    selectedUser = ''.obs;
    behaviourid = ''.obs;
    pickedFilePath = ''.obs;
    filteredUsers.clear();
    selectedUsers.clear();
    selectedVideoFile = Rx<File?>(null);
    discription.clear();
    serchcontroller.clear();
    selectedOption1 = false.obs;
    selectedOption2 = false.obs;
    isSelected = ''.obs;
    isUserExpanded = false.obs;
    selectedRadio = 'Text'.obs;
    isDescriptionExpanded = false.obs;
    isBehaviourExpanded = false.obs;
    videoPlayerController = null;
    updateStepCompletion();
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

  void clearVideo() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    videoPlayerController = null;
    chewieController = null;
    selectedVideoFile.value = null;
    videoDuration.value = null;
    videoSizeMB.value = null;
    isvideoPlaying.value =
        false; // Reset isPlaying to false when video is cleared
    update();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }
}
