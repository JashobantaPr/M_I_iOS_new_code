class LoginPasswordModel {
  String? userIdPk;
  String? departmentIdFk;
  String? designationIdFk;
  String? companyIdFk;
  String? firstName;
  String? lastName;
  String? profile;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? employeeId;
  String? allowReporteeCreation;
  String? ssoUser;
  String? code;
  String? uType;
  String? rolesIdFk;
  String? country;
  String? userStatus;
  String? isTermsAndCondition;
  String? productIdFk;
  String? isLicensed;
  String? state;
  String? city;
  String? companyLogo;
  String? url;
  String? productLogo;
  String? departmentName;
  String? designationName;
  String? roleName;
  String? type;
  String? companyCode;
  String? companyName;
  String? roleType;
  String? scopeNames;
  String? scopeIds;
  String? enableSso;
  String? defaultScopeId;
  String? passwordLock;
  String? passwordExpired;
  String? isEmailMandatory;
  String? mailVerify;
  String? isPhoneMandatory;
  String? phnVerify;
  String? userPswd;
  String? fullname;
  String? iso;

  LoginPasswordModel.fromJson(Map<String, dynamic> json) {
    userIdPk = json['user_id_pk'];
    departmentIdFk = json['department_id_fk'];
    designationIdFk = json['designation_id_fk'];
    companyIdFk = json['company_id_fk'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profile = json['profile'];
    email = json['email'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    employeeId = json['empoyee_id'];
    allowReporteeCreation = json['allow_reportee_creation'];
    ssoUser = json['sso_user'];
    code = json['code'];
    uType = json['u_type'];
    rolesIdFk = json['roles_id_fk'];
    country = json['country'];
    userStatus = json['userstatus'];
    isTermsAndCondition = json['is_termsandcondition'];
    productIdFk = json['product_id_fk'];
    isLicensed = json['Islicensed'];
    state = json['state'];
    city = json['city'];
    companyLogo = json['company_logo'];
    url = json['url'];
    productLogo = json['product_logo'];
    departmentName = json['departmentName'];
    designationName = json['designationName'];
    roleName = json['role_name'];
    type = json['type'];
    companyCode = json['companycode'];
    companyName = json['companyName'];
    roleType = json['role_type'];
    scopeNames = json['scope_names'];
    scopeIds = json['scope_ids'];
    enableSso = json['enable_sso'];
    defaultScopeId = json['default_scope_id'];
    passwordLock = json['password_lock'];
    passwordExpired = json['password_expired'];
    isEmailMandatory = json['is_email_mandatory'];
    mailVerify = json['mail_verify'];
    isPhoneMandatory = json['is_phone_mandatory'];
    phnVerify = json['phn_verify'];
    userPswd = json['user_pswd'];
    fullname = json['fullname'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id_pk'] = userIdPk;
    data['department_id_fk'] = departmentIdFk;
    data['designation_id_fk'] = designationIdFk;
    data['company_id_fk'] = companyIdFk;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile'] = profile;
    data['email'] = email;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['empoyee_id'] = employeeId;
    data['allow_reportee_creation'] = allowReporteeCreation;
    data['sso_user'] = ssoUser;
    data['code'] = code;
    data['u_type'] = uType;
    data['roles_id_fk'] = rolesIdFk;
    data['country'] = country;
    data['userstatus'] = userStatus;
    data['is_termsandcondition'] = isTermsAndCondition;
    data['product_id_fk'] = productIdFk;
    data['Islicensed'] = isLicensed;
    data['state'] = state;
    data['city'] = city;
    data['company_logo'] = companyLogo;
    data['url'] = url;
    data['product_logo'] = productLogo;
    data['departmentName'] = departmentName;
    data['designationName'] = designationName;
    data['role_name'] = roleName;
    data['type'] = type;
    data['companycode'] = companyCode;
    data['companyName'] = companyName;
    data['role_type'] = roleType;
    data['scope_names'] = scopeNames;
    data['scope_ids'] = scopeIds;
    data['enable_sso'] = enableSso;
    data['default_scope_id'] = defaultScopeId;
    data['password_lock'] = passwordLock;
    data['password_expired'] = passwordExpired;
    data['is_email_mandatory'] = isEmailMandatory;
    data['mail_verify'] = mailVerify;
    data['is_phone_mandatory'] = isPhoneMandatory;
    data['phn_verify'] = phnVerify;
    data['user_pswd'] = userPswd;
    data['fullname'] = fullname;
    data['iso'] = iso;
    return data;
  }
}

class LoginResponse {
  final bool status;
  final String error;
  final int passwordFailed;
  final String passwordFailedAttempts;
  final int sessFlag;
  final String passwordLockMessage;

  LoginResponse({
    required this.status,
    required this.error,
    required this.passwordFailed,
    required this.passwordFailedAttempts,
    required this.sessFlag,
    required this.passwordLockMessage,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      error: json['error'],
      passwordFailed: json['password_failed'],
      passwordFailedAttempts: json['password_failed_attempts'],
      sessFlag: json['sess_flag'],
      passwordLockMessage: json['password_lock_message'],
    );
  }
}
