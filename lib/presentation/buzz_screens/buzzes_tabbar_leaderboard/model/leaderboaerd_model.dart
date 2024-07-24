class ApiResponse {
  String byMe;
  String forMe;
  Map<String, RankDetails> allRank;
  String userIds;
  String rank;
  Map<String, UserDetails> users;

  ApiResponse({
    required this.byMe,
    required this.forMe,
    required this.allRank,
    required this.userIds,
    required this.rank,
    required this.users,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var allRankJson = json['allrank'] as Map<String, dynamic>;
    var allRankMap = allRankJson.map((key, value) => MapEntry(key, RankDetails.fromJson(value)));

    var usersJson = json['users'] as Map<String, dynamic>;
    var usersMap = usersJson.map((key, value) => MapEntry(key, UserDetails.fromJson(value)));

    return ApiResponse(
      byMe: json['by_me'] as String,
      forMe: json['for_me'] as String,
      allRank: allRankMap,
      userIds: json['user_ids'] as String,
      rank: json['rank'] as String,
      users: usersMap,
    );
  }

  Map<String, dynamic> toJson() {
    var allRankJson = allRank.map((key, value) => MapEntry(key, value.toJson()));
    var usersJson = users.map((key, value) => MapEntry(key, value.toJson()));

    return {
      'by_me': byMe,
      'for_me': forMe,
      'allrank': allRankJson,
      'user_ids': userIds,
      'rank': rank,
      'users': usersJson,
    };
  }
}

class RankDetails {
  String userIdFk;
  String count;
  String prevCurr;
  String currCount;
  String ranks;

  RankDetails({
    required this.userIdFk,
    required this.count,
    required this.prevCurr,
    required this.currCount,
    required this.ranks,
  });

  factory RankDetails.fromJson(Map<String, dynamic> json) {
    return RankDetails(
      userIdFk: json['user_id_fk'] as String,
      count: json['count'] as String,
      prevCurr: json['@prevs:=@curr'] as String,
      currCount: json['@curr:=count'] as String,
      ranks: json['ranks'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id_fk': userIdFk,
      'count': count,
      '@prevs:=@curr': prevCurr,
      '@curr:=count': currCount,
      'ranks': ranks,
    };
  }
}

class UserDetails {
  String firstName;
  String lastName;
  String email;
  String profile;
  String userIdPk;
  String? country;
  String dpName;
  String dsName;
  String scope;
  String? state;
  String? city;
  String roleName;
  String departmentIdFk;
  String designationIdFk;
  String scopeIdPk;
  String dateOfBirth;
  String rolesIdPk;
  String countryCode;
  String? phoneNumber;
  String? employeeId;
  String userStatusId;

  UserDetails({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profile,
    required this.userIdPk,
    this.country,
    required this.dpName,
    required this.dsName,
    required this.scope,
    this.state,
    this.city,
    required this.roleName,
    required this.departmentIdFk,
    required this.designationIdFk,
    required this.scopeIdPk,
    required this.dateOfBirth,
    required this.rolesIdPk,
    required this.countryCode,
    this.phoneNumber,
    this.employeeId,
    required this.userStatusId,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      profile: json['profile'] as String,
      userIdPk: json['user_id_pk'] as String,
      country: json['country'] as String?,
      dpName: json['dpname'] as String,
      dsName: json['dsname'] as String,
      scope: json['scope'] as String,
      state: json['state'] as String?,
      city: json['city'] as String?,
      roleName: json['roleName'] as String,
      departmentIdFk: json['department_id_fk'] as String,
      designationIdFk: json['designation_id_fk'] as String,
      scopeIdPk: json['scope_id_pk'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      rolesIdPk: json['roles_id_pk'] as String,
      countryCode: json['country_code'] as String,
      phoneNumber: json['phone_number'] as String?,
      employeeId: json['empoyee_id'] as String?,
      userStatusId: json['user_status_id'] as String,
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
      'dpname': dpName,
      'dsname': dsName,
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
      'empoyee_id': employeeId,
      'user_status_id': userStatusId,
    };
  }
}
