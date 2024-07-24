import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class RejectClaimService {
  final CacheService _cacheService = CacheService();

  Future<bool> rejectClaim(String? climeid) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? claimId = climeid;
    final userName = await _cacheService.getCache(FIRST_NAME);
    final emailId = await _cacheService.getCache(EMAIL_ID);

    if (userId == null || companyId == null || claimId == null) {
      print(
          'One or more required fields are null: userId=$userId, companyId=$companyId, claimId=$claimId');
      return false;
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=mohb1qj0v6van4gklb17tfcgt6tdddf0'
    };
    var request = http.Request('POST', Uri.parse(Url.rejectClaim));
    request.bodyFields = {
      'company_id': companyId,
      'user_id': userId,
      'user_name': userName,
      'user_email': emailId,
      'comments': 'appprgd',
      'claim_id': climeid.toString(),
      'action': 'reject'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('working');
      var responseBody = await response.stream.bytesToString();
      // Add additional parsing if necessary to check the response status
      print('sdddff${responseBody}');
      return true;
    } else {
      print('Failed to reject claim: ${response.reasonPhrase}');
      return false;
    }
  }
}
