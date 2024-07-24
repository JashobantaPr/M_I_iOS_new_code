import 'dart:convert';

class ApiResponse {
  final String? serverUrl;
  final Requester? requester;
  final Approver? approver;
  final Detail? detail;
  final PayoutData? payoutData;
  final String? campaignBudget;
  final String? status;

  ApiResponse({
    this.serverUrl,
    this.requester,
    this.approver,
    this.detail,
    this.payoutData,
    this.campaignBudget,
    this.status,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      serverUrl: json['serverUrl'],
      requester: json['requester'] != null
          ? Requester.fromJson(json['requester'])
          : null,
      approver:
          json['approver'] != null ? Approver.fromJson(json['approver']) : null,
      detail: json['detail'] != null ? Detail.fromJson(json['detail']) : null,
      payoutData: json['payout_data'] != null
          ? PayoutData.fromJson(json['payout_data'])
          : null,
      campaignBudget: json['campaign_budget'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serverUrl': serverUrl,
      'requester': requester?.toJson(),
      'approver': approver?.toJson(),
      'detail': detail?.toJson(),
      'payout_data': payoutData?.toJson(),
      'campaign_budget': campaignBudget,
      'status': status,
    };
  }
}

class Requester {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final String? userIdPk;
  final String? country;
  final String? dpname;
  final String? dsname;
  final String? scope;
  final String? state;
  final String? city;
  final String? roleName;
  final String? departmentIdFk;
  final String? designationIdFk;
  final String? scopeIdPk;
  final String? dateOfBirth;
  final String? rolesIdPk;
  final String? countryCode;
  final String? phoneNumber;
  final String? empoyeeId;
  final String? userStatusId;

  Requester({
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
    this.userIdPk,
    this.country,
    this.dpname,
    this.dsname,
    this.scope,
    this.state,
    this.city,
    this.roleName,
    this.departmentIdFk,
    this.designationIdFk,
    this.scopeIdPk,
    this.dateOfBirth,
    this.rolesIdPk,
    this.countryCode,
    this.phoneNumber,
    this.empoyeeId,
    this.userStatusId,
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
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'profile': profile,
      'user_id_pk': userIdPk,
      'country': country,
      'dpname': dpname,
      'dsname': dsname,
      'scope': scope,
      'state': state,
      'city': city,
      'roleName': roleName,
      'department_id_fk': departmentIdFk,
      'designation_id_fk': designationIdFk,
      'scope_id_pk': scopeIdPk,
      'date_of_birth': dateOfBirth,
      'roles_id_pk': rolesIdPk,
      'country_code': countryCode,
      'phone_number': phoneNumber,
      'empoyee_id': empoyeeId,
      'user_status_id': userStatusId,
    };
  }
}

class Approver {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final String? userIdPk;
  final String? country;
  final String? dpname;
  final String? dsname;
  final String? scope;
  final String? state;
  final String? city;
  final String? roleName;
  final String? departmentIdFk;
  final String? designationIdFk;
  final String? scopeIdPk;
  final String? dateOfBirth;
  final String? rolesIdPk;
  final String? countryCode;
  final String? phoneNumber;
  final String? empoyeeId;
  final String? userStatusId;

  Approver({
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
    this.userIdPk,
    this.country,
    this.dpname,
    this.dsname,
    this.scope,
    this.state,
    this.city,
    this.roleName,
    this.departmentIdFk,
    this.designationIdFk,
    this.scopeIdPk,
    this.dateOfBirth,
    this.rolesIdPk,
    this.countryCode,
    this.phoneNumber,
    this.empoyeeId,
    this.userStatusId,
  });

  factory Approver.fromJson(Map<String, dynamic> json) {
    return Approver(
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
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'profile': profile,
      'user_id_pk': userIdPk,
      'country': country,
      'dpname': dpname,
      'dsname': dsname,
      'scope': scope,
      'state': state,
      'city': city,
      'roleName': roleName,
      'department_id_fk': departmentIdFk,
      'designation_id_fk': designationIdFk,
      'scope_id_pk': scopeIdPk,
      'date_of_birth': dateOfBirth,
      'roles_id_pk': rolesIdPk,
      'country_code': countryCode,
      'phone_number': phoneNumber,
      'empoyee_id': empoyeeId,
      'user_status_id': userStatusId,
    };
  }
}

class Detail {
  final String? programId;
  final String? campaignName;
  final String? addedBy;
  final String? requestDate;
  final String? requestId;
  final String? statusId;
  final String? statusName;
  final String? approverId;
  final String? approvedDate;
  final String? comment;
  final String? programCode;

  Detail({
    this.programId,
    this.campaignName,
    this.addedBy,
    this.requestDate,
    this.requestId,
    this.statusId,
    this.statusName,
    this.approverId,
    this.approvedDate,
    this.comment,
    this.programCode,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      programId: json['program_id'],
      campaignName: json['campaign_name'],
      addedBy: json['added_by'],
      requestDate: json['request_date'],
      requestId: json['request_id'],
      statusId: json['status_id'],
      statusName: json['status_name'],
      approverId: json['approver_id'],
      approvedDate: json['approved_date'],
      comment: json['comment'],
      programCode: json['program_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'campaign_name': campaignName,
      'added_by': addedBy,
      'request_date': requestDate,
      'request_id': requestId,
      'status_id': statusId,
      'status_name': statusName,
      'approver_id': approverId,
      'approved_date': approvedDate,
      'comment': comment,
      'program_code': programCode,
    };
  }
}

class PayoutData {
  final Data? data;

  PayoutData({this.data});

  factory PayoutData.fromJson(Map<String, dynamic> json) {
    return PayoutData(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
    };
  }
}

class Data {
  final List<String>? positivePoints;
  final List<String>? negativePoints;
  final List<String>? zeroPoints;
  final List<String>? errorPoints;

  Data({
    this.positivePoints,
    this.negativePoints,
    this.zeroPoints,
    this.errorPoints,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      positivePoints: json['positive_points'] != null
          ? List<String>.from(json['positive_points'])
          : null,
      negativePoints: json['negative_points'] != null
          ? List<String>.from(json['negative_points'])
          : null,
      zeroPoints: json['zero_points'] != null
          ? List<String>.from(json['zero_points'])
          : null,
      errorPoints: json['error_points'] != null
          ? List<String>.from(json['error_points'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'positive_points': positivePoints,
      'negative_points': negativePoints,
      'zero_points': zeroPoints,
      'error_points': errorPoints,
    };
  }
}
