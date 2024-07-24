import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/likesdata/model/likedatamodel.dart';

class LikerdataService {
  Future<List<UserDetails>> getAllLikes() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=8shholtmn472hptniudet19hdovgmsen'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/getallpostlikes_api'));
    request.bodyFields = {'post_id': Get.arguments};
    print('idsuf${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('datasjj${jsonResponse['usersDetails']}');

      List<UserDetails> users = [];
      jsonResponse['usersDetails'].forEach((key, value) {
        users.add(UserDetails.fromJson(value));
      });

      return users;
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }
}
