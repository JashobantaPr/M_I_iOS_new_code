class CampaignDataResponse {
  final bool status;
  final String msg;
  final String error;
  final ResponseData? response;

  CampaignDataResponse({
    required this.status,
    required this.msg,
    required this.error,
    required this.response,
  });

  factory CampaignDataResponse.fromJson(Map<String, dynamic> json) {
    return CampaignDataResponse(
      status: json['status'] ?? false,
      msg: json['msg'] ?? '',
      error: json['error'] ?? '',
      response: json['response'] != null
          ? ResponseData.fromJson(json['response'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'msg': msg,
      'error': error,
      'response': response?.toJson(),
    };
  }
}

class ResponseData {
  final List<CampaignData> campaigndata;
  final Map<String, UserData> arrayColumn;

  ResponseData({
    required this.campaigndata,
    required this.arrayColumn,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var campaignDataList = (json['campaigndata'] as List)
        .map((i) => CampaignData.fromJson(i))
        .toList();
    var arrayColumnMap = (json['array_column'] as Map<String, dynamic>).map(
      (k, v) => MapEntry(k, UserData.fromJson(v)),
    );

    return ResponseData(
      campaigndata: campaignDataList,
      arrayColumn: arrayColumnMap,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'campaigndata': campaigndata.map((e) => e.toJson()).toList(),
      'array_column': arrayColumn.map((k, v) => MapEntry(k, v.toJson())),
    };
  }
}

class CampaignData {
  final String claimId;
  final String skuDesc;
  final String quantity;
  final String totalPoints;
  final String approvalWorkflowTypeId;
  final String status;
  final String? approverComment;
  final DateTime? updatedAt;
  final String? approverName;
  final String approverEmail;
  final String approvalLevel;

  CampaignData({
    required this.claimId,
    required this.skuDesc,
    required this.quantity,
    required this.totalPoints,
    required this.approvalWorkflowTypeId,
    required this.status,
    this.approverComment,
    this.updatedAt,
    this.approverName,
    required this.approverEmail,
    required this.approvalLevel,
  });

  factory CampaignData.fromJson(Map<String, dynamic> json) {
    return CampaignData(
      claimId: json['claim_id'] ?? '',
      skuDesc: json['sku_desc'] ?? '',
      quantity: json['quantity'] ?? '',
      totalPoints: json['total_points'] ?? '',
      approvalWorkflowTypeId: json['approval_workflow_type_id'] ?? '',
      status: json['status'] ?? '',
      approverComment: json['approver_comment'],
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      approverName: json['approver_name'],
      approverEmail: json['approver_email'] ?? '',
      approvalLevel: json['approval_level'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'claim_id': claimId,
      'sku_desc': skuDesc,
      'quantity': quantity,
      'total_points': totalPoints,
      'approval_workflow_type_id': approvalWorkflowTypeId,
      'status': status,
      'approver_comment': approverComment,
      'updated_at': updatedAt?.toIso8601String(),
      'approver_name': approverName,
      'approver_email': approverEmail,
      'approval_level': approvalLevel,
    };
  }
}

class UserData {
  final String userIdPk;
  final String email;
  final String firstName;
  final String lastName;
  final String profileName;

  UserData({
    required this.userIdPk,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileName,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userIdPk: json['user_id_pk'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      profileName: json['profile_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id_pk': userIdPk,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'profile_name': profileName,
    };
  }
}
