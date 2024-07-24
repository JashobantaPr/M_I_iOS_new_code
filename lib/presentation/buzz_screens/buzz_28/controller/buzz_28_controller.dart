import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/model/awardpoints_model.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/model/buzz_28_model.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/model/taggedusers_model.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/service/buzz_28_service.dart';

class Buzz28Controller extends GetxController {
  final CacheService _cacheService = CacheService();
  var postId = Get.arguments;
  List<TextEditingController> controllers = [];
  var budgetData = Data(
    comid: '',
    userId: '',
    from: '',
    to: '',
    financialFrom: '',
    financialTo: '',
    type: '',
    totalMybudgetAllocated: [],
    totalMybudgetDistributed: [],
    totalMybudgetExpired: [],
    totalMybudgetBalance: 0,
  ).obs;
  var taggedData = Rx<TaggedUsersResponse?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var valid = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBalancePoints();
    fetchTaggedUsers(postId);
  }

  void fetchBalancePoints() async {
    try {
      var response = await Buzz28Service().balancepoints();
      if (response != null) {
        budgetData.value = response.data;
      }
    } catch (e) {
      print("Failed to fetch scheduled upgrade: $e");
    }
  }

  void fetchTaggedUsers(String postId) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      var response = await Buzz28Service().taggedUsers(postId);
      if (response != null) {
        taggedData.value = response;
      } else {
        errorMessage.value = 'Failed to fetch data';
      }
    } catch (e) {
      errorMessage.value = "Failed to fetch data: $e";
    } finally {
      isLoading.value = false;
    }
  }

  void createAwardPoints() async {
    String? companyCode = await _cacheService.getCompanyCode();
    String? companyId = await _cacheService.getCompanyCode();
    final firstName = await _cacheService.getCache(FIRST_NAME);
    final lastName = await _cacheService.getCache(LAST_NAME);
    final userId = await _cacheService.getCache(USERID);
    final userEmail = await _cacheService.getCache(EMAIL_ID);
    List<Map<String, dynamic>> awardPointsData = [];
    for (int i = 0; i < controllers.length; i++) {
      var userAward = taggedData.value?.usersAwards?.values.toList()[i];
      var points = controllers[i].text;
      if (userAward != null) {
        awardPointsData.add({
          "userId": userAward.userIdPk,
          "userAwardPoints": points,
          "userFullName": "${userAward.firstName} ${userAward.lastName}",
          "userEmailId": userAward.email,
        });
      }
    }
    var mapString = {
      "award_points_data": awardPointsData,
      "budget_user_email": userEmail,
      "budget_user_first_name": firstName,
      "budget_user_id": userId,
      "budget_user_last_name": lastName,
      "company_code": companyCode,
      "company_id": companyId,
      "post_id": postId
    };

    try {
      var response = await Buzz28Service().awardpoints(mapString);
      if (response['status'] == true) {
        Get.dialog(const AwardPointsModalOpen(), barrierDismissible: false);
      } else {
        print('Failed to award points: ${response['error']}');
      }
    } catch (e) {
      print("Failed to fetch scheduled upgrade: $e");
    }
  }
}
