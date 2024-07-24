class UserResponse {
  Department? department;
  Designation? designation;
  String scopeName;
  ScopesData? scopesData;
  RolesData? rolesData;
  Hierarchy? hierarchy;
  String serverUrl;
  List<Detail> detail;
  Requester? requester;
  String status;

  UserResponse({
    required this.department,
    required this.designation,
    required this.scopeName,
    required this.scopesData,
    required this.rolesData,
    required this.hierarchy,
    required this.serverUrl,
    required this.detail,
    required this.requester,
    required this.status,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      department: json['department'] != null ? Department.fromJson(json['department']) : null,
      designation: json['designation'] != null ? Designation.fromJson(json['designation']) : null,
      scopeName: json['scope_name'],
      scopesData: json['scopes_data'] != null ? ScopesData.fromJson(json['scopes_data']) : null,
      rolesData: json['roles_data'] != null ? RolesData.fromJson(json['roles_data']) : null,
      hierarchy: json['hierarchy'] != null ? Hierarchy.fromJson(json['hierarchy']) : null,
      serverUrl: json['serverUrl'],
      detail: List<Detail>.from(json['detail'].map((x) => Detail.fromJson(x))),
      requester: json['requester'] != null ? Requester.fromJson(json['requester']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['department'] = department?.toJson();
    data['designation'] = designation?.toJson();
    data['scope_name'] = scopeName;
    data['scopes_data'] = scopesData?.toJson();
    data['roles_data'] = rolesData?.toJson();
    data['hierarchy'] = hierarchy?.toJson();
    data['serverUrl'] = serverUrl;
    data['detail'] = detail.map((x) => x.toJson()).toList();
    data['requester'] = requester?.toJson();
    data['status'] = status;
    return data;
  }
}

class Department {
  String departmentIdPk;
  String departCode;
  String companyIdFk;
  String name;
  String description;
  String active;
  String deleted;
  String recorddate;
  dynamic updatedon;

  Department({
    required this.departmentIdPk,
    required this.departCode,
    required this.companyIdFk,
    required this.name,
    required this.description,
    required this.active,
    required this.deleted,
    required this.recorddate,
    required this.updatedon,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentIdPk: json['department_id_pk'],
      departCode: json['depart_code'],
      companyIdFk: json['company_id_fk'],
      name: json['name'],
      description: json['description'],
      active: json['active'],
      deleted: json['deleted'],
      recorddate: json['recorddate'],
      updatedon: json['updatedon'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['department_id_pk'] = departmentIdPk;
    data['depart_code'] = departCode;
    data['company_id_fk'] = companyIdFk;
    data['name'] = name;
    data['description'] = description;
    data['active'] = active;
    data['deleted'] = deleted;
    data['recorddate'] = recorddate;
    data['updatedon'] = updatedon;
    return data;
  }
}

class Designation {
  String designationIdPk;
  String desigCode;
  String companyIdFk;
  String name;
  String description;
  String active;
  String deleted;
  String recorddate;
  dynamic updatedon;

  Designation({
    required this.designationIdPk,
    required this.desigCode,
    required this.companyIdFk,
    required this.name,
    required this.description,
    required this.active,
    required this.deleted,
    required this.recorddate,
    required this.updatedon,
  });

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      designationIdPk: json['designation_id_pk'],
      desigCode: json['desig_code'],
      companyIdFk: json['company_id_fk'],
      name: json['name'],
      description: json['description'],
      active: json['active'],
      deleted: json['deleted'],
      recorddate: json['recorddate'],
      updatedon: json['updatedon'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['designation_id_pk'] = designationIdPk;
    data['desig_code'] = desigCode;
    data['company_id_fk'] = companyIdFk;
    data['name'] = name;
    data['description'] = description;
    data['active'] = active;
    data['deleted'] = deleted;
    data['recorddate'] = recorddate;
    data['updatedon'] = updatedon;
    return data;
  }
}

class ScopesData {
  String scopeName;

  ScopesData({
    required this.scopeName,
  });

  factory ScopesData.fromJson(Map<String, dynamic> json) {
    return ScopesData(
      scopeName: json['scope_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scope_name'] = scopeName;
    return data;
  }
}

class RolesData {
  String rolesIdPk;
  String productIdFk;
  String code;
  String name;
  String description;
  String roleType;
  String type;
  String active;
  String deleted;
  String recorddate;
  dynamic updatedon;

  RolesData({
    required this.rolesIdPk,
    required this.productIdFk,
    required this.code,
    required this.name,
    required this.description,
    required this.roleType,
    required this.type,
    required this.active,
    required this.deleted,
    required this.recorddate,
    required this.updatedon,
  });

  factory RolesData.fromJson(Map<String, dynamic> json) {
    return RolesData(
      rolesIdPk: json['roles_id_pk'],
      productIdFk: json['product_id_fk'],
      code: json['code'],
      name: json['name'],
      description: json['description'],
      roleType: json['role_type'],
      type: json['type'],
      active: json['active'],
      deleted: json['deleted'],
      recorddate: json['recorddate'],
      updatedon: json['updatedon'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roles_id_pk'] = rolesIdPk;
    data['product_id_fk'] = productIdFk;
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;
    data['role_type'] = roleType;
    data['type'] = type;
    data['active'] = active;
    data['deleted'] = deleted;
    data['recorddate'] = recorddate;
    data['updatedon'] = updatedon;
    return data;
  }
}

class Hierarchy {
  String hierarchyN2;
  String hierarchyN1;
  String hierarchyN;

  Hierarchy({
    required this.hierarchyN2,
    required this.hierarchyN1,
    required this.hierarchyN,
  });

  factory Hierarchy.fromJson(Map<String, dynamic> json) {
    return Hierarchy(
      hierarchyN2: json['hierarchy_n_2'],
      hierarchyN1: json['hierarchy_n_1'],
      hierarchyN: json['hierarchy_n'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hierarchy_n_2'] = hierarchyN2;
    data['hierarchy_n_1'] = hierarchyN1;
    data['hierarchy_n'] = hierarchyN;
    return data;
  }
}

class Detail {
  String departmentIdFk;
  String designationIdFk;
  dynamic countryIdFk;
  dynamic cityIdFk;
  dynamic stateIdFk;
  String fkRolesId;
  String fkScopeId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String updatedate;
  String recorddate;
  dynamic approverDate;
  String empoyeeId;
  String reporteeUserAddedBy;
  String fkReporteeLevelId;
  String fkReporteeRuleId;
  String fkUserCreateTableId;
  String entityCode;
  String budgetRequestId;
  String addedBy;
  String status;
  dynamic comment;
  String statusId;
  String profile;
  dynamic approverName;
  dynamic approverEmail;
  String nodePath;
  String userNodes;
  String approvalDelegated;
  String approverDelegateId;
  String entityId;
  String countryCode;

  Detail({
    required this.departmentIdFk,
    required this.designationIdFk,
    required this.countryIdFk,
    required this.cityIdFk,
    required this.stateIdFk,
    required this.fkRolesId,
    required this.fkScopeId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.updatedate,
    required this.recorddate,
    required this.approverDate,
    required this.empoyeeId,
    required this.reporteeUserAddedBy,
    required this.fkReporteeLevelId,
    required this.fkReporteeRuleId,
    required this.fkUserCreateTableId,
    required this.entityCode,
    required this.budgetRequestId,
    required this.addedBy,
    required this.status,
    required this.comment,
    required this.statusId,
    required this.profile,
    required this.approverName,
    required this.approverEmail,
    required this.nodePath,
    required this.userNodes,
    required this.approvalDelegated,
    required this.approverDelegateId,
    required this.entityId,
    required this.countryCode,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      departmentIdFk: json['department_id_fk'],
      designationIdFk: json['designation_id_fk'],
      countryIdFk: json['country_id_fk'],
      cityIdFk: json['city_id_fk'],
      stateIdFk: json['state_id_fk'],
      fkRolesId: json['fk_roles_id'],
      fkScopeId: json['fk_scope_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      updatedate: json['updatedate'],
      recorddate: json['recorddate'],
      approverDate: json['approver_date'],
      empoyeeId: json['empoyee_id'],
      reporteeUserAddedBy: json['reportee_user_added_by'],
      fkReporteeLevelId: json['fk_reportee_level_id'],
      fkReporteeRuleId: json['fk_reportee_rule_id'],
      fkUserCreateTableId: json['fk_user_create_table_id'],
      entityCode: json['entity_code'],
      budgetRequestId: json['budget_request_id'],
      addedBy: json['added_by'],
      status: json['status'],
      comment: json['comment'],
      statusId: json['status_id'],
      profile: json['profile'],
      approverName: json['approver_name'],
      approverEmail: json['approver_email'],
      nodePath: json['node_path'],
      userNodes: json['user_nodes'],
      approvalDelegated: json['approval_delegated'],
      approverDelegateId: json['approver_delegate_id'],
      entityId: json['entity_id'],
      countryCode: json['country_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['department_id_fk'] = departmentIdFk;
    data['designation_id_fk'] = designationIdFk;
    data['country_id_fk'] = countryIdFk;
    data['city_id_fk'] = cityIdFk;
    data['state_id_fk'] = stateIdFk;
    data['fk_roles_id'] = fkRolesId;
    data['fk_scope_id'] = fkScopeId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['updatedate'] = updatedate;
    data['recorddate'] = recorddate;
    data['approver_date'] = approverDate;
    data['empoyee_id'] = empoyeeId;
    data['reportee_user_added_by'] = reporteeUserAddedBy;
    data['fk_reportee_level_id'] = fkReporteeLevelId;
    data['fk_reportee_rule_id'] = fkReporteeRuleId;
    data['fk_user_create_table_id'] = fkUserCreateTableId;
    data['entity_code'] = entityCode;
    data['budget_request_id'] = budgetRequestId;
    data['added_by'] = addedBy;
    data['status'] = status;
    data['comment'] = comment;
    data['status_id'] = statusId;
    data['profile'] = profile;
    data['approver_name'] = approverName;
    data['approver_email'] = approverEmail;
    data['node_path'] = nodePath;
    data['user_nodes'] = userNodes;
    data['approval_delegated'] = approvalDelegated;
    data['approver_delegate_id'] = approverDelegateId;
    data['entity_id'] = entityId;
    data['country_code'] = countryCode;
    return data;
  }
}

class Requester {
  String firstName;
  String lastName;
  String email;
  String profile;
  String userIdPk;
  String country;
  String dpname;
  String dsname;
  String scope;
  String state;
  String city;
  String roleName;
  String departmentIdFk;
  String designationIdFk;
  String scopeIdPk;
  String dateOfBirth;
  String rolesIdPk;
  String countryCode;
  String phoneNumber;
  String empoyeeId;
  String userStatusId;

  Requester({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profile,
    required this.userIdPk,
    required this.country,
    required this.dpname,
    required this.dsname,
    required this.scope,
    required this.state,
    required this.city,
    required this.roleName,
    required this.departmentIdFk,
    required this.designationIdFk,
    required this.scopeIdPk,
    required this.dateOfBirth,
    required this.rolesIdPk,
    required this.countryCode,
    required this.phoneNumber,
    required this.empoyeeId,
    required this.userStatusId,
  });

  factory Requester.fromJson(Map<String, dynamic> json) {
    return Requester(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profile: json['profile'],
      userIdPk: json['user_id_pk'],
      country: json['country'],
      dpname: json['dpname'],
      dsname: json['dsname'],
      scope: json['scope'],
      state: json['state'],
      city: json['city'],
      roleName: json['roleName'],
      departmentIdFk: json['department_id_fk'],
      designationIdFk: json['designation_id_fk'],
      scopeIdPk: json['scope_id_pk'],
      dateOfBirth: json['date_of_birth'],
      rolesIdPk: json['roles_id_pk'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      empoyeeId: json['empoyee_id'],
      userStatusId: json['user_status_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['profile'] = profile;
    data['user_id_pk'] = userIdPk;
    data['country'] = country;
    data['dpname'] = dpname;
    data['dsname'] = dsname;
    data['scope'] = scope;
    data['state'] = state;
    data['city'] = city;
    data['roleName'] = roleName;
    data['department_id_fk'] = departmentIdFk;
    data['designation_id_fk'] = designationIdFk;
    data['scope_id_pk'] = scopeIdPk;
    data['date_of_birth'] = dateOfBirth;
    data['roles_id_pk'] = rolesIdPk;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['empoyee_id'] = empoyeeId;
    data['user_status_id'] = userStatusId;
    return data;
  }
}
