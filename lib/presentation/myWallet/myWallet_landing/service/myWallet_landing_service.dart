import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/utils/cache_service.dart';

class myWalletServices {
  final CacheService _cacheService = CacheService();
  Future<Map<String, dynamic>?> getWalletDetails() async {
    final userId = await _cacheService.getCache(USERID);
    final companyId = await _cacheService.getCache(COMP_ID);
    final accessControl = await _cacheService.getAccessControl();
    final activities = await _cacheService.getActivities();

    if (accessControl != null) {
      print('Access Control: $accessControl');
    } else {
      print('No access control found.');
    }

    if (activities != null) {
      print('activities: $activities');
    } else {
      print('No activities  found.');
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=tno8cvodjh3iadmm8fa0mib36cfpa96j'
    };
    var request = http.Request(
      'POST',
      Uri.parse(
          'https://staging.myincentives.co.in/index.php/apis//redemption/wallet_types'),
    );
    request.bodyFields = {
      'bucket_expired_status': '0',
      'company_id': companyId,
      'user_id': userId
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      return json.decode(responseBody);
    } else {
      print('Error: ${response.reasonPhrase}');
    }
    return null;
  }

  Future<Map<String, dynamic>?> viewMyWallet() async {
    final userId = await _cacheService.getCache(USERID);
    final companyId = await _cacheService.getCache(COMP_ID);
    final accessControl = await _cacheService.getAccessControl();
    final activities = await _cacheService.getActivities();

    if (accessControl != null) {
      print('Access Control: $accessControl');
    } else {
      print('No access control found.');
    }

    if (activities != null) {
      print('Activities: $activities');
    } else {
      print('No activities found.');
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=co20k0k33f3t5iofodofo20i305u8t76'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//budget/view_my_wallet'));
    request.body = json.encode({
      "access_controls": accessControl,
      "activities": activities,
      "company_id": companyId,
      "user_id": userId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      print('Response Body: $responseBody');
      return json.decode(responseBody);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Reason: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<String?> viewAllTransitionService() async {
    final userId = await _cacheService.getCache(USERID);
    final companyId = await _cacheService.getCache(COMP_ID);

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=bbokr1bkdkkbqj0l36dllkkp9da9ntve'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//budget/ajax_list_for_view_mywallet'));
    request.bodyFields = {
      'user_id': userId,
      'company_id': companyId,
      'length': '9',
      'start': '0'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
