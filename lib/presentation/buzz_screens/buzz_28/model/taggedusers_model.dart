class TaggedUsersResponse {
  String? functionType;
  String? postId;
  bool? status; // Added status field
  Map<String, User>? usersAwards;
  List<PostPoint>? postPoints;

  TaggedUsersResponse({
    this.functionType,
    this.postId,
    this.status, // Added status to constructor
    this.usersAwards,
    this.postPoints,
  });

  factory TaggedUsersResponse.fromJson(Map<String, dynamic> json) {
    var usersAwardsMap = json['usersawards'] as Map<String, dynamic>?;
    Map<String, User>? usersAwards;
    if (usersAwardsMap != null) {
      usersAwards = usersAwardsMap
          .map((key, value) => MapEntry(key, User.fromJson(value)));
    }

    return TaggedUsersResponse(
      functionType: json['functiontype'],
      postId: json['postid'],
      status: json['status'], // Map status
      usersAwards: usersAwards,
      postPoints: json['post_points'] != null
          ? List<PostPoint>.from(
              json['post_points'].map((x) => PostPoint.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    var usersAwardsMap =
        usersAwards?.map((key, value) => MapEntry(key, value.toJson()));
    return {
      'functiontype': functionType,
      'postid': postId,
      'status': status, // Include status in toJson
      'usersawards': usersAwardsMap,
      'post_points': postPoints != null
          ? List<PostPoint>.from(postPoints!.map((x) => x.toJson()))
          : [],
    };
  }
}

class User {
  String? userIdPk;
  String? code;
  String? userTypeIdFk;
  String? employeeId; // Corrected spelling
  String? firstName;
  String? lastName;
  String? email;
  String? reportingManager;
  String? dateOfBirth;
  String? dateOfJoin;
  String? profile;
  String? companyIdFk;
  String? departmentIdFk;
  String? designationIdFk;
  String? countryIdFk;
  String? stateIdFk;
  String? cityIdFk;
  String? password;
  String? userPswd;
  String? passwordLock;
  String? address;
  String? activationStatus;
  String? activationDate;
  String? passwordExpired;
  String? ssoUser;
  String? passwordUpdatedDate;
  String? countryCode;
  String? phoneNumber;
  String? phnVerify;
  String? token;
  String? admin;
  String? licensed;
  String? profilePicStatus;
  String? mailStatus;
  String? userStatusId;
  String? active;
  String? deleted;
  String? lastFinYearInactive;
  String? recorddate;
  String? updatedate;
  String? documentTypeIdFk;
  String? documentNumber;
  String? documentImage;
  String? allowReporteeCreation;
  String? migrationUserIdFk;
  String? isEmailMandatory;
  String? mailVerify;
  String? isPhoneMandatory;
  String? defaultScopeId;
  String? userCode;
  String? registeredEntity;
  String? registeredEntityName;
  String? addedUserType;
  String? country;
  String? state;
  String? city;
  String? roleName;

  User({
    this.userIdPk,
    this.code,
    this.userTypeIdFk,
    this.employeeId, // Corrected spelling
    this.firstName,
    this.lastName,
    this.email,
    this.reportingManager,
    this.dateOfBirth,
    this.dateOfJoin,
    this.profile,
    this.companyIdFk,
    this.departmentIdFk,
    this.designationIdFk,
    this.countryIdFk,
    this.stateIdFk,
    this.cityIdFk,
    this.password,
    this.userPswd,
    this.passwordLock,
    this.address,
    this.activationStatus,
    this.activationDate,
    this.passwordExpired,
    this.ssoUser,
    this.passwordUpdatedDate,
    this.countryCode,
    this.phoneNumber,
    this.phnVerify,
    this.token,
    this.admin,
    this.licensed,
    this.profilePicStatus,
    this.mailStatus,
    this.userStatusId,
    this.active,
    this.deleted,
    this.lastFinYearInactive,
    this.recorddate,
    this.updatedate,
    this.documentTypeIdFk,
    this.documentNumber,
    this.documentImage,
    this.allowReporteeCreation,
    this.migrationUserIdFk,
    this.isEmailMandatory,
    this.mailVerify,
    this.isPhoneMandatory,
    this.defaultScopeId,
    this.userCode,
    this.registeredEntity,
    this.registeredEntityName,
    this.addedUserType,
    this.country,
    this.state,
    this.city,
    this.roleName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userIdPk: json['user_id_pk'],
        code: json['code'],
        userTypeIdFk: json['user_type_id_fk'],
        employeeId: json['empoyee_id'], // Keep as is for backward compatibility
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        reportingManager: json['reporting_manager'],
        dateOfBirth: json['date_of_birth'],
        dateOfJoin: json['date_of_join'],
        profile: json['profile'],
        companyIdFk: json['company_id_fk'],
        departmentIdFk: json['department_id_fk'],
        designationIdFk: json['designation_id_fk'],
        countryIdFk: json['country_id_fk'],
        stateIdFk: json['state_id_fk'],
        cityIdFk: json['city_id_fk'],
        password: json['password'],
        userPswd: json['user_pswd'],
        passwordLock: json['password_lock'],
        address: json['address'],
        activationStatus: json['activation_status'],
        activationDate: json['activation_date'],
        passwordExpired: json['password_expired'],
        ssoUser: json['sso_user'],
        passwordUpdatedDate: json['password_updated_date'],
        countryCode: json['country_code'],
        phoneNumber: json['phone_number'],
        phnVerify: json['phn_verify'],
        token: json['token'],
        admin: json['admin'],
        licensed: json['licensed'],
        profilePicStatus: json['profile_pic_status'],
        mailStatus: json['mail_status'],
        userStatusId: json['user_status_id'],
        active: json['active'],
        deleted: json['deleted'],
        lastFinYearInactive: json['lastFinYearInactive'],
        recorddate: json['recorddate'],
        updatedate: json['updatedate'],
        documentTypeIdFk: json['document_type_id_fk'],
        documentNumber: json['document_number'],
        documentImage: json['document_image'],
        allowReporteeCreation: json['allow_reportee_creation'],
        migrationUserIdFk: json['migration_user_id_fk'],
        isEmailMandatory: json['is_email_mandatory'],
        mailVerify: json['mail_verify'],
        isPhoneMandatory: json['is_phone_mandatory'],
        defaultScopeId: json['default_scope_id'],
        userCode: json['user_code'],
        registeredEntity: json['registered_entity'],
        registeredEntityName: json['registered_entity_name'],
        addedUserType: json['added_user_type'],
        country: json['country'],
        state: json['state'],
        city: json['city'],
        roleName: json['roleName'],
      );

  Map<String, dynamic> toJson() => {
        'user_id_pk': userIdPk,
        'code': code,
        'user_type_id_fk': userTypeIdFk,
        'empoyee_id': employeeId, // Updated here for consistency
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'reporting_manager': reportingManager,
        'date_of_birth': dateOfBirth,
        'date_of_join': dateOfJoin,
        'profile': profile,
        'company_id_fk': companyIdFk,
        'department_id_fk': departmentIdFk,
        'designation_id_fk': designationIdFk,
        'country_id_fk': countryIdFk,
        'state_id_fk': stateIdFk,
        'city_id_fk': cityIdFk,
        'password': password,
        'user_pswd': userPswd,
        'password_lock': passwordLock,
        'address': address,
        'activation_status': activationStatus,
        'activation_date': activationDate,
        'password_expired': passwordExpired,
        'sso_user': ssoUser,
        'password_updated_date': passwordUpdatedDate,
        'country_code': countryCode,
        'phone_number': phoneNumber,
        'phn_verify': phnVerify,
        'token': token,
        'admin': admin,
        'licensed': licensed,
        'profile_pic_status': profilePicStatus,
        'mail_status': mailStatus,
        'user_status_id': userStatusId,
        'active': active,
        'deleted': deleted,
        'lastFinYearInactive': lastFinYearInactive,
        'recorddate': recorddate,
        'updatedate': updatedate,
        'document_type_id_fk': documentTypeIdFk,
        'document_number': documentNumber,
        'document_image': documentImage,
        'allow_reportee_creation': allowReporteeCreation,
        'migration_user_id_fk': migrationUserIdFk,
        'is_email_mandatory': isEmailMandatory,
        'mail_verify': mailVerify,
        'is_phone_mandatory': isPhoneMandatory,
        'default_scope_id': defaultScopeId,
        'user_code': userCode,
        'registered_entity': registeredEntity,
        'registered_entity_name': registeredEntityName,
        'added_user_type': addedUserType,
        'country': country,
        'state': state,
        'city': city,
        'roleName': roleName,
      };
}

class PostPoint {
  String? deductedPoints;
  String? cmsuserIDTo;

  PostPoint({
    this.deductedPoints,
    this.cmsuserIDTo,
  });

  factory PostPoint.fromJson(Map<String, dynamic> json) => PostPoint(
        deductedPoints: json['deducted_points'],
        cmsuserIDTo: json['cms_user_id_to'],
      );

  Map<String, dynamic> toJson() => {
        'deducted_points': deductedPoints,
        'cms_user_id_to': cmsuserIDTo,
      };
}
