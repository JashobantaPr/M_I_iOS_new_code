

class UserDetails {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final String? userIdPk;
  final String? country;
  final String? dpName;
  final String? dsName;
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

  UserDetails({
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
    this.userIdPk,
    this.country,
    this.dpName,
    this.dsName,
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

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    print('dsf${json}');
    return UserDetails(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profile: json['profile'],
      userIdPk: json['user_id_pk'],
      country: json['country'],
      dpName: json['dpname'],
      dsName: json['dsname'],
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
}
