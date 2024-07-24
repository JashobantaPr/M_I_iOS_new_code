import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myProfile/email_preference/model/email_preferences_model.dart';

class EmailPreferenceService {
  Future<EmailPreference?> emailData() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=j3hoa1jobic3c941jci8ccsn1bps20tp'
    };
    var request = http.Request('POST', Uri.parse(Url.viewemailsetting));
    request.bodyFields = {
      'user_id': '61493',
      'c_id': '80',
      'f_name': 'Viru',
      'l_name': 'Two'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String? json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      EmailPreference userProfile = EmailPreference.fromJson(jsonResponse);
      return userProfile;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
