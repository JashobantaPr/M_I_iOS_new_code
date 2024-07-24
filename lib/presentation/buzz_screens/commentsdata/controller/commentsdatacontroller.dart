import 'package:get/get.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/buzz_screens/commentsdata/model/commentsdatamodel.dart';
import 'package:incentivesgit/presentation/buzz_screens/commentsdata/service/commentsdataservice.dart';

class CommentsdataController extends GetxController {
  
  final CacheService _cacheService = CacheService();
  Rx<CommentsResponse?> commentsResponse = Rx<CommentsResponse?>(null);
  String? postId;
  String? commentId;
  var isLikedMap = <String, RxBool>{}.obs;
  var isDislikedMap = <String, RxBool>{}.obs;
  var likeCountMap = <String, RxInt>{}.obs;
  var likedPosts = <String>[].obs;

  String getTimeDifference(String recordDate) {
    final dateTime = DateTime.parse(recordDate);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  @override
  void onInit() {
    fetchAllComments();
    fetchAllCommentslikes();
    super.onInit();
  }

  Future<void> fetchAllComments() async {
    try {
      CommentsResponse? response = await CommentsDataService().allcomments();
      if (response != null) {
        commentsResponse.value = response;
      }
    } catch (e) {
      print('Error fetching comments: $e');
    }
  }

  Future<void> fetchAllCommentslikes() async {
    try {
      var response = await CommentsDataService().commentslikeCount();
      if (response != null) {
        // commentsResponse.value = response;
      }
    } catch (e) {
      print('Error fetching comments: $e');
    }
  }

  void removelike(String postId) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var bodyFields = {
        'type': 'comment',
        'user_id': userId ?? '',
        'company_id': companyId ?? '',
        'postid': postId
      };
      var dislike = await CommentsDataService().removeLike(bodyFields);
      if (dislike == 'success') {
        isDislikedMap[postId]?.value = true;
        isLikedMap[postId]?.value = false; // Ensure like is false
      }
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  void likepost(String postId, String firstname, String lastname,
      String commentId) async {
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
        'com_post_id': commentId
      };
      print('bodyFields  $bodyFields');
      // Check if the post is already liked by the user
      if (isLikedMap[postId]?.value ?? false) {
        var dislike = await CommentsDataService().removeLike(bodyFields);
        if (dislike == 'success') {
          isLikedMap[postId]?.value = false;
        }
      } else {
        var like = await CommentsDataService().addlike(bodyFields);
        if (like == 'success') {
          isLikedMap[postId]?.value = true;
          isDislikedMap[postId]?.value = false;
        }
      }
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  void toggleCommentLike(String postId, String commentId) async {
    try {
      var bodyFields = {
        'type': 'comm_likes',
        'postid': postId,
        'commentid': commentId
      };
      if (isLikedMap[commentId]?.value == true) {
        var response = await CommentsDataService().removeLike(bodyFields);
        if (response == 'success') {
          isLikedMap[commentId]?.value = false;
          likeCountMap[commentId]?.value--;
        }
      } else {
        var response = await CommentsDataService().addlike(bodyFields);
        if (response == 'success') {
          isLikedMap[commentId]?.value = true;
          likeCountMap[commentId]?.value++;
        }
      }
    } catch (e) {
      print('Error toggling comment like: $e');
    }
  }

  void deletecomment(String commentId) async {
    try {
      bool? deletecomment =
          await CommentsDataService().deletecomment(commentId);
      if (deletecomment == true) {
        fetchAllComments();
      } else {
        fetchAllComments();
      }
    } catch (e) {
      print('delete Failed  $e');
    }
  }
}
