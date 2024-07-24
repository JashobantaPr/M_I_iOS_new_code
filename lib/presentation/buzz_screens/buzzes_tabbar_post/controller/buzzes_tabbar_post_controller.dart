import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/model/buzzes_tabbar_post_model.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/service/buzzespostservice.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

import '../../Buzze_Tabbar/controller/buzzeTabBar_Controller.dart';

class BuzzesTababrPostController extends GetxController {
  final CacheService _cacheService = CacheService();

  TextEditingController commentcontroller = TextEditingController();

  var isLoading = true.obs;
  var likedPosts = <String>[].obs;
  var buzzesdetails = Fetchedbuzzes().obs;

  final player = AudioPlayer();
  var isPlayings = false.obs;
  var isMuted = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var playingindex = 0.obs;

  var fromDate = ''.obs;
  var toDate = ''.obs;

  @override
  void onInit() {
    fetchedbuzzes();
    super.onInit();
    player.durationStream.listen((d) {
      duration.value = d ?? Duration.zero;
    });
    player.positionStream.listen((p) {
      position.value = p;
    });
    player.playerStateStream.listen((state) {
      isPlayings.value = state.playing;
      if (state.processingState == ProcessingState.completed) {
        isPlayings.value = false;
        position.value = Duration.zero;
      }
    });
  }

  Future<void> selectDate(BuildContext context, bool isFromDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      if (isFromDate) {
        fromDate.value = formattedDate;
      } else {
        toDate.value = formattedDate;
      }
    }
  }

  Future<void> playAudio(String url, int postIdindex) async {
    if (playingindex.value != postIdindex) {
      await stopAudio();
      playingindex.value = postIdindex;
    }
    try {
      await player.setUrl(url);
      player.play();
      isPlayings.value = true;
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> stopAudio() async {
    await player.stop();
    isPlayings.value = false;
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
    player.setVolume(isMuted.value ? 0 : 1);
  }

  void seek(Duration position) {
    player.seek(position);
  }

// videoplayer

  late VideoPlayerController _controller;
  var isPlaying = false.obs;
  var isError = false.obs;
  var isInitialized = false.obs;

  VideoPlayerController get controller => _controller;

  Future<void> initializeVideoPlayer(String videoUrl,
      {bool autoPlay = false, bool isMuted = false}) async {
    try {
      Uri uri = Uri.parse(
          'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/video/$videoUrl');
      _controller = VideoPlayerController.networkUrl(
        uri,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      await _controller.initialize();
      isInitialized.value = true;

      if (autoPlay) {
        playVideo();
      }

      _controller.setVolume(isMuted ? 0.0 : 1.0);
    } catch (e) {
      print('Error initializing video: $e');
      isError.value = true;
    }
  }

  void playVideo() {
    isPlaying.value = true;
    _controller.play();
  }

  void pauseVideo() {
    isPlaying.value = false;
    _controller.pause();
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      pauseVideo();
    } else {
      playVideo();
    }
  }

  var isApplyButtonClicked = false.obs;
  var isCancelButtonClicked = false.obs;

  TextEditingController serchcontroller = TextEditingController();
  var selectedOption = ''.obs;

  List<String> viewOptions = [
    'All Buzzes',
    'Buzzes by me',
    'Buzzes for me',
    'Deleted By Author',
    'Deleted By Admin'
  ];

  void setSelectedOption(String? option) {
    if (option != null) {
      selectedOption.value = option;
    }
  }

  void resetFilters() {
    serchcontroller.clear();
    selectedOption.value = '';
    fromDate.value = '';
    toDate.value = '';
    isApplyButtonClicked.value = false;
    isCancelButtonClicked.value = false;
  }

  Future<void> fetchedbuzzes() async {
    final BuzzesTabBarController scopeController =
        Get.find<BuzzesTabBarController>();

    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    String? selectedcropeid;
    if (scopeController.selectedScopeid != null &&
        scopeController.selectedScopeid != "") {
      selectedcropeid = scopeController.selectedScopeid.value;
    } else {
      selectedcropeid = 'Global';
    }

    try {
      isLoading.value = true;

      var filter = 'all'; // Default filter value
      switch (selectedOption.value) {
        case 'All Buzzes':
          filter = 'all';
          break;
        case 'Buzzes by me':
          filter = 'Buzzes by me';
          break;
        case 'Buzzes for me':
          filter = 'Buzzes for me';
          break;
        case 'Deleted By Author':
          filter = 'Deleted By Author';
          break;
        case 'Deleted By Admin':
          filter = 'Deleted By Admin';
          break;
      }

      var bodyFields = {
        'own_id': userId ?? '',
        'company_id': companyId ?? '',
        'posts_type': 'Recognition',
        'comp_code': companyCode ?? '',
        'scope_id': selectedcropeid,
      };

      if (serchcontroller.text.isNotEmpty &&
          fromDate.value.isNotEmpty &&
          toDate.value.isNotEmpty &&
          filter.isNotEmpty) {
        bodyFields['keyword'] = serchcontroller.text;
        bodyFields['from'] = fromDate.value ?? '';
        bodyFields['to'] = toDate.value ?? '';
        bodyFields['filter'] = filter;
      }

      print('bodyFieldsbodyFields$bodyFields');

      var fetches = await BuzzesPostService().getbuzzes(bodyFields);
      buzzesdetails.value = fetches ?? Fetchedbuzzes();
      serchcontroller.clear();
    } catch (e) {
      print('No Buzzes  $e');
    } finally {
      isLoading.value = false;
    }
  }

  void likepost(String postId, String firstname, String lastname) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var bodyFields = {
        'type': 'post',
        'last_name': lastname,
        'first_name': firstname,
        'user_id': userId ?? '',
        'company_id': companyId ?? '',
        'postid': postId,
        'com_post_id': ''
      };
      if (likedPosts.contains(postId)) {
        var dislike = await BuzzesPostService().removeLike(bodyFields);
        if (dislike == 'success') {
          likedPosts.remove(postId);
          likedPosts.clear();
        }
      } else {
        var like = await BuzzesPostService().addlike(bodyFields);
        if (like == 'success') {
          likedPosts.add(postId);
          likedPosts.clear();
        }
      }
      await getalllikesbuzzes(postId);
      refreshCertificatesData();
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  Future<void> getalllikesbuzzes(String postId) async {
    String? userId = await _cacheService.getUserId();

    try {
      var bodyFields = {'post_id': postId, 'user_id': userId!};
      var fetches = await BuzzesPostService().getlikes(bodyFields);

      if (fetches != null) {
        final likedUsers = fetches['users_ids'].split(',');
        if (likedUsers.contains(userId)) {
          likedPosts.add(postId);
        } else {
          likedPosts.remove(postId);
        }
      }
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  void addcomment(String postId, String firstName, String lastName) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var bodyFields = {
        'company_id': companyId ?? '',
        'own_id': userId ?? '',
        'postid': postId,
        'product_code': 'P00003',
        'f_name': firstName,
        'l_name': lastName,
        'comment': commentcontroller.text
      };
      await BuzzesPostService().addcomment(bodyFields);
      commentcontroller.clear();
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  void deletepost(String postId) async {
    String? userId = await _cacheService.getUserId();
    try {
      var bodyFields = {'user_id': userId ?? '', 'postid': postId};
      print('bodyFieldsdf$bodyFields');
      bool? deletepost = await BuzzesPostService().deletePost(bodyFields);
      print('deletepostc $deletepost');
      if (deletepost == true) {
        Get.back();
      } else {}
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  @override
  void onClose() {
    _controller.dispose();
    player.dispose();
    super.onClose();
  }

  void refreshCertificatesData() async {
    final BuzzesTabBarController scopeController =
        Get.find<BuzzesTabBarController>();
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    String? selectedcropeid;
    if (scopeController.selectedScopeid != null &&
        scopeController.selectedScopeid != "") {
      selectedcropeid = scopeController.selectedScopeid.value;
    } else {
      selectedcropeid = 'Global';
    }
    // Fetch and update data
    try {
      var filter = 'all'; // Default filter value
      switch (selectedOption.value) {
        case 'All Buzzes':
          filter = 'all';
          break;
        case 'Buzzes by me':
          filter = 'Buzzes by me';
          break;
        case 'Buzzes for me':
          filter = 'Buzzes for me';
          break;
        case 'Deleted By Author':
          filter = 'Deleted By Author';
          break;
        case 'Deleted By Admin':
          filter = 'Deleted By Admin';
          break;
      }

      var bodyFields = {
        'own_id': userId ?? '',
        'company_id': companyId ?? '',
        'posts_type': 'Recognition',
        'comp_code': companyCode ?? '',
        'scope_id': selectedcropeid,
      };

      if (serchcontroller.text.isNotEmpty &&
          fromDate.value.isNotEmpty &&
          toDate.value.isNotEmpty &&
          filter.isNotEmpty) {
        bodyFields['keyword'] = serchcontroller.text;
        bodyFields['from'] = fromDate.value ?? '';
        bodyFields['to'] = toDate.value ?? '';
        bodyFields['filter'] = filter;
      }

      print('bodyFieldsbodyFields$bodyFields');

      var fetches = await BuzzesPostService().getbuzzes(bodyFields);
      buzzesdetails.value = fetches ?? Fetchedbuzzes();
      serchcontroller.clear();
    } catch (e) {
      print('Failed to refresh certificates: $e');
    }
  }
}
