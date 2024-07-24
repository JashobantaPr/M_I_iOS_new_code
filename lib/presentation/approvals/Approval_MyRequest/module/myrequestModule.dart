class Request {
  String budgetRequestId;
  String requestCode;
  String requestBy;
  String requestType;
  String description;
  String status;
  String requestedDate;
  String budgetRequestTypeId;
  String name;
  String profile;
  String profileImgLink;
  String awardId;
  String entityId;
  String campaignModeIdFk;

  Request({
    required this.budgetRequestId,
    required this.requestCode,
    required this.requestBy,
    required this.requestType,
    required this.description,
    required this.status,
    required this.requestedDate,
    required this.budgetRequestTypeId,
    required this.name,
    required this.profile,
    required this.profileImgLink,
    required this.awardId,
    required this.entityId,
    required this.campaignModeIdFk,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      budgetRequestId: json['budget_request_id'] ?? '',
      requestCode: json['request_code'] ?? '',
      requestBy: json['request_by'] ?? '',
      requestType: json['request_type'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      requestedDate: json['requested_date'] ?? '',
      budgetRequestTypeId: json['budget_request_type_id'] ?? '',
      name: json['name'] ?? '',
      profile: json['profile'] ?? '',
      profileImgLink: json['profile_img_link'] ?? '',
      awardId: json['awardId'] ?? '',
      entityId: json['entity_id'] ?? '',
      campaignModeIdFk: json['campaign_mode_id_fk'] ?? '',
    );
  }
}

class BudgetResponse {
  List<Request> list;
  int totalRecords;
  int totalFilteredRecords;
  bool status;

  BudgetResponse({
    required this.list,
    required this.totalRecords,
    required this.totalFilteredRecords,
    required this.status,
  });

  factory BudgetResponse.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Request> requests = list.map((e) => Request.fromJson(e)).toList();

    return BudgetResponse(
      list: requests,
      totalRecords: json['total_records'],
      totalFilteredRecords: json['total_filtered_records'],
      status: json['status'],
    );
  }
}
