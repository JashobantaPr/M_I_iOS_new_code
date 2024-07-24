class UserPointsModel {
  final int creditPoints;
  final int? debitPoints;
  final int? expirePoints;
  final String programName;
  final String expiryDate;
  final int programId;
  final String? corder;

  UserPointsModel({
    required this.creditPoints,
    this.debitPoints,
    this.expirePoints,
    required this.programName,
    required this.expiryDate,
    required this.programId,
    this.corder,
  });

  factory UserPointsModel.fromJson(Map<String, dynamic> json) {
    return UserPointsModel(
      creditPoints: json['credit_points'] != null ? int.tryParse(json['credit_points']) ?? 0 : 0,
      debitPoints: json['debit_points'] != null ? int.tryParse(json['debit_points']) : null,
      expirePoints: json['expire_points'] != null ? int.tryParse(json['expire_points']) : null,
      programName: json['program_name'] ?? '',
      expiryDate: json['expiry_date'] ?? '',
      programId: json['program_id'] != null ? int.tryParse(json['program_id']) ?? 0 : 0,
      corder: json['corder'],
    );
  }
}

class UsersResponseModel {
  final List<UserPointsModel> users;

  UsersResponseModel({required this.users});

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    var usersJson = json['users'] as List<dynamic>;
    List<UserPointsModel> usersList = usersJson.map((userJson) => UserPointsModel.fromJson(userJson)).toList();
    
    return UsersResponseModel(users: usersList);
  }
}
