import 'package:flutter/widgets.dart';
import 'package:incentivesgit/core/app_export.dart';

import '../../../../core/utils/cache_service.dart';
import '../../get_all_certificate_screen/controller/get_all_certificate_controller.dart';
import '../../get_all_certificate_screen/service/get_all_service.dart';
import '../model/view_certificate_model.dart';
import '../service/view_certificate_service.dart';

class ViewCertificateController extends GetxController {
  TextEditingController commentcontroller = TextEditingController();
  Rx<viewCertificate> viewCertificatedata = viewCertificate().obs;
  final CacheService _cacheService = CacheService();
  final getAllCertificate = Get.find<GetAllCertificateController>();
  var likedPosts = <String>[].obs; // List of liked post IDs

  final postId = Get.arguments;
  var selectedPost = Rx<Post?>(null);
  var selectedUser = Rx<User?>(null);

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getCertificates();
  }

  Future<void> getCertificates() async {
    isLoading.value = true; // Set loading to true
    final response = await getCertificateServices().getCertificatesDetails();
    if (response != null) {
      print('viewCertificatedata$response');
      viewCertificatedata.value = viewCertificate.fromJson(response);
      print('viewCertificatedata${viewCertificatedata.value}');
    }
    isLoading.value = false; // Set loading to false
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
      // Check if the post is already liked
      if (likedPosts.contains(postId)) {
        var dislike = await getAllCertificateServices().removeLike(bodyFields);
        if (dislike == 'success') {
          likedPosts.remove(postId); // Remove from likedPosts list
        }
      } else {
        var like = await getAllCertificateServices().addlike(bodyFields);
        if (like == 'success') {
          likedPosts.add(postId); // Add to likedPosts list
          getCertificates();
        }
      }
      getalllikesbuzzes(postId);
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  Future<void> getalllikesbuzzes(String postId) async {
    String? userId = await _cacheService.getUserId();

    try {
      var bodyFields = {'post_id': postId, 'user_id': userId!};
      var fetches = await getAllCertificateServices().getlikes(bodyFields);

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

  void addcomment(String firstName, String lastName, String postId) async {
    try {
      isLoading.value = true;
      String? userId = await _cacheService.getUserId();
      String? companyId = await _cacheService.getCompanyId();
      print('firstName: $firstName, lastName: $lastName, postId: $postId');

      var bodyFields = {
        'company_id': companyId ?? '',
        'own_id': userId ?? '',
        'postid': postId,
        'product_code': 'P00003',
        'f_name': firstName,
        'l_name': lastName,
        'comment': commentcontroller.text
      };
      print('bodyFields: $bodyFields');
      String? response =
          await getAllCertificateServices().addcomment(bodyFields);

      if (response != null) {
        print('Response from addcomment: $response');
        await getCertificates();
        await getAllCertificate.getAllCertifictes();

        commentcontroller.clear();
      } else {
        print('Failed to add comment');
      }
    } catch (e) {
      print('Error adding comment: $e');
    } finally {
      isLoading.value = false; // End loading, whether successful or not
    }
  }
}
