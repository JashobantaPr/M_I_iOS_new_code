import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String USERID = "userId";
const String OTP_SESSION = "OTP_session";
const String EMAIL_TOKEN = "emailToken";
const String EMAIL_OTP = "otp";
const String MOBILE_TOKEN = "mobileToken";
const String OTP_TOKEN = "token";
const String PROFILE_STATUS = "status";
const String COMP_ID = "company_id";
const String FIRST_NAME = "first_name";
const String LAST_NAME = "lastName";
const String EMAIL_ID = "emailId";
const String MOBILE_NO = "mobileNo";
const String COMP_CODE = "companyCode";
const String SCOP_ID = "scopId";
const String USER_CODE = "userCode";
const String EMP_ID = "empId";
const String PRODECT_ID = "prodectId";
const String usertoken = "userToken";
const String fcmToken = "fcmToken";
const String ACCESS_CONTROL = "accessControl";
const String ACTIVITIES_DATA = "activities";
const String USER_SCOPE_LIST = "user_scope_list";

const String SCOPE_NAME = 'scopeName';
const String SCOPE_ID = 'scopeId';

class CacheService {
  setCache(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is List<dynamic>) {
      await prefs.setString(key, jsonEncode(value));
    } else if (value is Map<String, dynamic>) {
      await prefs.setString(key, jsonEncode(value));
    }
  }

  getCache(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  setUserId(String userId) {
    setCache(USERID, userId);
  }

  Future<String?> getScopeName() async {
    final ScopeName = await getCache(SCOPE_NAME);
    if (ScopeName == null || ScopeName == "") return null;
    return "$ScopeName";
  }

  Future<String?> getScopeid() async {
    final ScopeId = await getCache(SCOPE_ID);
    if (ScopeId == null || ScopeId == "") return null;
    return "$ScopeId";
  }

  Future<String?> getUserId() async {
    final userId = await getCache(USERID);
    if (userId == null || userId == "") return null;
    return "$userId";
  }

  setUserToken(String userToken) {
    setCache(usertoken, userToken);
  }

  Future<String?> getUserToken() async {
    return await getCache(usertoken);
  }

  setFcmToken(String fcmtoken) {
    setCache(fcmToken, fcmtoken);
  }

  Future<String?> getFcmToken() async {
    return await getCache(fcmToken);
  }

  setCompanyId(String companyId) async {
    setCache(COMP_ID, companyId);
  }

  Future<String?> getCompanyId() async {
    return await getCache(COMP_ID);
  }

  setCompanycode(String companycode) async {
    setCache(COMP_CODE, companycode);
  }

  Future<String?> getCompanyCode() async {
    return await getCache(COMP_CODE);
  }

  removeAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> setAccessControl(Map<String, dynamic> accessControl) async {
    await setCache(ACCESS_CONTROL, accessControl);
    print('accessControl1233 $accessControl');
  }

  Future<Map<String, dynamic>?> getAccessControl() async {
    try {
      final dynamic accessControlData = await getCache(ACCESS_CONTROL);

      if (accessControlData is Map<String, dynamic>) {
        print('Access Control Data: $accessControlData');
        return accessControlData;
      } else if (accessControlData is String) {
        // Decode JSON string to Map<String, dynamic>
        final Map<String, dynamic>? decodedData = jsonDecode(accessControlData);
        // print('Access Control String (Decoded): $decodedData');
        return decodedData;
      } else {
        print(
            'Access Control Data is neither Map nor String: $accessControlData');
        return null;
      }
    } catch (e) {
      print('Failed to retrieve access control data: $e');
      return null;
    }
  }

  Future<void> setActivities(List<dynamic> activities) async {
    await setCache(ACTIVITIES_DATA, activities);
  }

  Future<List<dynamic>?> getActivities() async {
    try {
      final String? activitiesString = await getCache(ACTIVITIES_DATA);

      if (activitiesString != null) {
        return jsonDecode(activitiesString);
      } else {
        return null;
      }
    } catch (e) {
      print('Failed to retrieve activities: $e');
      return null;
    }
  }

  Future<void> setUserScopeList(Map<String, dynamic> userScopeList) async {
    await setCache(USER_SCOPE_LIST, userScopeList);
  }

  Future<Map<String, dynamic>?> getUserScopeList() async {
    try {
      final String? userScopeListString = await getCache(USER_SCOPE_LIST);
      if (userScopeListString != null) {
        return jsonDecode(userScopeListString);
      } else {
        return null;
      }
    } catch (e) {
      print('Failed to retrieve user scope list: $e');
      return null;
    }
  }
}
