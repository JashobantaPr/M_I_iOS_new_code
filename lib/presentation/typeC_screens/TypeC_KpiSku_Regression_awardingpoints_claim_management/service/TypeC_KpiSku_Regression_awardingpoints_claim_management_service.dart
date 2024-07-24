import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/controller/claimapprovalbasedawardingofpointsclaimmanagementController.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/model/allclaims.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/typeC_createclaim_management_model.dart';
import '../model/claimmanagementModel.dart';

class TypeCKpiSkuAwardingPointsClaimManagementService {
  final CacheService _cacheService = CacheService();
  Future<ClaimData1?> getclaimsummary() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=mjaqm25atiqmmabhq72qa1l2kd9snkps'
    };

    var request =
        http.Request('POST', Uri.parse('${Url.getclaimsummarytypec}'));
    request.bodyFields = {
      'company_id': companyId!,
      'program_id': Get.arguments,
      'user_id': userId!,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      final claimDataJson = jsonResponse['claim_data'] as Map<String, dynamic>;

      final claimData = ClaimData1.fromJson(claimDataJson);

      return claimData;
    } else {
      print('Failed to fetch points: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<List<Claim>?> getAllClaim() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=k63fgj3n067hfu0uhchn5b92505i967i'
    };
    var request =
        http.Request('POST', Uri.parse('${Url.getclaimmanagementdatatypec}'));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      final dataList = jsonResponse['campaignApprovalBulk'] as List<dynamic>;

      if (dataList.isNotEmpty) {
        List<Claim> claims =
            dataList.map((data) => Claim.fromJson(data)).toList();

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
        '${Url.showbutton}',
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

  Future<ClaimData?> fetchAddClaimDetails() async {
    try {
      String? userId = await _cacheService.getUserId();
      String? companyId = await _cacheService.getCompanyId();

      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=9hvc79dc1ejbo9aet10sfj4rcja8mcfp'
      };

      var request = http.Request('POST', Uri.parse(Url.addclaimformfields));
      request.bodyFields = {
        'company_id': companyId!,
        'user_id': userId!,
        'program_id': Get.arguments
      };

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = json.decode(responseBody);

        return ClaimData.fromJson(jsonResponse);
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print('Error fetching claim detailsS: $e');
      return null;
    }
  }
}
