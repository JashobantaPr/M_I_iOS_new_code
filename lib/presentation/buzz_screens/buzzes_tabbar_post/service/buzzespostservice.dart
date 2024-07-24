import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/model/buzzes_tabbar_post_model.dart';

class BuzzesPostService {
  Future<Fetchedbuzzes?> getbuzzes(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=p6i014pab8tc9b6had78a305qeipqehk'
    };
    var request = http.Request('POST', Uri.parse(Url.buzzesposts));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      return Fetchedbuzzes.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String> addlike(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=198p9taae3p06k6qdl9okropuof51crg'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/addLike'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final addedlike = jsonResponse['status'];
      return addedlike;
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }

  Future<String?> removeLike(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ph2tfru4mbnk5f6ode4ufntucud09vis'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/removeLike'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final removelike = jsonResponse['status'];
      return removelike;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String?> addcomment(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=05pd8kto00d4fmp6sbiv5nvvkl18k03f'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//engagements/postComment'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final addcomment = jsonResponse['comment'];
      return addcomment;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<bool?> deletePost(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=inb8l6usjgt08ct6rq5hbvqbeoqdojrj'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/delete_post_by_author'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final deletepost = jsonResponse['status'];
      print('deletepost$deletepost');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<Map<String, dynamic>?> getlikes(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ugg62khc60mm1bc372e5k9ctjumsbq6r'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/getallpostlikes_api'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      return jsonResponse;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
