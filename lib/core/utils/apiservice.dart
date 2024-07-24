import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  Future post(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future postHeader(String url, Map<String, dynamic> body) async {
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=gsv9c71q4dtv34pcvblho7405fbcjk9q'
      };

      var encodedBody = Uri(queryParameters: body).query;

      var response =
          await http.post(Uri.parse(url), headers: headers, body: encodedBody);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future adminpost(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        // throw const HttpException("Something went wrong!");
        final data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future authPost(String url, Map<String, dynamic> body) async {
    try {
      // String? authToken = await CacheService().getAuthToken();
      // print("gggggggg ${authToken}");
      final response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        "Content-Type": "application/json",
        // "Authorization": 'Bearer $authToken'
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('ggggggg$data');
        return data;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(
      String url, Map<String, dynamic>? body) async {
    try {
      // String? authToken = await CacheService().getAuthToken();
      final response =
          await http.delete(Uri.parse(url), body: jsonEncode(body), headers: {
        "Content-Type": "application/json",
        // "Authorization": 'Bearer $authToken'
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data as Map<String, dynamic>;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future put(String url, Map<String, dynamic>? body) async {
    try {
      final response = await http.put(Uri.parse(url),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return data;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get(String url,
      [Map<String, dynamic> body = const {}]) async {
    try {
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data as Map<String, dynamic>;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
