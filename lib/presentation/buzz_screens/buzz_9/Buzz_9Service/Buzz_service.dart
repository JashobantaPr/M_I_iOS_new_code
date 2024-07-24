import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';

import '../../../../data/api_secvices/api_url.dart';
import '../model/behaviour.dart';
import '../model/buzz_9_model.dart';

class BuzzService {
  final CacheService _cacheService = CacheService();

  Future<UserResponse> buzzUserSearch(RxList<User> selectedUsers) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

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

    var request = http.Request(
        'POST', Uri.parse('${Url.baseUrl}//engagements/search_user'));

    request.bodyFields = {
      'product_code': 'P00003',
      'username': 'viru',
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

  Future<List<Behavior>> buzzBehaviours() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=5237bsvoaie7035lk7a5j1t783rboj72'
    };

    var request = http.Request(
      'POST',
      Uri.parse('${Url.baseUrl}//home/behaviours'),
    );
    request.bodyFields = {'company_id': companyId ?? ''};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonData = json.decode(responseBody);
      List<Behavior> behaviors = (jsonData['behaviour'] as List)
          .map((item) => Behavior.fromJson(item))
          .toList();
      return behaviors;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

//upload audio

  Future<bool> uploadaudio(String encriptedaudio) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=skbgetp7r3p38kj1fl6j8tc6kh6abg7t'
    };
    var request =
        http.Request('POST', Uri.parse('${Url.baseUrl}//home/audio_upload'));
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

  //upload video

  Future<bool> uploadvideo(String filePath) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=skbgetp7r3p38kj1fl6j8tc6kh6abg7t'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('${Url.baseUrl}/home/video_upload'));
    request.fields.addAll({'type': 'video/mp4', 'comp_code': companyId!});

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      filePath,
      contentType: MediaType('video', 'mp4'),
    ));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('vvvvvvvvvvvv${await response.stream.bytesToString()}');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

//Create buzz api
  Future<String?> createbuzz(mapstring) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=6ekshr794dhvd5r43klab0nec5j0pj7s'
    };
    var request = http.Request(
        'POST', Uri.parse('${Url.baseUrl}/engagements/submit_buzzz/'));
    request.bodyFields = mapstring;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      print('Create Buzz-responseBody$responseBody');
      return responseBody;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
