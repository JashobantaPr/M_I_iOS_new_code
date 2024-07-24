class MyPrimeryModel {
  ProfileData? profileData;

  MyPrimeryModel({
    this.profileData,
  });

  MyPrimeryModel.fromJson(Map<String, dynamic> json) {
    profileData = json['profile_data'] != null
        ? new ProfileData.fromJson(json['profile_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profileData != null) {
      data['profile_data'] = this.profileData!.toJson();
    }
    return data;
  }
}

class ProfileData {
  List<Userdata>? userdata;
  List<Countries>? countries;
  List<UserTypes>? userTypes;
  String? reportingMng;
  List<Department>? department;
  List<Designation>? designation;
  ProductRoles? productRoles;
  List<Scopes>? scopes;

  ProfileData(
      {this.userdata,
      this.countries,
      this.userTypes,
      this.reportingMng,
      this.department,
      this.designation,
      this.productRoles,
      this.scopes});

  ProfileData.fromJson(Map<String, dynamic> json) {
    if (json['userdata'] != null) {
      userdata = <Userdata>[];
      json['userdata'].forEach((v) {
        userdata!.add(new Userdata.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
    if (json['user_types'] != null) {
      userTypes = <UserTypes>[];
      json['user_types'].forEach((v) {
        userTypes!.add(new UserTypes.fromJson(v));
      });
    }
    reportingMng = json['reportingMng'];
    if (json['department'] != null) {
      department = <Department>[];
      json['department'].forEach((v) {
        department!.add(new Department.fromJson(v));
      });
    }
    if (json['designation'] != null) {
      designation = <Designation>[];
      json['designation'].forEach((v) {
        designation!.add(new Designation.fromJson(v));
      });
    }
    productRoles = json['productRoles'] != null
        ? new ProductRoles.fromJson(json['productRoles'])
        : null;
    if (json['scopes'] != null) {
      scopes = <Scopes>[];
      json['scopes'].forEach((v) {
        scopes!.add(new Scopes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userdata != null) {
      data['userdata'] = this.userdata!.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    if (this.userTypes != null) {
      data['user_types'] = this.userTypes!.map((v) => v.toJson()).toList();
    }
    data['reportingMng'] = this.reportingMng;
    if (this.department != null) {
      data['department'] = this.department!.map((v) => v.toJson()).toList();
    }
    if (this.designation != null) {
      data['designation'] = this.designation!.map((v) => v.toJson()).toList();
    }
    if (this.productRoles != null) {
      data['productRoles'] = this.productRoles!.toJson();
    }
    if (this.scopes != null) {
      data['scopes'] = this.scopes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Userdata {
  String? userCode;
  String? userIdPk;
  String? dpName;
  String? address;
  String? dsName;
  String? departmentIdFk;
  String? companyIdFk;
  String? designationIdFk;
  String? companyname;
  String? islicensed;
  String? userProductRelationshipIdPk;
  String? userRoleRelationshipIdPk;
  String? productIdPk;
  String? countryIdFk;
  String? userTypeIdFk;
  String? name;
  String? stateIdFk;
  String? cityIdFk;
  String? reportingManager;
  String? empoyeeId;
  String? firstName;
  String? lastName;
  String? scopeIdFk;
  String? doj;
  String? dateOfJoin;
  String? dob;
  String? dateOfBirth;
  String? country;
  String? state;
  String? city;
  String? email;
  String? rolename;
  String? roleid;
  String? recorddate;
  String? status;
  String? userStatus;
  String? profile;
  String? countryCode;
  String? phoneNumber;
  String? phnVerify;
  String? productname;
  String? password;
  String? userPswd;
  String? isEmailMandatory;
  String? companyIsPhoneMandatory;
  String? isPhoneMandatory;
  String? uType;
  String? ssoUser;
  String? productActive;
  String? documentName;
  String? documentNumber;
  String? documentTypeIdFk;
  String? documentImage;
  String? allowReporteeCreation;
  String? companyCode;
  String? docImg;
  String? addedBy;
  String? scopeNames;
  String? iso;
  String? countryName;

  Userdata(
      {this.userCode,
      this.userIdPk,
      this.dpName,
      this.address,
      this.dsName,
      this.departmentIdFk,
      this.companyIdFk,
      this.designationIdFk,
      this.companyname,
      this.islicensed,
      this.userProductRelationshipIdPk,
      this.userRoleRelationshipIdPk,
      this.productIdPk,
      this.countryIdFk,
      this.userTypeIdFk,
      this.name,
      this.stateIdFk,
      this.cityIdFk,
      this.reportingManager,
      this.empoyeeId,
      this.firstName,
      this.lastName,
      this.scopeIdFk,
      this.doj,
      this.dateOfJoin,
      this.dob,
      this.dateOfBirth,
      this.country,
      this.state,
      this.city,
      this.email,
      this.rolename,
      this.roleid,
      this.recorddate,
      this.status,
      this.userStatus,
      this.profile,
      this.countryCode,
      this.phoneNumber,
      this.phnVerify,
      this.productname,
      this.password,
      this.userPswd,
      this.isEmailMandatory,
      this.companyIsPhoneMandatory,
      this.isPhoneMandatory,
      this.uType,
      this.ssoUser,
      this.productActive,
      this.documentName,
      this.documentNumber,
      this.documentTypeIdFk,
      this.documentImage,
      this.allowReporteeCreation,
      this.companyCode,
      this.docImg,
      this.addedBy,
      this.scopeNames,
      this.iso,
      this.countryName});

  Userdata.fromJson(Map<String, dynamic> json) {
    userCode = json['user_code'];
    userIdPk = json['user_id_pk'];
    dpName = json['dp_name'];
    address = json['address'];
    dsName = json['ds_name'];
    departmentIdFk = json['department_id_fk'];
    companyIdFk = json['company_id_fk'];
    designationIdFk = json['designation_id_fk'];
    companyname = json['companyname'];
    islicensed = json['Islicensed'];
    userProductRelationshipIdPk = json['user_product_relationship_id_pk'];
    userRoleRelationshipIdPk = json['user_role_relationship_id_pk'];
    productIdPk = json['product_id_pk'];
    countryIdFk = json['country_id_fk'];
    userTypeIdFk = json['user_type_id_fk'];
    name = json['name'];
    stateIdFk = json['state_id_fk'];
    cityIdFk = json['city_id_fk'];
    reportingManager = json['reporting_manager'];
    empoyeeId = json['empoyee_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    scopeIdFk = json['scope_id_fk'];
    doj = json['doj'];
    dateOfJoin = json['date_of_join'];
    dob = json['dob'];
    dateOfBirth = json['date_of_birth'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    email = json['email'];
    rolename = json['rolename'];
    roleid = json['roleid'];
    recorddate = json['recorddate'];
    status = json['status'];
    userStatus = json['user_status'];
    profile = json['profile'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    phnVerify = json['phn_verify'];
    productname = json['productname'];
    password = json['password'];
    userPswd = json['user_pswd'];
    isEmailMandatory = json['is_email_mandatory'];
    companyIsPhoneMandatory = json['company_is_phone_mandatory'];
    isPhoneMandatory = json['is_phone_mandatory'];
    uType = json['u_type'];
    ssoUser = json['sso_user'];
    productActive = json['productActive'];
    documentName = json['document_name'];
    documentNumber = json['document_number'];
    documentTypeIdFk = json['document_type_id_fk'];
    documentImage = json['document_image'];
    allowReporteeCreation = json['allow_reportee_creation'];
    companyCode = json['company_code'];
    docImg = json['doc_img'];
    addedBy = json['added_by'];
    scopeNames = json['scope_names'];
    iso = json['iso'];
    countryName = json['CountryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_code'] = this.userCode;
    data['user_id_pk'] = this.userIdPk;
    data['dp_name'] = this.dpName;
    data['address'] = this.address;
    data['ds_name'] = this.dsName;
    data['department_id_fk'] = this.departmentIdFk;
    data['company_id_fk'] = this.companyIdFk;
    data['designation_id_fk'] = this.designationIdFk;
    data['companyname'] = this.companyname;
    data['Islicensed'] = this.islicensed;
    data['user_product_relationship_id_pk'] = this.userProductRelationshipIdPk;
    data['user_role_relationship_id_pk'] = this.userRoleRelationshipIdPk;
    data['product_id_pk'] = this.productIdPk;
    data['country_id_fk'] = this.countryIdFk;
    data['user_type_id_fk'] = this.userTypeIdFk;
    data['name'] = this.name;
    data['state_id_fk'] = this.stateIdFk;
    data['city_id_fk'] = this.cityIdFk;
    data['reporting_manager'] = this.reportingManager;
    data['empoyee_id'] = this.empoyeeId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['scope_id_fk'] = this.scopeIdFk;
    data['doj'] = this.doj;
    data['date_of_join'] = this.dateOfJoin;
    data['dob'] = this.dob;
    data['date_of_birth'] = this.dateOfBirth;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['email'] = this.email;
    data['rolename'] = this.rolename;
    data['roleid'] = this.roleid;
    data['recorddate'] = this.recorddate;
    data['status'] = this.status;
    data['user_status'] = this.userStatus;
    data['profile'] = this.profile;
    data['country_code'] = this.countryCode;
    data['phone_number'] = this.phoneNumber;
    data['phn_verify'] = this.phnVerify;
    data['productname'] = this.productname;
    data['password'] = this.password;
    data['user_pswd'] = this.userPswd;
    data['is_email_mandatory'] = this.isEmailMandatory;
    data['company_is_phone_mandatory'] = this.companyIsPhoneMandatory;
    data['is_phone_mandatory'] = this.isPhoneMandatory;
    data['u_type'] = this.uType;
    data['sso_user'] = this.ssoUser;
    data['productActive'] = this.productActive;
    data['document_name'] = this.documentName;
    data['document_number'] = this.documentNumber;
    data['document_type_id_fk'] = this.documentTypeIdFk;
    data['document_image'] = this.documentImage;
    data['allow_reportee_creation'] = this.allowReporteeCreation;
    data['company_code'] = this.companyCode;
    data['doc_img'] = this.docImg;
    data['added_by'] = this.addedBy;
    data['scope_names'] = this.scopeNames;
    data['iso'] = this.iso;
    data['CountryName'] = this.countryName;
    return data;
  }
}

class Countries {
  String? countryIdPk;
  String? name;
  String? active;
  String? deleted;

  Countries({this.countryIdPk, this.name, this.active, this.deleted});

  Countries.fromJson(Map<String, dynamic> json) {
    countryIdPk = json['country_id_pk'];
    name = json['name'];
    active = json['active'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id_pk'] = this.countryIdPk;
    data['name'] = this.name;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    return data;
  }
}

class UserTypes {
  String? userTypeIdPk;
  String? name;
  String? active;

  UserTypes({this.userTypeIdPk, this.name, this.active});

  UserTypes.fromJson(Map<String, dynamic> json) {
    userTypeIdPk = json['user_type_id_pk'];
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_type_id_pk'] = this.userTypeIdPk;
    data['name'] = this.name;
    data['active'] = this.active;
    return data;
  }
}

class Department {
  String? departmentIdPk;
  String? departCode;
  String? companyIdFk;
  String? name;
  String? description;
  String? active;
  String? deleted;
  String? recorddate;
  String? updatedon;

  Department(
      {this.departmentIdPk,
      this.departCode,
      this.companyIdFk,
      this.name,
      this.description,
      this.active,
      this.deleted,
      this.recorddate,
      this.updatedon});

  Department.fromJson(Map<String, dynamic> json) {
    departmentIdPk = json['department_id_pk'];
    departCode = json['depart_code'];
    companyIdFk = json['company_id_fk'];
    name = json['name'];
    description = json['description'];
    active = json['active'];
    deleted = json['deleted'];
    recorddate = json['recorddate'];
    updatedon = json['updatedon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id_pk'] = this.departmentIdPk;
    data['depart_code'] = this.departCode;
    data['company_id_fk'] = this.companyIdFk;
    data['name'] = this.name;
    data['description'] = this.description;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['recorddate'] = this.recorddate;
    data['updatedon'] = this.updatedon;
    return data;
  }
}

class Designation {
  String? designationIdPk;
  String? desigCode;
  String? companyIdFk;
  String? name;
  String? description;
  String? active;
  String? deleted;
  String? recorddate;
  String? updatedon;

  Designation(
      {this.designationIdPk,
      this.desigCode,
      this.companyIdFk,
      this.name,
      this.description,
      this.active,
      this.deleted,
      this.recorddate,
      this.updatedon});

  Designation.fromJson(Map<String, dynamic> json) {
    designationIdPk = json['designation_id_pk'];
    desigCode = json['desig_code'];
    companyIdFk = json['company_id_fk'];
    name = json['name'];
    description = json['description'];
    active = json['active'];
    deleted = json['deleted'];
    recorddate = json['recorddate'];
    updatedon = json['updatedon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['designation_id_pk'] = this.designationIdPk;
    data['desig_code'] = this.desigCode;
    data['company_id_fk'] = this.companyIdFk;
    data['name'] = this.name;
    data['description'] = this.description;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['recorddate'] = this.recorddate;
    data['updatedon'] = this.updatedon;
    return data;
  }
}

class ProductRoles {
  String? productId;
  String? productName;
  String? productStatus;

  ProductRoles({this.productId, this.productName, this.productStatus});

  ProductRoles.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productStatus = json['productStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productStatus'] = this.productStatus;
    return data;
  }
}

class Scopes {
  String? scopeIdPk;
  String? scopeCode;
  String? companyIdFk;
  String? scopeName;
  String? description;
  String? active;
  String? deleted;
  String? recordDate;
  String? updateOn;

  Scopes(
      {this.scopeIdPk,
      this.scopeCode,
      this.companyIdFk,
      this.scopeName,
      this.description,
      this.active,
      this.deleted,
      this.recordDate,
      this.updateOn});

  Scopes.fromJson(Map<String, dynamic> json) {
    scopeIdPk = json['scope_id_pk'];
    scopeCode = json['scope_code'];
    companyIdFk = json['company_id_fk'];
    scopeName = json['scope_name'];
    description = json['description'];
    active = json['active'];
    deleted = json['deleted'];
    recordDate = json['record_date'];
    updateOn = json['update_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scope_id_pk'] = this.scopeIdPk;
    data['scope_code'] = this.scopeCode;
    data['company_id_fk'] = this.companyIdFk;
    data['scope_name'] = this.scopeName;
    data['description'] = this.description;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['record_date'] = this.recordDate;
    data['update_on'] = this.updateOn;
    return data;
  }
}
