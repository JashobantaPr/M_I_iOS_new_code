import 'dart:convert';

import 'package:get/get.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/onBoarding/notification_screen/models/notification_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/app_export.dart';

/// A controller class for the Iphone13MiniTenScreen.
///
/// This class manages the state of the Iphone13MiniTenScreen, including the
/// current iphone13MiniTenModelObj

class NotificationController extends GetxController {
  final CacheService _cacheService = CacheService();
  final notifications = <NotificationModel>[].obs;

  // // Method to toggle notification read status
  void toggleReadStatus(int index) {
    notifications[index].userSeen = notifications[index].userSeen;
  }

  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  Future<void> fetchNotifications() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=il1j0n3sb2aengcl6a26scrnkcr2o97n'
    };
    var request = http.Request('POST', Uri.parse(Url.getAllNotification));
    request.bodyFields = {'company_id': companyId!, 'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final List<dynamic> result = json.decode(responseData);
      notifications.assignAll(
          result.map((json) => NotificationModel.fromJson(json)).toList());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> markAllAsRead() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ivmb2q21710be13bj0173onuv30edtg7'
    };
    var request = http.Request('POST', Uri.parse(Url.readAllNotification));
    request.bodyFields = {
      'company_id': notifications[0].cmsCompanyIdFk,
      'user_id': notifications[0].cmsUserIdFk
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
