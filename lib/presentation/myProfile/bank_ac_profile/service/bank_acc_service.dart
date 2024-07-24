import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/model/bank_acc_data_model.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/model/bank_acc_model.dart';

class BankService {
  final CacheService _cacheService = CacheService();
  Future<BankProfileData?> bankData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=2f1p94i2uegi1qp42vqoh7uto5fpsldu'
    };
    var request = http.Request('POST', Uri.parse(Url.userbankdetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'user_type': 'Standard User'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonReponse = jsonDecode(json);
      if (jsonReponse['status'] == true) {
        return BankProfileData.fromJson(jsonReponse);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }

  Future<bool?> editBankData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=6dqdnvb2o5fbftftfkfaf0uo997iecgt'
    };
    var request = http.Request('POST', Uri.parse(Url.changebankaccountstatus));
    request.bodyFields = {
      'company_id': companyId!,
      'approval_status_code': 'BA004',
      'user_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonRepose = jsonDecode(json);
      return jsonRepose['status'];
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<BankDocumentSubmissionResponse?> saveBankData({
    required String accountHolderName,
    required String accountNumber,
    required String ifscCode,
    required String passbookImage,
    required String pancardImageExtension,
    required int profileType,
    required int bankId,
    required int accountType,
  }) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=toqbcacs44isu44ulrem65t7e980du7l'
    };
    var request = http.Request('POST', Uri.parse(Url.saveuserbankdetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'profile_type_id': profileType.toString(),
      'account_holder_name': accountHolderName,
      'bank_account_number': accountNumber,
      'ifsc_code': ifscCode,
      'bank_id': bankId.toString(),
      'account_type': accountType.toString(),
      'cancelled_cheque_image': passbookImage,
      'cancelled_cheque_image_extension': pancardImageExtension
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      if (jsonResponse['status'] == true) {
        return BankDocumentSubmissionResponse.fromJson(jsonResponse);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }
}
