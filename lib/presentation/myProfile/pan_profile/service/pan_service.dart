import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/model/documentsubmission_model.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/model/pan_model.dart';
import 'package:incentivesgit/routes/app_routes.dart';

class PanService {
  final CacheService _cacheService = CacheService();
  Future<PanProfileEdit?> panEdit() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=sgang5i6c25f1usch8jeea0e382mn9oo'
    };
    var request = http.Request('POST', Uri.parse(Url.userpandetails));
    request.bodyFields = {'company_id': companyId!, 'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonReponse = jsonDecode(json);
      if (jsonReponse['status'] == true) {
        return PanProfileEdit.fromJson(jsonReponse);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }

  Future<bool?> panData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ducod9s87a4h68dcnjeofgpbasi0u65f'
    };
    var request = http.Request('POST', Uri.parse(Url.changepancardstatus));
    request.bodyFields = {
      'company_id': companyId!,
      'approval_status_code': 'PA004',
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

  Future<DocumentSubmissionResponse?> updatePanData(
      {required String nameOnPancard,
      required String pancardNumber,
      required String pancardImage,
      required String pancardImageExtension,
      required int profileType}) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    print('dfj ${profileType}');
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=sgang5i6c25f1usch8jeea0e382mn9oo'
    };
    var request = http.Request('POST', Uri.parse(Url.saveuserpandetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'pan_type': profileType.toString(),
      'name_on_pancard': nameOnPancard,
      'pancard_no': pancardNumber,
      'pancard_image': pancardImage,
      'pancard_image_extension': pancardImageExtension
    };
    print('dkff ${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('dfkj ${response.statusCode}');

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      print('dfbf ${jsonResponse}');
      if (jsonResponse['status'] == true) {
        Get.offNamed(AppRoutes.account);
        return DocumentSubmissionResponse.fromJson(jsonResponse);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }
}
