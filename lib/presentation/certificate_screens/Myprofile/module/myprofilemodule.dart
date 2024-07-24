class UserProfile {
  final String userCode;
  final String userIdPk;
  final String dpName;
  final String address;
  final String dsName;
  final String departmentIdFk;
  final String companyIdFk;
  final String designationIdFk;
  final String companyName;
  final String isLicensed;
  final String userProductRelationshipIdPk;
  final String userRoleRelationshipIdPk;
  final String productIdPk;
  final String countryIdFk;
  final String userTypeIdFk;
  final String name;
  final String stateIdFk;
  final String cityIdFk;
  final String reportingManager;
  final String employeeId;
  final String firstName;
  final String lastName;
  final String scopeIdFk;
  final String doj;
  final String dateOfJoin;
  final String dob;
  final String dateOfBirth;
  final String country;
  final String state;
  final String city;
  final String email;
  final String roleName;
  final String roleId;
  final String recordDate;
  final String status;
  final String userStatus;
  final String profile;
  final String countryCode;
  final String phoneNumber;
  final String phnVerify;
  final String productName;
  final String password;
  final String userPswd;
  final String isEmailMandatory;
  final String companyIsPhoneMandatory;
  final String isPhoneMandatory;
  final String userType;
  final String ssoUser;
  final String productActive;
  final dynamic documentName;
  final dynamic documentNumber;
  final String documentTypeIdFk;
  final dynamic documentImage;
  final String allowReporteeCreation;
  final String companyCode;
  final String docImg;
  final String addedBy;
  final String scopeNames;
  final String iso;
  final String countryName;

  UserProfile({
    required this.userCode,
    required this.userIdPk,
    required this.dpName,
    required this.address,
    required this.dsName,
    required this.departmentIdFk,
    required this.companyIdFk,
    required this.designationIdFk,
    required this.companyName,
    required this.isLicensed,
    required this.userProductRelationshipIdPk,
    required this.userRoleRelationshipIdPk,
    required this.productIdPk,
    required this.countryIdFk,
    required this.userTypeIdFk,
    required this.name,
    required this.stateIdFk,
    required this.cityIdFk,
    required this.reportingManager,
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.scopeIdFk,
    required this.doj,
    required this.dateOfJoin,
    required this.dob,
    required this.dateOfBirth,
    required this.country,
    required this.state,
    required this.city,
    required this.email,
    required this.roleName,
    required this.roleId,
    required this.recordDate,
    required this.status,
    required this.userStatus,
    required this.profile,
    required this.countryCode,
    required this.phoneNumber,
    required this.phnVerify,
    required this.productName,
    required this.password,
    required this.userPswd,
    required this.isEmailMandatory,
    required this.companyIsPhoneMandatory,
    required this.isPhoneMandatory,
    required this.userType,
    required this.ssoUser,
    required this.productActive,
    this.documentName,
    this.documentNumber,
    required this.documentTypeIdFk,
    this.documentImage,
    required this.allowReporteeCreation,
    required this.companyCode,
    required this.docImg,
    required this.addedBy,
    required this.scopeNames,
    required this.iso,
    required this.countryName,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userCode: json['user_code'] ?? '',
      userIdPk: json['user_id_pk'] ?? '',
      dpName: json['dp_name'] ?? '',
      address: json['address'] ?? '',
      dsName: json['ds_name'] ?? '',
      departmentIdFk: json['department_id_fk'] ?? '',
      companyIdFk: json['company_id_fk'] ?? '',
      designationIdFk: json['designation_id_fk'] ?? '',
      companyName: json['companyname'] ?? '',
      isLicensed: json['Islicensed'] ?? '',
      userProductRelationshipIdPk:
          json['user_product_relationship_id_pk'] ?? '',
      userRoleRelationshipIdPk: json['user_role_relationship_id_pk'] ?? '',
      productIdPk: json['product_id_pk'] ?? '',
      countryIdFk: json['country_id_fk'] ?? '',
      userTypeIdFk: json['user_type_id_fk'] ?? '',
      name: json['name'] ?? '',
      stateIdFk: json['state_id_fk'] ?? '',
      cityIdFk: json['city_id_fk'] ?? '',
      reportingManager: json['reporting_manager'] ?? '',
      employeeId: json['empoyee_id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      scopeIdFk: json['scope_id_fk'] ?? '',
      doj: json['doj'] ?? '',
      dateOfJoin: json['date_of_join'] ?? '',
      dob: json['dob'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      email: json['email'] ?? '',
      roleName: json['rolename'] ?? '',
      roleId: json['roleid'] ?? '',
      recordDate: json['recorddate'] ?? '',
      status: json['status'] ?? '',
      userStatus: json['user_status'] ?? '',
      profile: json['profile'] ?? '',
      countryCode: json['country_code'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      phnVerify: json['phn_verify'] ?? '',
      productName: json['productname'] ?? '',
      password: json['password'] ?? '',
      userPswd: json['user_pswd'] ?? '',
      isEmailMandatory: json['is_email_mandatory'] ?? '',
      companyIsPhoneMandatory: json['company_is_phone_mandatory'] ?? '',
      isPhoneMandatory: json['is_phone_mandatory'] ?? '',
      userType: json['u_type'] ?? '',
      ssoUser: json['sso_user'] ?? '',
      productActive: json['productActive'] ?? '',
      documentName: json['document_name'],
      documentNumber: json['document_number'],
      documentTypeIdFk: json['document_type_id_fk'] ?? '',
      documentImage: json['document_image'],
      allowReporteeCreation: json['allow_reportee_creation'] ?? '',
      companyCode: json['company_code'] ?? '',
      docImg: json['doc_img'] ?? '',
      addedBy: json['added_by'] ?? '',
      scopeNames: json['scope_names'] ?? '',
      iso: json['iso'] ?? '',
      countryName: json['CountryName'] ?? '',
    );
  }
}

class ProfileData {
  final List<UserProfile> userdata;
  final List<Country> countries;
  final List<UserType> userTypes;
  final List<Department> departments;
  final List<Designation> designations;

  ProfileData({
    required this.userdata,
    required this.countries,
    required this.userTypes,
    required this.departments,
    required this.designations,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    var userdataList = json['userdata'] as List<dynamic>;
    var countriesList = json['countries'] as List<dynamic>;
    var userTypesList = json['user_types'] as List<dynamic>;
    var departmentsList = json['department'] as List<dynamic>;
    var designationsList = json['designation'] as List<dynamic>;

    List<UserProfile> userdata =
        userdataList.map((e) => UserProfile.fromJson(e)).toList();
    List<Country> countries =
        countriesList.map((e) => Country.fromJson(e)).toList();
    List<UserType> userTypes =
        userTypesList.map((e) => UserType.fromJson(e)).toList();
    List<Department> departments =
        departmentsList.map((e) => Department.fromJson(e)).toList();
    List<Designation> designations =
        designationsList.map((e) => Designation.fromJson(e)).toList();

    return ProfileData(
      userdata: userdata,
      countries: countries,
      userTypes: userTypes,
      departments: departments,
      designations: designations,
    );
  }
}

class Country {
  final String countryIdPk;
  final String name;
  final String active;
  final String deleted;

  Country({
    required this.countryIdPk,
    required this.name,
    required this.active,
    required this.deleted,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryIdPk: json['country_id_pk'] ?? '',
      name: json['name'] ?? '',
      active: json['active'] ?? '',
      deleted: json['deleted'] ?? '',
    );
  }
}

class UserType {
  final String userTypeIdPk;
  final String name;
  final String active;

  UserType({
    required this.userTypeIdPk,
    required this.name,
    required this.active,
  });

  factory UserType.fromJson(Map<String, dynamic> json) {
    return UserType(
      userTypeIdPk: json['user_type_id_pk'] ?? '',
      name: json['name'] ?? '',
      active: json['active'] ?? '',
    );
  }
}

class Department {
  final String departmentIdPk;
  final String name;
  final String active;

  Department({
    required this.departmentIdPk,
    required this.name,
    required this.active,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentIdPk: json['department_id_pk'] ?? '',
      name: json['name'] ?? '',
      active: json['active'] ?? '',
    );
  }
}

class Designation {
  final String designationIdPk;
  final String name;
  final String active;

  Designation({
    required this.designationIdPk,
    required this.name,
    required this.active,
  });

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      designationIdPk: json['designation_id_pk'] ?? '',
      name: json['name'] ?? '',
      active: json['active'] ?? '',
    );
  }
}
