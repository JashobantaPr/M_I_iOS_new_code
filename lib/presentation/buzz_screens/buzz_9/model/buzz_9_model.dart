class UserResponse {
  final List<User> userdata;

  UserResponse({required this.userdata});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    var list = json['user']['userdata'] as List;
    List<User> users = list.map((i) => User.fromJson(i)).toList();

    return UserResponse(userdata: users);
  }
}

class User {
  final String? userIdPk;
  final String? code;
  final String? userTypeIdFk;
  final String? employeeId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? reportingManager;
  final String? dateOfBirth;
  final String? dateOfJoin;
  final String? profile;
  final String? companyIdFk;
  final String? departmentIdFk;
  final String? designationIdFk;
  final String? countryIdFk;
  final String? stateIdFk;
  final String? cityIdFk;
  final String? password;
  final String? userPswd;
  final String? passwordLock;
  final String? address;
  final String? activationStatus;
  final String? activationDate;
  final String? passwordExpired;
  final String? ssoUser;
  final String? passwordUpdatedDate;
  final String? countryCode;
  final String? phoneNumber;
  final String? phnVerify;
  final String? token;
  final String? admin;
  final String? licensed;
  final String? profilePicStatus;
  final String? mailStatus;
  final String? userStatusId;
  final String? active;
  final String? deleted;
  final String? lastFinYearInactive;
  final String? recordDate;
  final String? updateDate;
  final String? documentTypeIdFk;
  final String? documentNumber;
  final String? documentImage;
  final String? allowReporteeCreation;
  final String? migrationUserIdFk;
  final String? isEmailMandatory;
  final String? mailVerify;
  final String? isPhoneMandatory;
  final String? defaultScopeId;
  final String? userCode;
  final String? userStatus;
  final String? userProductRelationshipIdPk;
  final String? userIdFk;
  final String? productIdFk;
  final String? isLicensed;
  final String? isTermsAndCondition;
  final String? licenseDate;
  final String? userTypeIdPk;
  final String? name;
  final String? productIdPk;
  final String? description;
  final String? logo;
  final String? url;
  final String? port;
  final String? updatedOn;
  final String? userRoleRelationshipIdPk;
  final String? userProductRelationshipIdFk;
  final String? rolesIdFk;
  final String? validFrom;
  final String? validTo;
  final String? rolesIdPk;
  final String? roleType;
  final String? type;
  final String? roleTypeId;
  final String? departmentIdPk;
  final String? departCode;
  final String? designationIdPk;
  final String? desigCode;
  final String? userScopeRelIdPk;
  final String? scopeIdFk;
  final String? status;
  final String? deletedBy;
  final String? updatedDate;
  final String? scopeIdPk;
  final String? scopeCode;
  final String? scopeName;
  final String? recordDateScope;
  final String? updateOn;
  final String? dpName;
  final String? dsName;

  User({
    this.userIdPk,
    this.code,
    this.userTypeIdFk,
    this.employeeId,
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
    this.recordDate,
    this.updateDate,
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
    this.userStatus,
    this.userProductRelationshipIdPk,
    this.userIdFk,
    this.productIdFk,
    this.isLicensed,
    this.isTermsAndCondition,
    this.licenseDate,
    this.userTypeIdPk,
    this.name,
    this.productIdPk,
    this.description,
    this.logo,
    this.url,
    this.port,
    this.updatedOn,
    this.userRoleRelationshipIdPk,
    this.userProductRelationshipIdFk,
    this.rolesIdFk,
    this.validFrom,
    this.validTo,
    this.rolesIdPk,
    this.roleType,
    this.type,
    this.roleTypeId,
    this.departmentIdPk,
    this.departCode,
    this.designationIdPk,
    this.desigCode,
    this.userScopeRelIdPk,
    this.scopeIdFk,
    this.status,
    this.deletedBy,
    this.updatedDate,
    this.scopeIdPk,
    this.scopeCode,
    this.scopeName,
    this.recordDateScope,
    this.updateOn,
    this.dpName,
    this.dsName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userIdPk: json['user_id_pk'],
      code: json['code'],
      userTypeIdFk: json['user_type_id_fk'],
      employeeId: json['empoyee_id'],
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
      recordDate: json['recorddate'],
      updateDate: json['updatedate'],
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
      userStatus: json['user_status'],
      userProductRelationshipIdPk: json['user_product_relationship_id_pk'],
      userIdFk: json['user_id_fk'],
      productIdFk: json['product_id_fk'],
      isLicensed: json['Islicensed'],
      isTermsAndCondition: json['is_termsandcondition'],
      licenseDate: json['license_date'],
      userTypeIdPk: json['user_type_id_pk'],
      name: json['name'],
      productIdPk: json['product_id_pk'],
      description: json['description'],
      logo: json['logo'],
      url: json['url'],
      port: json['port'],
      updatedOn: json['updatedon'],
      userRoleRelationshipIdPk: json['user_role_relationship_id_pk'],
      userProductRelationshipIdFk: json['user_product_relationship_id_fk'],
      rolesIdFk: json['roles_id_fk'],
      validFrom: json['valid_from'],
      validTo: json['valid_to'],
      rolesIdPk: json['roles_id_pk'],
      roleType: json['role_type'],
      type: json['type'],
      roleTypeId: json['role_type_id'],
      departmentIdPk: json['department_id_pk'],
      departCode: json['depart_code'],
      designationIdPk: json['designation_id_pk'],
      desigCode: json['desig_code'],
      userScopeRelIdPk: json['user_scope_rel_id_pk'],
      scopeIdFk: json['scope_id_fk'],
      status: json['status'],
      deletedBy: json['deleted_by'],
      updatedDate: json['updated_date'],
      scopeIdPk: json['scope_id_pk'],
      scopeCode: json['scope_code'],
      scopeName: json['scope_name'],
      recordDateScope: json['record_date'],
      updateOn: json['update_on'],
      dpName: json['dpname'],
      dsName: json['dsname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id_pk': userIdPk,
      'code': code,
      'user_type_id_fk': userTypeIdFk,
      'empoyee_id': employeeId,
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
      'recorddate': recordDate,
      'updatedate': updateDate,
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
      'user_status': userStatus,
      'user_product_relationship_id_pk': userProductRelationshipIdPk,
      'user_id_fk': userIdFk,
      'product_id_fk': productIdFk,
      'Islicensed': isLicensed,
      'is_termsandcondition': isTermsAndCondition,
      'license_date': licenseDate,
      'user_type_id_pk': userTypeIdPk,
      'name': name,
      'product_id_pk': productIdPk,
      'description': description,
      'logo': logo,
      'url': url,
      'port': port,
      'updatedon': updatedOn,
      'user_role_relationship_id_pk': userRoleRelationshipIdPk,
      'user_product_relationship_id_fk': userProductRelationshipIdFk,
      'roles_id_fk': rolesIdFk,
      'valid_from': validFrom,
      'valid_to': validTo,
      'roles_id_pk': rolesIdPk,
      'role_type': roleType,
      'type': type,
      'role_type_id': roleTypeId,
      'department_id_pk': departmentIdPk,
      'depart_code': departCode,
      'designation_id_pk': designationIdPk,
      'desig_code': desigCode,
      'user_scope_rel_id_pk': userScopeRelIdPk,
      'scope_id_fk': scopeIdFk,
      'status': status,
      'deleted_by': deletedBy,
      'updated_date': updatedDate,
      'scope_id_pk': scopeIdPk,
      'scope_code': scopeCode,
      'scope_name': scopeName,
      'record_date': recordDateScope,
      'update_on': updateOn,
      'dpname': dpName,
      'dsname': dsName,
    };
  }

  map(Function(dynamic users) param0) {}
}
