import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/activecampaignmodel.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/campaignmodel.dart';

import '../model/tiermodel.dart';

class Campaignservices {
  final CacheService _cacheService = CacheService();
  Future<Pointscount?> totalpoints() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=9i5tmcr4rkatgv5ge2sv1eu3dpgf3voe'
    };
    var request = http.Request('POST', Uri.parse(Url.pointscount));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final dataList = jsonResponse['data'] as List<dynamic>;
      if (dataList.isNotEmpty) {
        final Map<String, dynamic> data =
            dataList.first as Map<String, dynamic>;
        return Pointscount.fromJson(data);
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print('Failed to fetch points: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<List<ActiveCampaigns>?> campaigns() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=tb9aptmlbfs1npoal25grs07bus6s5uk'
    };
    var request = http.Request('POST', Uri.parse(Url.campaigns));
    request.bodyFields = {
      'company_id': companyId!,
      'c_code': companyCode!,
      'user_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final campaignList = jsonResponse['prog_list'] as List<dynamic>;
      if (campaignList.isNotEmpty) {
        return campaignList
            .map((data) => ActiveCampaigns.fromJson(data))
            .toList();
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<String>?> fetchBanners() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=76pelfo3qlogq8os3ph2nhu4nve1ujvm'
    };
    var request = http.Request('POST', Uri.parse(Url.banners));
    request.bodyFields = {
      'company_id': companyId!,
      'c_code': companyCode!,
      'user_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final List<dynamic> bannerList = jsonResponse['banners'];
      final List<String> bannerUrls = bannerList
          .expand((banner) => (banner['banner_url'] as String).split(','))
          .where((url) => url.isNotEmpty)
          .toSet()
          .toList();
      return bannerUrls;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String?> displaybanner() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=gaiegjsqagb2q0l54k24iijjfhjr1o7o'
    };
    var request = http.Request('POST', Uri.parse(Url.bannersaccess));
    request.bodyFields = {'company_id': companyId!, 'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final banneraccess = jsonResponse['0']['show_banner'];
      return banneraccess;
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  Future<String?> programterminologytext() async {
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=p5p9neeekgtplgp4c82vvum0d562s5um'
    };
    var request =
        http.Request('GET', Uri.parse('${Url.companyprofile}$companyId'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final terminologytext =
          jsonResponse['company_details']['program_terminology_text'];
      if (terminologytext.isNotEmpty) {
        return terminologytext;
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  Future<TierDataResponse?> tierdata() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=krbpl85aeqoh3b5oktr99idqmfqe52c7'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/Tier_management/get_user_tier_details'));
    request.bodyFields = {'company_id': '80', 'user_id': '61493'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> json = jsonDecode(responseBody);
      return TierDataResponse.fromJson(json);
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
