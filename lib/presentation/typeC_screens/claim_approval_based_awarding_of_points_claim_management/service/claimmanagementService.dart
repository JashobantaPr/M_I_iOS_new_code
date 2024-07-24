import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/controller/claimapprovalbasedawardingofpointsclaimmanagementController.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/model/allclaims.dart';

import '../model/claimmanagementModel.dart';

class typectotaltabclaimmanagementService {
  final CacheService _cacheService = CacheService();
  Future<ClaimData1?> getclaimsummary() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    print('dataaa$userId');
    print('dataaa$companyId');

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=mjaqm25atiqmmabhq72qa1l2kd9snkps'
    };

    var request = http.Request('POST', Uri.parse(Url.getcliam));
    request.bodyFields = {
      'company_id': companyId!,
      'program_id': Get.arguments,
      'user_id': userId!
    };
    request.headers.addAll(headers);
    print('aaaaaaa${request.bodyFields}');

    http.StreamedResponse response = await request.send();
    print('SSDFDSGFG${response}');
    if (response.statusCode == 200) {
      print('dfsdgfdg${response.statusCode}');
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('jhjhjh${jsonResponse}');
      final claimDataJson = jsonResponse['claim_data'] as Map<String, dynamic>;
      print('claim_data: $claimDataJson');

      final claimData = ClaimData1.fromJson(claimDataJson);
      print('Claim Data: $claimData');

      return claimData;
    } else {
      print('Failed to fetch points: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<List<Claim>?> getAllClaim() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    print('dataaa$userId');
    print('dataaa$companyId');

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=k63fgj3n067hfu0uhchn5b92505i967i'
    };
    var request = http.Request('POST', Uri.parse(Url.getallcliam));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments
    };
    request.headers.addAll(headers);
    print('requestbodyFieldszs${request.bodyFields}');

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('jsonResponse${jsonResponse}');
      final dataList = jsonResponse['campaignApprovalBulk'] as List<dynamic>;
      print('dataList${dataList}');
      if (dataList.isNotEmpty) {
        List<Claim> claims =
            dataList.map((data) => Claim.fromJson(data)).toList();
        print('claims${claims}');
        return claims;
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print('Failed to fetch claims: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<void> showOrHideAddButton() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=6c8cncn6p051mq3979okip17acfh4jeo'
    };
    var request = http.Request(
      'POST',
      Uri.parse(
        Url.showbutton,
      ),
    );
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(responseBody);
      final showAddClaim = jsonResponse['show_add_claim'] as bool;
      if (showAddClaim) {
        Get.find<ClaimApprovalBasedAwardingofPointsClaimManagementController>()
            .showAddClaimButton();
      } else {
        Get.find<ClaimApprovalBasedAwardingofPointsClaimManagementController>()
            .hideAddClaimButton();
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}
