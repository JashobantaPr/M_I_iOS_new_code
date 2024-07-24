class CampaignData {
  List<Campaign>? campaigndata;

  CampaignData({this.campaigndata});

  CampaignData.fromJson(Map<String, dynamic> json) {
    if (json['campaigndata'] != null) {
      campaigndata = <Campaign>[];
      json['campaigndata'].forEach((v) {
        campaigndata!.add(Campaign.fromJson(v));
      });
    }
  }
}

class Campaign {
  String? claimId;
  dynamic skuDesc;
  dynamic quantity;
  String? totalPoints;
  String? approvalWorkflowTypeId;
  String? status;
  String? approverComment;
  dynamic updatedAt;
  dynamic approverName;
  String? approverEmail;
  String? approvalLevel;

  Campaign(
      {this.claimId,
      this.skuDesc,
      this.quantity,
      this.totalPoints,
      this.approvalWorkflowTypeId,
      this.status,
      this.approverComment,
      this.updatedAt,
      this.approverName,
      this.approverEmail,
      this.approvalLevel});

  Campaign.fromJson(Map<String, dynamic> json) {
    claimId = json['claim_id'];
    skuDesc = json['sku_desc'];
    quantity = json['quantity'];
    totalPoints = json['total_points'];
    approvalWorkflowTypeId = json['approval_workflow_type_id'];
    status = json['status'];
    approverComment = json['approver_comment'];
    updatedAt = json['updated_at'];
    approverName = json['approver_name'];
    approverEmail = json['approver_email'];
    approvalLevel = json['approval_level'];
  }
}

class ArrayColumn {
  String? userIdPk;
  String? email;
  String? firstName;
  String? lastName;
  String? profileName;

  ArrayColumn(
      {this.userIdPk, this.email, this.firstName, this.lastName, this.profileName});

  ArrayColumn.fromJson(Map<String, dynamic> json) {
    userIdPk = json['user_id_pk'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileName = json['profile_name'];
  }
}

class ApiResponse {
  List<Campaign>? campaigndata;
  Map<String, ArrayColumn>? arrayColumn;

  ApiResponse({this.campaigndata, this.arrayColumn});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['campaigndata'] != null) {
      campaigndata = <Campaign>[];
      json['campaigndata'].forEach((v) {
        campaigndata!.add(Campaign.fromJson(v));
      });
    }
    if (json['array_column'] != null) {
      arrayColumn = <String, ArrayColumn>{};
      json['array_column'].forEach((k, v) {
        arrayColumn![k] = ArrayColumn.fromJson(v);
      });
    }
  }
}
