import 'dart:convert';

class ResponseData {
  final String? claimId;
  final String? claimCode;
  final String? cmsUserId;
  final String? invoiceId;
  final String? createDate;
  final String? skuCode;
  final String? skuDesc;
  final String? quantity;
  final String? totalPoints;
  final String? statusId;
  final String? claimStatus;
  final String? name;
  final String? approver2Email;
  final String? approver3Email;
  final String? approver1Email;
  final String? approver2UserId;
  final String? approver3UserId;
  final String? approver1UserId;
  final String? nodePath;
  final String? programId;
  final String? approverTimeLimit;
  final String? programCode;
  final String? invoiceImage;
  final String? skuSize;
  final String? skuWeight;
  final String? skuVolume;
  final String? skuCost;
  final String? skuPrice;
  final String? approvalStatusId;
  final String? programStatusId;
  final String? expiryDate;
  final String? skuSizeUnit;
  final String? skuVolumeUnit;
  final String? skuWeightUnit;
  final String? totalInvoiceValue;
  final String? claimTypeId;
  final List<CustomField>? claimCustomFields;
  final String? delegateCmsUserEmail;
  final String? delegateCmsUserId;
  final String? campaignAwardingDetailsStatusIdFk;
  final String? approvalStage;
  final String? userClaimStagingId;
  final String? approverComment;
  final String? programName;
  final String? requestedBy;
  final String? invoiceImageUrl;
  final List<String>? multipleFiles;
  final String? comments;
  final String? approvalEmailId;
  final String? hierarchyLevel;
  final List<Hierarchy>? claimBusinessHierarchy;
  final List<Hierarchy>? claimProductHierarchy;

  ResponseData({
    this.claimId,
    this.claimCode,
    this.cmsUserId,
    this.invoiceId,
    this.createDate,
    this.skuCode,
    this.skuDesc,
    this.quantity,
    this.totalPoints,
    this.statusId,
    this.claimStatus,
    this.name,
    this.approver2Email,
    this.approver3Email,
    this.approver1Email,
    this.approver2UserId,
    this.approver3UserId,
    this.approver1UserId,
    this.nodePath,
    this.programId,
    this.approverTimeLimit,
    this.programCode,
    this.invoiceImage,
    this.skuSize,
    this.skuWeight,
    this.skuVolume,
    this.skuCost,
    this.skuPrice,
    this.approvalStatusId,
    this.programStatusId,
    this.expiryDate,
    this.skuSizeUnit,
    this.skuVolumeUnit,
    this.skuWeightUnit,
    this.totalInvoiceValue,
    this.claimTypeId,
    this.claimCustomFields,
    this.delegateCmsUserEmail,
    this.delegateCmsUserId,
    this.campaignAwardingDetailsStatusIdFk,
    this.approvalStage,
    this.userClaimStagingId,
    this.approverComment,
    this.programName,
    this.requestedBy,
    this.invoiceImageUrl,
    this.multipleFiles,
    this.comments,
    this.approvalEmailId,
    this.hierarchyLevel,
    this.claimBusinessHierarchy,
    this.claimProductHierarchy,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      claimId: json['claim_id'] as String?,
      claimCode: json['claim_code'] as String?,
      cmsUserId: json['cms_user_id'] as String?,
      invoiceId: json['invoice_id'] as String?,
      createDate: json['create_date'] as String?,
      skuCode: json['sku_code'] as String?,
      skuDesc: json['sku_desc'] as String?,
      quantity: json['quantity'] as String?,
      totalPoints: json['total_points'] as String?,
      statusId: json['status_id'] as String?,
      claimStatus: json['claim_status'] as String?,
      name: json['name'] as String?,
      approver2Email: json['approver2_email'] as String?,
      approver3Email: json['approver3_email'] as String?,
      approver1Email: json['approver1_email'] as String?,
      approver2UserId: json['approver2_userid'] as String?,
      approver3UserId: json['approver3_userid'] as String?,
      approver1UserId: json['approver1_userid'] as String?,
      nodePath: json['node_path'] as String?,
      programId: json['program_id'] as String?,
      approverTimeLimit: json['approver_time_limit'] as String?,
      programCode: json['program_code'] as String?,
      invoiceImage: json['invoice_image'] as String?,
      skuSize: json['sku_size'] as String?,
      skuWeight: json['sku_weight'] as String?,
      skuVolume: json['sku_volume'] as String?,
      skuCost: json['sku_cost'] as String?,
      skuPrice: json['sku_price'] as String?,
      approvalStatusId: json['approval_status_id'] as String?,
      programStatusId: json['program_status_id'] as String?,
      expiryDate: json['expiry_date'] as String?,
      skuSizeUnit: json['sku_size_unit'] as String?,
      skuVolumeUnit: json['sku_volume_unit'] as String?,
      skuWeightUnit: json['sku_weight_unit'] as String?,
      totalInvoiceValue: json['total_invoice_value'] as String?,
      claimTypeId: json['claim_type_id'] as String?,
      claimCustomFields: json['claim_custom_feilds_json'] != null
          ? (jsonDecode(json['claim_custom_feilds_json']) as List<dynamic>)
              .map((item) => CustomField.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      delegateCmsUserEmail: json['delegate_cms_user_email'] as String?,
      delegateCmsUserId: json['delegate_cms_user_id'] as String?,
      campaignAwardingDetailsStatusIdFk:
          json['campaign_awarding_details_status_id_fk'] as String?,
      approvalStage: json['approval_stage'] as String?,
      userClaimStagingId: json['user_claim_staging_id'] as String?,
      approverComment: json['approver_comment'] as String?,
      programName: json['program_name'] as String?,
      requestedBy: json['requested_by'] as String?,
      invoiceImageUrl: json['invoice_image_url'] as String?,
      multipleFiles: (json['Multiple Files'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      comments: json['comments'] as String?,
      approvalEmailId: json['approval_email_id'] as String?,
      hierarchyLevel: json['heirarchy_level'] as String?,
      claimBusinessHierarchy:
          (json['claim_business_hierarchy'] as List<dynamic>?)
              ?.map((item) => Hierarchy.fromJson(item as Map<String, dynamic>))
              .toList()??[],
      claimProductHierarchy: (json['claim_product_hierarchy'] as List<dynamic>?)
          ?.map((item) => Hierarchy.fromJson(item as Map<String, dynamic>))
          .toList()??[],
    );
  }
}

class CustomField {
  final String? type;
  final String? subtype;
  final String? label;
  final String? name;
  final bool? required;
  final List<Value>? values;
  final dynamic fieldValue; // This can be String, List<String>, etc.

  CustomField({
    this.type,
    this.subtype,
    this.label,
    this.name,
    this.required,
    this.values,
    this.fieldValue,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) {
    return CustomField(
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      label: json['label'] as String?,
      name: json['name'] as String?,
      required: json['required'] as bool?,
      values: (json['values'] as List<dynamic>?)
          ?.map((item) => Value.fromJson(item as Map<String, dynamic>))
          .toList(),
      fieldValue: json['field_value'],
    );
  }
}

class Value {
  final String? label;
  final String? value;
  final bool? selected;

  Value({
    this.label,
    this.value,
    this.selected,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      label: json['label'] as String?,
      value: json['value'] as String?,
      selected: json['selected'] as bool?,
    );
  }
}

class Hierarchy {
  final String? level;
  final String? levelNodes;

  Hierarchy({
    this.level,
    this.levelNodes,
  });

  factory Hierarchy.fromJson(Map<String, dynamic> json) {
    return Hierarchy(
      level: json['level'] as String?,
      levelNodes: json['level_nodes'] as String?,
    );
  }
}
