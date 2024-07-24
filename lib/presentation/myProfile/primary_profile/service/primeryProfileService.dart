import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';

import '../../../../core/utils/cache_service.dart';
import '../../../../routes/app_routes.dart';
import '../controller/primary_profile_controller.dart';
import '../model/primeryProfile.dart';

class PrimeryProfileService {
  final CacheService _cacheService = CacheService();

  Future<List<Userdata>?> primerydata() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=el886e35ag27cnp0d9ck56c7ln643kij'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/home/companyuserdet'));
    request.bodyFields = {'user_id': userId!, 'company_id': companyId!};
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        print('jsonResponse: $jsonResponse');

        if (jsonResponse is Map<String, dynamic>) {
          if (jsonResponse['profile_data'] != null &&
              jsonResponse['profile_data']['userdata'] != null) {
            List<Userdata> primaryModels = [];
            for (var item in jsonResponse['profile_data']['userdata']) {
              primaryModels.add(Userdata.fromJson(item));
            }
            return primaryModels.isNotEmpty ? primaryModels : null;
          } else {
            print('No profile_data or userdata found.');
            return null;
          }
        } else {
          print('Unexpected JSON response structure.');
          return null;
        }
      } else {
        print('HTTP error: ${response.statusCode} - ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception caught: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> businessHierdata() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=njbdj52eb5128ish7r4u4us2o06p9jqh'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//company/getCompanyHierarchy'));
    request.bodyFields = {'productCode': 'P00003', 'company_id': companyId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return jsonDecode(responseBody);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<void> updateMobileNo() async {
    try {
      String? userId = await _cacheService.getUserId();
      String? companyId = await _cacheService.getCompanyId();
      final firstname = await _cacheService.getCache(FIRST_NAME);
      final data = Get.find<PrimaryProfileController>();

      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=i7js60h1fmlscaffkeas486d0sktl385'
      };

      var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/home/newphonesubmit'),
      );

      request.bodyFields = {
        'user_id': userId!,
        'c_id': companyId!,
        'f_name': firstname,
        'number': data.phonenumbercontroller.text,
      };

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);

        if (jsonResponse['status'] == true) {
          int? otp = jsonResponse['otp'];
          if (otp != null) {
            await _cacheService.setCache(OTP_SESSION, otp);
            Get.back();
            Get.toNamed(AppRoutes.verificationcode,
                arguments: data.phonenumbercontroller.text);
          }
        } else {
          print('Failed: ${jsonResponse['mssg']}');
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
