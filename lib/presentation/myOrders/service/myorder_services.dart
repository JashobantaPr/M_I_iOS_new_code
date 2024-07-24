import 'dart:convert';
import 'dart:io';

import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myOrders/myorder/models/myorders.model.dart';

import '../../../core/utils/apiservice.dart';
import '../../../core/utils/cache_service.dart';
import '../otp_screen/model/company_profile_model.dart';
import '../otp_screen/model/otp_model.dart';
import '../viewDetails/model/view_details.dart';
import '../viewDetails/model/voucher_details.dart';

class MyorderService {
  final CacheService _cacheService = CacheService();
  Future<List<MyOrdersModel>?> myorder() async {
    try {
      String? _id = await _cacheService.getUserId();
      Map<String, dynamic> body = {'user_id': _id, 'start': '1', 'end': '50'};
      String url = Url.myOrders;
      final response = await ApiService().postHeader(url, body);
      if (response["status"] == "true") {
        List<MyOrdersModel> list = response["orderHistory"]
            .map<MyOrdersModel>((json) => MyOrdersModel.fromJson(json))
            .toList();
        return list;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ViewDetails>?> viewDetails(String? orderId) async {
    String? _id = await _cacheService.getUserId();
    String? company_Id = await _cacheService.getCompanyId();
    try {
      Map<String, dynamic> body = {
        'user_id': _id,
        'c_id': company_Id,
        'order_id': orderId,
      };
      String url = Url.viewDetails;
      final response = await ApiService().postHeader(url, body);
      if (response["status"] == true) {
        List<ViewDetails> list = response["product"]
            .map<ViewDetails>((json) => ViewDetails.fromJson(json))
            .toList();
        return list;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //vouchar Details

  Future<VoucherDetailsModel?> voucharDetailsView(
      String? companyId, String? userId, String? orderid) async {
    try {
      Map<String, dynamic> body = {
        'company_id': companyId,
        'user_id': userId,
        'order_no': orderid
      };
      String url = Url.voucherDisplay;
      final response = await ApiService().postHeader(url, body);
      if (response["status"] == "success") {
        return VoucherDetailsModel.fromJson(response['data']);
      }
      throw HttpException(response["msg"]);
    } catch (e) {
      return null;
    }
  }

  Future<CompanyProfileModel?> companyProfile() async {
    try {
      String? company_Id = await _cacheService.getCompanyId();
      Map<String, dynamic> body = {
        'company_id': company_Id,
      };
      String url = Url.companyProfile;
      final response = await ApiService().postHeader(url, body);
      if (response["type"] == "sidebar") {
        CompanyProfileModel result = CompanyProfileModel.fromJson(response);

        return result;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //otp
  Future<OtpCodeModel?> orderOtp() async {
    try {
      String? _id = await _cacheService.getUserId();
      String? company_Id = await _cacheService.getCompanyId();
      final emailId = await _cacheService.getCache(EMAIL_ID);
      final firstname = await _cacheService.getCache(FIRST_NAME);
      final phoneNumber = await _cacheService.getCache(MOBILE_NO);

      Map<String, dynamic> body = {
        'c_id': company_Id,
        'otp_mode': '1',
        'firstname': firstname,
        'userid': _id,
        'user_email': emailId,
        'phone': phoneNumber,
        'type': 'voucher'
      };
      String url = Url.orderOtp;
      final response = await ApiService().postHeader(url, body);
      if (response["status"] == true) {
        OtpCodeModel result = OtpCodeModel.fromJson(response);
        return result;
      }
    } catch (e) {
      print(e);
    }
  }
}
