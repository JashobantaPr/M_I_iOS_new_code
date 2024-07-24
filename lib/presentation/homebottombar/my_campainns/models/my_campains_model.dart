class MyCampaigns {
  String? programStatusId;
  String? createdAt;
  String? bannerUrl;
  String? description;
  String? owner;
  String? programId;
  String? name;
  String? programCode;
  String? users;
  String? ownerStatus;
  String? campaignModeIdFk;
  String? expiryDate;
  String? bucketExpiredStatus;
  String? campignMode;
  String? freezeStatus;

  MyCampaigns(
      {this.programStatusId,
      this.createdAt,
      this.bannerUrl,
      this.description,
      this.owner,
      this.programId,
      this.name,
      this.programCode,
      this.users,
      this.ownerStatus,
      this.campaignModeIdFk,
      this.expiryDate,
      this.bucketExpiredStatus,
      this.campignMode,
      this.freezeStatus});

  MyCampaigns.fromJson(Map<String, dynamic> json) {
    programStatusId = json['program_status_id'];
    createdAt = json['created_at'];
    bannerUrl = json['banner_url'];
    description = json['description'];
    owner = json['owner'];
    programId = json['program_id'];
    name = json['name'];
    programCode = json['program_code'];
    users = json['users'];
    ownerStatus = json['owner_status'];
    campaignModeIdFk = json['campaign_mode_id_fk'];
    expiryDate = json['expiry_date'];
    bucketExpiredStatus = json['bucket_expired_status'];
    campignMode = json['campign_mode'];
    freezeStatus = json['freeze_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['program_status_id'] = programStatusId;
    data['created_at'] = createdAt;
    data['banner_url'] = bannerUrl;
    data['description'] = description;
    data['owner'] = owner;
    data['program_id'] = programId;
    data['name'] = name;
    data['program_code'] = programCode;
    data['users'] = users;
    data['owner_status'] = ownerStatus;
    data['campaign_mode_id_fk'] = campaignModeIdFk;
    data['expiry_date'] = expiryDate;
    data['bucket_expired_status'] = bucketExpiredStatus;
    data['campign_mode'] = campignMode;
    data['freeze_status'] = freezeStatus;
    return data;
  }
}

class ProgType {
  String? caModeIdPk;
  String? campignMode;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? campaignType;

  ProgType(
      {this.caModeIdPk,
      this.campignMode,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.campaignType});

  ProgType.fromJson(Map<String, dynamic> json) {
    caModeIdPk = json['ca_mode_id_pk'];
    campignMode = json['campign_mode'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    campaignType = json['campaign_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ca_mode_id_pk'] = caModeIdPk;
    data['campign_mode'] = campignMode;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['campaign_type'] = campaignType;
    return data;
  }
}
