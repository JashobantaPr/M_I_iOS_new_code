import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/buzz_screens/commentsdata/model/commentsdatamodel.dart';

class CommentsDataService {
  final CacheService _cacheService = CacheService();
  Future<CommentsResponse?> allcomments() async {
    String? userId = await _cacheService.getUserId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=8shholtmn472hptniudet19hdovgmsen'
    };
    var request = http.Request('POST', Uri.parse(Url.getallcommentapi));
    request.bodyFields = {
      'type': 'All',
      'own_id': userId!,
      'post_id': Get.arguments
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('jsonResponse  $jsonResponse');
      return CommentsResponse.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<int?> commentslikeCount() async {
    try {
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
          'https://staging.myincentives.co.in/index.php/apis//home/showCommentLikes',
        ),
      );
      request.bodyFields = {
        'type': 'comm_likes',
        'postid': '6251',
        'commentid': '2782'
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = json.decode(responseBody);
        print('hfbhsf${jsonResponse['like_count']}');
        // Convert the like count to an int
        int likeCount = int.parse(jsonResponse['like_count'].toString());
        return likeCount; // Return the like count as a Future<int>
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print('Error fetching comment like count: $e');
      return null;
    }
  }

  Future<bool?> deletecomment(String commentId) async {
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1gsceors3i1bicuna4ob7b6ud9thmj0u'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/delete_post_comment'));
    request.bodyFields = {
      'postid': Get.arguments,
      'userid': userId!,
      'comment_id': commentId,
      'status': '1'
    };
    print('request.bodyFields${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('jsonResponse${jsonResponse}');

      return jsonResponse['status'];
    } else {
      print(response.reasonPhrase);
      return false;
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
}
