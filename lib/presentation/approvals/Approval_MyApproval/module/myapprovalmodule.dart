class BudgetRequest {
  String budgetRequestId;
  String requestCode;
  String description;
  String points;
  String status;
  String budgetRequestTypeId;
  String requestedDate;
  String budgetRequestTypeName;
  String entityId;
  String userName;
  String name;
  String profile;
  String profileImgLink;
  String days;
  String campaignModeIdFk;

  BudgetRequest({
    required this.budgetRequestId,
    required this.requestCode,
    required this.description,
    required this.points,
    required this.status,
    required this.budgetRequestTypeId,
    required this.requestedDate,
    required this.budgetRequestTypeName,
    required this.entityId,
    required this.userName,
    required this.name,
    required this.profile,
    required this.profileImgLink,
    required this.days,
    required this.campaignModeIdFk,
  });

  factory BudgetRequest.fromJson(Map<String, dynamic> json) {
    return BudgetRequest(
      budgetRequestId: json['budget_request_id'],
      requestCode: json['request_code'],
      description: json['description'],
      points: json['points'],
      status: json['status'],
      budgetRequestTypeId: json['budget_request_type_id'],
      requestedDate: json['requested_date'],
      budgetRequestTypeName: json['budget_request_type_name'],
      entityId: json['entity_id'],
      userName: json['user_name'],
      name: json['name'],
      profile: json['profile'],
      profileImgLink: json['profile_img_link'],
      days: json['days'],
      campaignModeIdFk: json['campaign_mode_id_fk'],
    );
  }
}

class ApiResponse {
  List<BudgetRequest> list;
  int totalRecords;
  int totalFilteredRecords;
  bool status;

  ApiResponse({
    required this.list,
    required this.totalRecords,
    required this.totalFilteredRecords,
    required this.status,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<BudgetRequest> budgetRequestList = list.map((i) => BudgetRequest.fromJson(i)).toList();

    return ApiResponse(
      list: budgetRequestList,
      totalRecords: json['total_records'],
      totalFilteredRecords: json['total_filtered_records'],
      status: json['status'],
    );
  }
}