import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/model/rewards_landing_model.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/model/select_wallet_model.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/model/wallet_balance_model.dart';

class RewardsProducts {
  final CacheService _cacheService = CacheService();
  Future<List<RewardsProduct>> allrewardsProduct() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=qhg4n6cbk62ub6vfspk62i9fm5d2p3p9'
    };
    var request = http.Request('POST', Uri.parse(Url.scopewiserewardsproducts));
    request.bodyFields = {
      'category_id': '0',
      'comid': companyId!,
      'user_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonresponse = jsonDecode(json);
      List<dynamic> productsJson = jsonDecode(jsonresponse['all_products']);
      List<RewardsProduct> products =
          productsJson.map((json) => RewardsProduct.fromJson(json)).toList();
      return products;
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<WalletTypesResponse> selectWallet() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ma9d558fjegscajlguovbkcfm7cue8sg'
    };
    var request = http.Request('POST', Uri.parse(Url.wallettypes));
    request.bodyFields = {
      'bucket_expired_status': '0',
      'company_id': companyId!,
      'user_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonresponse = jsonDecode(json);
      if (jsonresponse['status'] == true &&
          jsonresponse['type_lists'] != null) {
        return WalletTypesResponse.fromJson(jsonresponse);
      } else {
        return WalletTypesResponse(
          status: false,
          typeLists: [],
        );
      }
    } else {
      print(response.reasonPhrase);
      return WalletTypesResponse(
        status: false,
        typeLists: [],
      );
    }
  }

  Future<List<String>> categorySelection() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=563g5770hi3a2jh0o69n26rckboc5ri1'
    };
    var request = http.Request('POST', Uri.parse(Url.rewardCategories));
    request.bodyFields = {'company_id': companyId!, 'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonresponse = jsonDecode(json);
      if (jsonresponse['status'] == true &&
          jsonresponse['category_list'] != null) {
        return List<String>.from(jsonresponse['category_list']);
      } else {
        return [];
      }
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<GetBudgetBalance?> addPoints() async {
    String? comapanyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=0445hmo7tulklf4ggpr6nbe4spfr1ife'
    };
    var request = http.Request('POST', Uri.parse(Url.mywalletpointapi));
    request.bodyFields = {'c_id': comapanyId!, 'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      if (jsonResponse != null && jsonResponse['getbudget'] != null) {
        GetBudgetBalance getBudget =
            GetBudgetBalance.fromJson(jsonResponse['getbudget']);
        return getBudget;
      } else {
        return null;
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
