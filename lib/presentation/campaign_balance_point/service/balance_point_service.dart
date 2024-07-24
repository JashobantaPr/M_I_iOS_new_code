import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/campaign_balance_point/model/transactionHistory_model.dart';

class BalancePointsService {
  final CacheService _cacheService = CacheService();

  Future<List<UserPointsModel>> transactiondata(int year) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3r2lr3a2bdco5tjt4l5qarh268jd0pld'
    };
    var request =
        http.Request('POST', Uri.parse(Url.getwalletdgetbalacepointsetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'from_date': '01-01-$year',
      'to_date': '31-12-$year',
      'transaction_type': '4'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseString);

      if (jsonResponse['users'] != null) {
        final List<dynamic> usersJson = jsonResponse['users'];
        print('dfkhf ${usersJson}');
        final List<UserPointsModel> usersList = usersJson
            .map((userJson) => UserPointsModel.fromJson(userJson))
            .toList();
        print('dkfbf $usersList');
        return usersList;
      } else {
        return [];
      }
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<List<UserPointsModel>> allTransactions() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3r2lr3a2bdco5tjt4l5qarh268jd0pld'
    };
    var request =
        http.Request('POST', Uri.parse(Url.getwalletdgetbalacepointsetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'transaction_type': '4'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseString);

      if (jsonResponse['users'] != null) {
        final List<dynamic> usersJson = jsonResponse['users'];
        final List<UserPointsModel> usersList = usersJson
            .map((userJson) => UserPointsModel.fromJson(userJson))
            .toList();
        return usersList;
      } else {
        return [];
      }
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }
}
