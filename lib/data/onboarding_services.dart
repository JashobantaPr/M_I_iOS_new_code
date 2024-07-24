import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/onBoarding/loginWithPassword/model/loginPassword_model.dart';
import 'package:incentivesgit/presentation/onBoarding/resend_verify_mail/controller/resendotpcontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../core/utils/cache_service.dart';
import '../core/utils/custom_snackbar.dart';
import '../core/utils/validation_functions.dart';
import '../presentation/onBoarding/loginWithPassword/controller/loginPassword_controller.dart';
import '../presentation/onBoarding/login_otp/controller/loginOtp_controller.dart';
import '../presentation/onBoarding/login_screen/controller/login_controller.dart';
import '../presentation/onBoarding/new_user_screen/controller/new_user_controller.dart';
import '../presentation/onBoarding/resendotpscreen/controller/resendotpcontroller.dart';
import '../presentation/onBoarding/set_password/controller/set_password_controller.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_image_view.dart';

class OnBoardingServices {
  final CacheService _cacheService = CacheService();
  Future<List<Map<String, dynamic>>?> getCountryDetails() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=k3ul1t2ej8hvbhmrncombn8g86259s33'
    };
    var request =
        http.Request('GET', Uri.parse('${Url.baseUrl}user/getCountryCode/'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      List<dynamic> countryList = json.decode(responseBody);
      List<Map<String, dynamic>> countryDataList = [];
      for (var country in countryList) {
        if (country is Map<String, dynamic>) {
          countryDataList.add(country);
        }
      }
      return countryDataList;
    } else {
      print('Failed to fetch data: ${response.reasonPhrase}');
      return null;
    }
  }

  // Future<bool?> newUser() async {
  //   print('lllllllllllllll');
  //   final userData = Get.find<NewUserController>();

  //   String input = userData.phoneNumberController.text.trim();
  //   String? phoneNumber;
  //   String? email;

  //   if (isNumeric(input) && input.length == 10) {
  //     phoneNumber = input;
  //   } else if (isValidEmail(input)) {
  //     email = input;
  //   } else {
  //     CustomSnackbar().openSnackbar('', 'Invalid input format');
  //   }

  //   if (phoneNumber != null) {
  //     print('Phone Number: $phoneNumber');
  //   } else if (email != null) {
  //     print('Email: $email');
  //   }

  //   var headers = {
  //     'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
  //     'X-API-KEY': 'grgbuzzz',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'Cookie':
  //         '7a2e968c0b376de46a933ec04704fe5ff5f48d42=i9nq2mengqckhsbiv6svos9chrs5k8e2'
  //   };
  //   var request = http.Request(
  //       'POST', Uri.parse('${Url.baseUrl}/login/new_user_validate'));
  //   request.bodyFields = {
  //     'email': email ?? "",
  //     'phone_number': phoneNumber ?? ''
  //   };
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   String responseData = await response.stream.bytesToString();

  //   print('response---------$responseData');

  //   final jsonResponse = jsonDecode(responseData);
  //   if (jsonResponse['mssg_type'] == 'success') {
  //     String? emailToken = jsonResponse["token_email"];
  //     String? mobileToken = jsonResponse["token_mob"];
  //     String? userId = jsonResponse["userid"];
  //     if (emailToken != null) {
  //       await _cacheService.setCache(EMAIL_TOKEN, emailToken);
  //       await _cacheService.setCache(MOBILE_TOKEN, mobileToken);
  //       await _cacheService.setCache(USERID, userId);
  //     }
  //     //   Get.toNamed(AppRoutes.setPasswordScreen);
  //     userData.generateCaptcha();
  //     return true;
  //   } else {
  //     final String message = jsonResponse['mssg'];
  //     print('message---$message');
  //     userData.generateCaptcha();
  //     // CustomSnackbar().openSnackbar('', message);
  //     return false;
  //   }
  // }
  Future<Map<String, dynamic>> newUser() async {
    final userData = Get.find<NewUserController>();

    String input = userData.phoneNumberController.text.trim();
    String? phoneNumber;
    String? email;

    if (userData.isMobileRegistered.value) {
      if (isNumeric(input) && input.length == 10) {
        phoneNumber = input;
      } else {
        userData.validateMsg.value = 'Invalid mobile number';
        return {'success': false, 'message': 'Invalid mobile number'};
      }
    } else {
      if (isValidEmail(input)) {
        email = input;
      } else {
        userData.validateMsg.value = 'Invalid email';
        return {'success': false, 'message': 'Invalid email'};
      }
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=i9nq2mengqckhsbiv6svos9chrs5k8e2'
    };

    var request = http.Request(
        'POST', Uri.parse('${Url.baseUrl}/login/new_user_validate'));
    request.bodyFields = {
      'email': email ?? "",
      'phone_number': phoneNumber ?? ''
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    String responseData = await response.stream.bytesToString();

    final jsonResponse = jsonDecode(responseData);
    if (jsonResponse['mssg_type'] == 'success') {
      String? emailToken = jsonResponse["token_email"];
      String? mobileToken = jsonResponse["token_mob"];
      String? userId = jsonResponse["userid"];
      String? compId = jsonResponse["company_id"];
      String? firstName = jsonResponse["firstname"];
      if (emailToken != null) {
        await _cacheService.setCache(EMAIL_TOKEN, emailToken);
        await _cacheService.setCache(MOBILE_TOKEN, mobileToken);
        await _cacheService.setCache(USERID, userId);
        await _cacheService.setCache(COMP_ID, compId);
        await _cacheService.setCache(FIRST_NAME, firstName);
      }

      Get.snackbar(
        '',
        jsonResponse['mssg'],
        maxWidth: double.maxFinite,
        snackPosition: SnackPosition.BOTTOM,
        borderColor: appTheme.greybordercolour,
        boxShadows: [BoxShadow(blurRadius: 5)],
        padding: EdgeInsets.only(left: 20, bottom: 20),
        borderWidth: 1,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: Duration(seconds: 3),
        backgroundColor: appTheme.white,
        colorText: Colors.black,
        icon: CustomImageView(
          imagePath: ImageConstant.imgLogo1,
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
      );
      Get.toNamed(AppRoutes.setPasswordScreen);
      return {
        'success': true,
        'message': jsonResponse['mssg']
      }; // Success message from backend
    } else {
      final String errorMessage = jsonResponse['mssg'] ?? jsonResponse['error'];

      // Get.toNamed(AppRoutes.setPasswordScreen);
      print('Error message: $errorMessage');
      return {
        'success': false,
        'message': errorMessage
      }; // Failure message from backend
    }
  }

  // Future<String?> login() async {
  //   final loginData = Get.find<LoginController>();
  //   var headers = {
  //     'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
  //     'X-API-KEY': 'grgbuzzz',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'Cookie':
  //         '7a2e968c0b376de46a933ec04704fe5ff5f48d42=6a3s5mc4hj6pu8erc1hbadj10qv4nmmf'
  //   };
  //   var request =
  //       http.Request('POST', Uri.parse('${Url.baseUrl}login/login_user'));
  //   request.bodyFields = {
  //     'country_code': '',
  //     'username': loginData.phoneNumberController.text,
  //     'type': 'app'
  //   };
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     final responseBody = await response.stream.bytesToString();
  //     Map<String, dynamic> jsonResponse = json.decode(responseBody);
  //     print(jsonResponse);

  //     // Optional: Handle the decoded JSON data
  //     if (jsonResponse['status'] == true) {
  //       List<dynamic> userData = jsonResponse['userdata'];
  //       String? userId =
  //           jsonResponse["userdata"][0]["user_id_pk"]; // Extracting user_id_pk
  //       for (var user in userData) {
  //         print('User ID: ${user['user_id_pk']}');
  //         print('First Name: ${user['first_name']}');
  //         print('Last Name: ${user['last_name']}');
  //       }

  //       if (userId != null) {
  //         await _cacheService.setCache(
  //             USERID, userId); // Storing user_id_pk in cache
  //       }
  //     }

  //     Get.toNamed(AppRoutes.loginPassword,
  //         arguments: loginData.phoneNumberController.text);
  //     return null;
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  //   return null;
  // }
  Future<Map<String, dynamic>> login() async {
    final loginData = Get.find<LoginController>();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=9ql8cq126u8lge5s3e3ngr7ftriii9o4'
    };
    var request =
        http.Request('POST', Uri.parse('${Url.baseUrl}login/login_user'));
    request.bodyFields = {
      'country_code': '',
      'username': loginData.phoneNumberController.text,
      'type': 'app'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseData = await response.stream.bytesToString();

    final jsonResponse = jsonDecode(responseData);
    print('Nandan $jsonResponse');
    if (jsonResponse['status'] == true) {
      if (jsonResponse['userdata'] is List &&
          jsonResponse['userdata'].isNotEmpty) {
        Get.toNamed(AppRoutes.loginPassword,
            arguments: loginData.phoneNumberController.text);
        // loginData.phoneNumberController.clear();
        return {'success': true}; // Return success if login is successful
      } else {
        return {'success': false, 'error': 'No user data found'};
      }
    } else {
      final String message = jsonResponse['error'];
      return {
        'success': false,
        'error': message
      }; // Return error message if login fails
    }
  }

  Future<bool?> loginWithOtp() async {
    final loginOtpData = Get.find<LoginOtpController>();
    print('loginOtpData$loginOtpData');
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ptbibnlmuobo8ns82b2sufkvplesa70i'
    };
    var request = http.Request(
        'POST', Uri.parse('${Url.baseUrl}/login/loginwithotpSubmit'));
    request.bodyFields = {'user_id': loginOtpData.receivedMobileNo ?? ""};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    String responseData = await response.stream.bytesToString();

    final jsonResponse = jsonDecode(responseData);
    if (jsonResponse['mssg_type'] == 'success') {
      int? otp = jsonResponse["OTP_session"];
      if (otp != null) {
        await _cacheService.setCache(OTP_SESSION, otp);
      }
      Get.toNamed(AppRoutes.resendotp);
      loginOtpData.generateCaptcha();
      loginOtpData.captchaController.clear();
      return true;
    } else {
      final String message = jsonResponse['mssg'];
      loginOtpData.generateCaptcha();
      CustomSnackbar().openSnackbar('', message);
      return false;
    }
  }

  // Future<bool?> verifyOtp() async {
  //   final otpData = Get.find<ResendOtpController>();
  //   final otp = await _cacheService.getCache(OTP_SESSION);
  //   final data = otpData.otpController.text;
  //   print('data========$otp');
  //   print('otp========${otpData.otpController.text}');
  //   if (otp.toString() != data) {
  //     return true;
  //   } else {
  //     Get.toNamed(AppRoutes.bottomtab);
  //     otpData.otpController.clear();
  //     return false;
  //   }
  // }

  Future<String?> verifyOtpPass(String encryptedPassword) async {
    final otpData = Get.find<SetPasswordController>();
    final mobileOtp = await _cacheService.getCache(MOBILE_TOKEN);
    final mailOtp = await _cacheService.getCache(EMAIL_TOKEN);

    if (mobileOtp.toString() == encryptedPassword ||
        mailOtp.toString() == encryptedPassword) {
      otpData.onSett();
      return null; // No error, OTP is valid
    } else {
      otpData.validateMsg.value = 'Incorrect OTP';
      return 'Incorrect OTP'; // Return error message for invalid OTP
    }
  }

  // Future<bool?> verifyOtpPass(String encryptedPassword) async {
  //   final otpData = Get.find<SetPasswordController>();
  //   final mobileOtp = await _cacheService.getCache(MOBILE_TOKEN);
  //   final mailOtp = await _cacheService.getCache(EMAIL_TOKEN);

  //   if (mobileOtp.toString() == encryptedPassword ||
  //       mailOtp.toString() == encryptedPassword) {
  //     otpData.onSett();

  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  Future<void> setPassword(String password) async {
    final userId = await _cacheService.getCache(USERID);
    final companyId = await _cacheService.getCache(COMP_ID);
    final getData = Get.find<NewUserController>();

    // Define the request headers
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=fsb71vfci9s4p669kqdmmtiett3l81e4'
    };

    // Create the HTTP request
    var request = http.Request(
        'POST', Uri.parse('${Url.baseUrl}login/new_user_verification'));
    request.bodyFields = {
      'password': password,
      'uid': userId,
      'company_id': companyId,
      'verification_type':
          getData.isMobileRegistered.value == true ? 'mobile' : 'email'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);

      // Handle the server response
      if (jsonResponse['status'] == true) {
        String msg = jsonResponse['pass_update_info']['msg'];

        Get.toNamed(AppRoutes.accountverified);
      } else {
        String errorMsg = jsonResponse['error'];
      }
    }
  }

  Future<bool?> verifyToMobile() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=m0jm4en7u71d68vvr6rg6fipdimutfue'
    };
    var request = http.Request(
        'POST', Uri.parse('${Url.baseUrl}/login/email_verify_otp'));

    request.bodyFields = {
      'comp_id': '{{companyid}}',
      'user_id': '{{userid}}',
      'firstname': '{{firstname}}',
      'user_phone': 'viru3.k@grgindia.in'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    String responseData = await response.stream.bytesToString();

    final jsonResponse = jsonDecode(responseData);
    if (jsonResponse['mssg_type'] == 'success') {
      int? otp = jsonResponse["otp"];
      if (otp != null) {
        await _cacheService.setCache(OTP_SESSION, otp);
      }
      Get.toNamed(AppRoutes.resendotp);

      return true;
    } else {
      final String message = jsonResponse['msg_type'];

      CustomSnackbar().openSnackbar('', message);
      return false;
    }
  }

  Future<LoginResponse?> loginWithPass(String password) async {
    final loginData = Get.find<PasswordLoginController>();
    print('encrypetedPassword$password');
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=rbj16g3ga8umdoi4sfke6f6i5l5jrbj8',
    };

    var request =
        http.Request('POST', Uri.parse('${Url.baseUrl}login/user_login'));

    request.bodyFields = {
      'username': loginData.mobileNo,
      'password': password,
      'type': 'app'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('jsonResponsejdfgf ${jsonResponse['user_token']}');

      bool status = jsonResponse['status'] ?? false;

      if (status) {
        bool? profileStatus =
            jsonResponse['user_detail']['userdata'][0]['userstatus'] == '1';
        String? userId =
            jsonResponse['user_detail']['userdata'][0]["user_id_pk"];
        String? compId =
            jsonResponse['user_detail']['userdata'][0]["company_id_fk"];
        String? firstName =
            jsonResponse['user_detail']['userdata'][0]["first_name"];
        String? lastName =
            jsonResponse['user_detail']['userdata'][0]["last_name"];
        String? emailId = jsonResponse['user_detail']['userdata'][0]["email"];
        String? mobileNo =
            jsonResponse['user_detail']['userdata'][0]["phone_number"];
        String? companyCode =
            jsonResponse['user_detail']['userdata'][0]["companycode"];
        String? scopId =
            jsonResponse['user_detail']['userdata'][0]["scope_id_pk"].toString();
        String? userCode =
            jsonResponse['user_detail']['userdata'][0]["user_code"];
        String? empId =
            jsonResponse['user_detail']['userdata'][0]["empoyee_id"];
        String? prodectId =
            jsonResponse['user_detail']['userdata'][0]["product_id_fk"];
        String? userToken = jsonResponse['user_token'];
        Map<String, dynamic> accessControl = jsonResponse['access_control'];
        List<dynamic> activities = jsonResponse['user_detail']['activities'];
        Map<String, dynamic> userScope =
            jsonResponse['user_detail']['userdata'][0]['user_scope_list'];

        if (profileStatus) {
          await _cacheService.setCache(PROFILE_STATUS, profileStatus);
          await _cacheService.setCache(USERID, userId);
          await _cacheService.setCache(COMP_ID, compId);
          await _cacheService.setCache(FIRST_NAME, firstName);
          await _cacheService.setCache(LAST_NAME, lastName);
          await _cacheService.setCache(EMAIL_ID, emailId);
          await _cacheService.setCache(MOBILE_NO, mobileNo);
          await _cacheService.setCache(COMP_CODE, companyCode);
          await _cacheService.setCache(SCOP_ID, scopId);
          await _cacheService.setCache(USER_CODE, userCode);
          await _cacheService.setCache(EMP_ID, empId);
          await _cacheService.setCache(PRODECT_ID, prodectId);
          await _cacheService.setCache(usertoken, userToken);
          await _cacheService.setAccessControl(accessControl);
          await _cacheService.setActivities(activities);
          await _cacheService.setUserScopeList(userScope);

          print('userScope$userScope');
          print('Access Control: $accessControl');
          print('Activities: $activities');
        }

        String? email = jsonResponse['user_detail']['userdata'][0]['email'];
        String? phone =
            jsonResponse['user_detail']['userdata'][0]['phone_number'];

        if (jsonResponse['user_detail']['userdata'][0]['phn_verify'] == '0' &&
            phone != null) {
          Get.offAndToNamed(AppRoutes.userVerification, arguments: phone);
        } else if (jsonResponse['user_detail']['userdata'][0]['mail_verify'] ==
                '0' &&
            email != null) {
          Get.offAndToNamed(AppRoutes.userVerification, arguments: email);
        } else {
          Get.toNamed(AppRoutes.bottomtab);
        }
      } else {
        LoginResponse errorMessage = LoginResponse.fromJson(jsonResponse);
        return errorMessage;
      }
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to fetch data. Reason: ${response.reasonPhrase}');
    }
    return Future.error(json);
  }

  Future<Map<String, dynamic>> verifyMail(String arg) async {
    final userId = await _cacheService.getCache(USERID);
    final compid = await _cacheService.getCache(COMP_ID);
    final firstName = await _cacheService.getCache(FIRST_NAME);
    // Check if arg contains only a mobile number
    final RegExp mobileNumberRegExp = RegExp(r'^[0-9]+$');
    bool isMobileNumber = mobileNumberRegExp.hasMatch(arg);

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1camkqcj7hg8c6l3lthpit4q9vq7fjuo'
    };

    if (isMobileNumber) {
      // Call the phone_verify_otp API
      var request = http.Request(
          'POST', Uri.parse('${Url.baseUrl}/login/phone_verify_otp'));
      request.bodyFields = {
        'comp_id': '80',
        'user_id': userId,
        // 'firstname': firstName,
        'user_phone': arg,
        'country_code': '91',
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print(responseBody);

        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        int? phoneOtp = jsonResponse["otp"];
        String errorMsg = jsonResponse["msg"] ?? '';

        if (phoneOtp != null) {
          await _cacheService.setCache(EMAIL_OTP, phoneOtp);
          Get.toNamed(AppRoutes.resendotpverify, arguments: arg);
          return {'success': true};
        } else {
          return {'success': false, 'error': errorMsg};
        }
      } else {
        print(response.reasonPhrase);
        return {'success': false, 'error': response.reasonPhrase};
      }
    } else {
      // Call the email_verify_otp API
      var request = http.Request(
          'POST', Uri.parse('${Url.baseUrl}/login/email_verify_otp'));
      request.bodyFields = {
        'comp_id': '80',
        'user_id': userId,
        'user_phone': arg,
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        int? emailOtp = jsonResponse["otp"];
        String errorMsg = jsonResponse["msg"] ?? '';

        if (emailOtp != null) {
          await _cacheService.setCache(EMAIL_OTP, emailOtp);
          Get.toNamed(AppRoutes.resendotpverify, arguments: arg);
          return {'success': true};
        } else {
          print('Error message: $errorMsg');
          return {'success': false, 'error': errorMsg};
        }
      } else {
        print(response.reasonPhrase);
        return {'success': false, 'error': response.reasonPhrase};
      }
    }
  }

  Future<String?> verifyOtp() async {
    final otpData = Get.find<ResendOtpVerifyController>();
    final mailOtp = await _cacheService.getCache(EMAIL_OTP);

    if (mailOtp.toString() == otpData.otpController.text) {
      return null;
    } else {
      return 'Incorrect OTP';
    }
  }

  Future<bool?> resendOtp() async {
    final loginOtpData = Get.find<ResendOtpVerifyController>();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ptbibnlmuobo8ns82b2sufkvplesa70i'
    };
    var request = http.Request(
        'POST', Uri.parse('${Url.baseUrl}/login/loginwithotpSubmit'));
    request.bodyFields = {'user_id': loginOtpData.argumentt ?? ""};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    String responseData = await response.stream.bytesToString();

    final jsonResponse = jsonDecode(responseData);
    if (jsonResponse['mssg_type'] == 'success') {
      int? otp = jsonResponse["OTP_session"];
      if (otp != null) {
        await _cacheService.setCache(EMAIL_OTP, otp);
      }

      return true;
    } else {
      final String message = jsonResponse['mssg'];
      CustomSnackbar().openSnackbar('', message);
      return false;
    }
  }

  Future<String?> verifyMaill() async {
    final userId = await _cacheService.getCache(USERID);
    if (userId == null) {
      return 'User ID is null';
    }

    final otpData = Get.find<ResendOtpVerifyController>();
    if (otpData.argumentt == null || otpData.argumentt.isEmpty) {
      return 'Email argument is null or empty';
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1camkqcj7hg8c6l3lthpit4q9vq7fjuo'
    };

    if (otpData.argumentt.replaceAll(' ', '').length == 10 &&
        otpData.argumentt.replaceAll(' ', '').startsWith(RegExp(r'[0-9]'))) {
      // Call update_phone API
      var request =
          http.Request('POST', Uri.parse('${Url.baseUrl}/home/update_phone'));
      request.bodyFields = {
        'user_id': userId,
        'c_id': '80',
        'number': otpData.argumentt,
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);

        if (jsonResponse['status'] == true) {
          return null; // Success, no error message
        } else {
          return jsonResponse['msg'] ?? 'An error occurred';
        }
      } else {
        print(response.reasonPhrase);
        return 'An error occurred: ${response.reasonPhrase}';
      }
    } else {
      // Call update_email API
      var request =
          http.Request('POST', Uri.parse('${Url.baseUrl}/home/update_email'));
      request.bodyFields = {
        'user_id': userId,
        'c_id': '80',
        'email': otpData.argumentt,
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);

        if (jsonResponse['status'] == true) {
          return null; // Success, no error message
        } else {
          return jsonResponse['msg'] ?? 'An error occurred';
        }
      } else {
        print(response.reasonPhrase);
        return 'An error occurred: ${response.reasonPhrase}';
      }
    }
  }

  Future<String?> verifyMailSuccess() async {
    final userId = await _cacheService.getCache(USERID);
    if (userId == null) {
      return 'User ID is null';
    }

    final otpData = Get.find<ResendOtpVerifyController>();
    if (otpData.argumentt == null || otpData.argumentt.isEmpty) {
      return 'Email argument is null or empty';
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1camkqcj7hg8c6l3lthpit4q9vq7fjuo'
    };

    // Determine if the argument is a phone number
    bool isPhoneNumber = otpData.argumentt.replaceAll(' ', '').length == 10 &&
        otpData.argumentt.replaceAll(' ', '').startsWith(RegExp(r'[0-9]'));

    if (isPhoneNumber) {
      // Call update_phone API
      var request =
          http.Request('POST', Uri.parse('${Url.baseUrl}/login/updatephone'));
      request.bodyFields = {'user_id': userId};
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return 'Phone number updated successfully';
      } else {
        return 'Failed to update phone number: ${response.reasonPhrase}';
      }
    } else {
      // Call update_email API
      var request =
          http.Request('POST', Uri.parse('${Url.baseUrl}/login/updateemail'));
      request.bodyFields = {'user_id': userId, 'email': otpData.argumentt};
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return 'Email updated successfully';
      } else {
        return 'Failed to update email: ${response.reasonPhrase}';
      }
    }
  }

//   Future<LoginPasswordModel?> loginWithPass(String password) async {
//   final loginData = Get.find<PasswordLoginController>();

//   var headers = {
//     'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
//     'X-API-KEY': 'grgbuzzz',
//     'Content-Type': 'application/x-www-form-urlencoded',
//     'Cookie':
//         '7a2e968c0b376de46a933ec04704fe5ff5f48d42=rbj16g3ga8umdoi4sfke6f6i5l5jrbj8'
//   };

//   var request = http.Request(
//       'POST', Uri.parse('${Url.baseUrl}login/user_login'));

//   request.bodyFields = {
//     'username': loginData.mobileNo,
//     'password': password,
//   };
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     String responseBody = await response.stream.bytesToString();
//     Map<String, dynamic> jsonResponse = json.decode(responseBody);

//     return LoginPasswordModel.fromJson(jsonResponse);
//   } else {
//     print(response.reasonPhrase);
//     return null;
//   }
// }

  Future<String> confirmOtp() async {
    var data = Get.put(LoginOtpController());
    var otp = Get.put(ResendOtpController());
    final getotp = await _cacheService.getCache(OTP_SESSION);
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3o6snfgu83a7ograub4cith08hnv6ksa'
      };
      var request =
          http.Request('POST', Uri.parse('${Url.baseUrl}login/send_otp'));
      request.bodyFields = {
        'otp': otp.otpController.text,
        'phone_no': data.receivedMobileNo ?? ''
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseData = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseData);
        if (otp.otpController.text.isNotEmpty) {
          if (otp.otpController.text == getotp.toString()) {
            Get.offAndToNamed(AppRoutes.bottomtab);
          } else {
            print(response.reasonPhrase);
            return 'OTP Invalid';
          }
        } else {
          return 'OTP is required';
        }
      } else {
        print(response.reasonPhrase);
        return 'OTP Invalid';
      }
    } catch (e) {
      print('Error: $e');
      return 'OTP Invalid';
    }
    return '';
  }
}
