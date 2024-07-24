import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/controller/awardCertificate_controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/model/certificate_7_model.dart';

import '../model/awardCertificate_model.dart';

class BuzzService {
  // final getController = Get.find<AwardCertificateController>();

  final CacheService _cacheService = CacheService();
  Future<UserResponse> buzzUserSearch(RxList<User> selectedUsers) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    final userName = await _cacheService.getCache(FIRST_NAME);
    List<String> selectedUserIds =
        selectedUsers.map((user) => user.userIdPk!).toList();
    List<String> selectedUserscopid =
        selectedUsers.map((user) => user.scopeIdFk!).toList();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ua2n6qavskg3dohmvm2ostbu20sq28ot'
    };

    var request = http.Request('POST', Uri.parse(Url.buzzSearch));

    request.bodyFields = {
      'product_code': 'P00003',
      'username': userName,
      'com_id': companyId!,
      'user_id_pk': userId!,
      'currentuser': '1',
      'sel_user': selectedUserIds.join(','),
      'scope': selectedUserscopid.join(',')
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonData = json.decode(responseBody);
      return UserResponse.fromJson(jsonData);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  //upload audio

  Future<bool> uploadaudio(String encriptedaudio) async {
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=skbgetp7r3p38kj1fl6j8tc6kh6abg7t'
    };
    var request = http.Request('POST', Uri.parse(Url.buzzAudio));
    request.bodyFields = {
      'content': encriptedaudio,
      'type': 'audio',
      'comp_code': companyId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('aaaaaaaaaaaaa${await response.stream.bytesToString()}');

      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

//Create Award api
  Future<dynamic> createbuzz(
    bucketid,
    discri,
    certifiid,
    String seUserIds,
    String text,
    certificateType,
  ) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();

    final companyCode = await _cacheService.getCache(COMP_CODE);
    final scopeId = await _cacheService.getCache(SCOP_ID);

    // Check if userId is null and handle it
    if (userId == null) {
      print('Error: userId is null');
      return null;
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=6ekshr794dhvd5r43klab0nec5j0pj7s'
    };
    var request = http.Request('POST', Uri.parse(Url.createAward));
    request.bodyFields = {
      'companyCode': companyCode,
      'c_id': companyId ?? '',
      'product_code': 'P00003',
      'awardedByUserId': userId,
      'awardedToUserId': seUserIds,
      'certificateId': certifiid,
      'certificateType': certificateType,
      'certificateBucketId': bucketid,
      'awardCertificateDescription': discri,
      'certificateDescriptionType': text,
      'media_unique_id': '',
      'certificateaudioid': '',
      'scope_id': scopeId,
      'post_type': ''
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      print('jsonResponse$jsonResponse');
      return jsonResponse;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
