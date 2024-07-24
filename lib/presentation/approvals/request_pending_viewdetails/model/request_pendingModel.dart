class ClaimDetails {
  final String requestCode;
  final String description;
  final String points;
  final String approverComment;
  final String addedUser;
  final String budgetRequestEntityId;
  final String budgetRequestStatusId;
  final String approvalStatus;
  final String requestedDate;
  final String claimCode;
  final String campaignName;
  final String invoiceId;
  final String quantity;
  final String totalPoints;
  final String invoiceImage;
  final String campaignSkuId;
  final String skuCode;
  final String skuDesc;
  final String requestedBy;
  final String programId;
  final String nodePath;
  final String createdAt;
  final String claimId;
  final String budgetRequestId;
  final String claimStatus;
  final String cmsUserId;
  final String skuSize;
  final String skuWeight;
  final String skuWeightUnit;
  final String skuVolume;
  final String skuVolumeUnit;
  final String skuCost;
  final String skuPrice;
  final String approverEmail;
  final String addedByEmail;
  final String approvalStatusId;
  final String approver1Email;
  final String approver2Email;
  final String approver3Email;
  final String approver1UserId;
  final String approver2UserId;
  final String approver3UserId;
  final String programStatusId;
  final String expiryDate;
  final String claimTypeId;
  final String totalInvoiceValue;
  final String claimCustomFieldsJson;
  final String updatedAt;
  final String invoiceImageUrl;
  final String userDataStatus;
  final String userDataError;
  final String userClaimStagingId;
  final String approvalStage;
  final String hierarchy;
  final List<Map<String, String>> claimBusinessHierarchy;
  final List<Map<String, String>> claimProductHierarchy;
  final List<String> multipleFiles;
  final List<Map<String, String>> slabDetails;
  final String requestedByProfile;

  ClaimDetails({
    required this.requestCode,
    required this.description,
    required this.points,
    required this.approverComment,
    required this.addedUser,
    required this.budgetRequestEntityId,
    required this.budgetRequestStatusId,
    required this.approvalStatus,
    required this.requestedDate,
    required this.claimCode,
    required this.campaignName,
    required this.invoiceId,
    required this.quantity,
    required this.totalPoints,
    required this.invoiceImage,
    required this.campaignSkuId,
    required this.skuCode,
    required this.skuDesc,
    required this.requestedBy,
    required this.programId,
    required this.nodePath,
    required this.createdAt,
    required this.claimId,
    required this.budgetRequestId,
    required this.claimStatus,
    required this.cmsUserId,
    required this.skuSize,
    required this.skuWeight,
    required this.skuWeightUnit,
    required this.skuVolume,
    required this.skuVolumeUnit,
    required this.skuCost,
    required this.skuPrice,
    required this.approverEmail,
    required this.addedByEmail,
    required this.approvalStatusId,
    required this.approver1Email,
    required this.approver2Email,
    required this.approver3Email,
    required this.approver1UserId,
    required this.approver2UserId,
    required this.approver3UserId,
    required this.programStatusId,
    required this.expiryDate,
    required this.claimTypeId,
    required this.totalInvoiceValue,
    required this.claimCustomFieldsJson,
    required this.updatedAt,
    required this.invoiceImageUrl,
    required this.userDataStatus,
    required this.userDataError,
    required this.userClaimStagingId,
    required this.approvalStage,
    required this.hierarchy,
    required this.claimBusinessHierarchy,
    required this.claimProductHierarchy,
    required this.multipleFiles,
    required this.slabDetails,
    required this.requestedByProfile,
  });

  factory ClaimDetails.fromJson(Map<String, dynamic> json) {
    return ClaimDetails(
      requestCode: json['request_code'].toString(),
      description: json['description'].toString(),
      points: json['points'].toString(),
      approverComment: json['approver_comment'].toString(),
      addedUser: json['added_user'].toString(),
      budgetRequestEntityId: json['budget_request_entity_id'].toString(),
      budgetRequestStatusId: json['budget_request_status_id'].toString(),
      approvalStatus: json['approval_status'].toString(),
      requestedDate: json['requested_date'].toString(),
      claimCode: json['claim_code'].toString(),
      campaignName: json['campaign_name'].toString(),
      invoiceId: json['invoice_id'].toString(),
      quantity: json['quantity']?.toString() ?? '',
      totalPoints: json['total_points'].toString(),
      invoiceImage: json['invoice_image'].toString(),
      campaignSkuId: json['campaign_sku_id']?.toString() ?? '',
      skuCode: json['sku_code']?.toString() ?? '',
      skuDesc: json['sku_desc']?.toString() ?? '',
      requestedBy: json['requested_by'].toString(),
      programId: json['program_id'].toString(),
      nodePath: json['node_path'].toString(),
      createdAt: json['created_at'].toString(),
      claimId: json['claim_id'].toString(),
      budgetRequestId: json['budget_request_id'].toString(),
      claimStatus: json['claim_status'].toString(),
      cmsUserId: json['cms_user_id'].toString(),
      skuSize: json['sku_size']?.toString() ?? '',
      skuWeight: json['sku_weight']?.toString() ?? '',
      skuWeightUnit: json['sku_weight_unit']?.toString() ?? '',
      skuVolume: json['sku_volume']?.toString() ?? '',
      skuVolumeUnit: json['sku_volume_unit']?.toString() ?? '',
      skuCost: json['sku_cost']?.toString() ?? '',
      skuPrice: json['sku_price']?.toString() ?? '',
      approverEmail: json['approver_email'].toString(),
      addedByEmail: json['added_by_email'].toString(),
      approvalStatusId: json['approval_status_id'].toString(),
      approver1Email: json['approver1_email'].toString(),
      approver2Email: json['approver2_email'].toString(),
      approver3Email: json['approver3_email'].toString(),
      approver1UserId: json['approver1_userid'].toString(),
      approver2UserId: json['approver2_userid'].toString(),
      approver3UserId: json['approver3_userid'].toString(),
      programStatusId: json['program_status_id'].toString(),
      expiryDate: json['expiry_date'].toString(),
      claimTypeId: json['claim_type_id'].toString(),
      totalInvoiceValue: json['total_invoice_value'].toString(),
      claimCustomFieldsJson: json['claim_custom_feilds_json'].toString(),
      updatedAt: json['updated_at'].toString(),
      invoiceImageUrl: json['invoice_image_url'].toString(),
      userDataStatus: json['userData']['status'].toString(),
      userDataError: json['userData']['error'].toString(),
      userClaimStagingId: json['user_claim_staging_id'].toString(),
      approvalStage: json['approval_stage'].toString(),
      hierarchy: json['hierarchy'].toString(),
      claimBusinessHierarchy: List<Map<String, String>>.from(
        json['claim_business_hierarchy'].map((x) => {
              'level': x['level'].toString(),
              'level_nodes': x['level_nodes'].toString(),
            }),
      ),
      claimProductHierarchy: List<Map<String, String>>.from(
        json['claim_product_hierarchy'].map((x) => {
              'level': x['level'].toString(),
              'level_nodes': x['level_nodes'].toString(),
            }),
      ),
      multipleFiles: json['Multiple Files'] != null
          ? List<String>.from(json['Multiple Files'].map((x) => x.toString()))
          : [],
      slabDetails: json['slab_details'] != null
          ? List<Map<String, String>>.from(
              json['slab_details'].map((x) => {
                    'incentive_type': x['incentive_type'].toString(),
                    'range': x['range'].toString(),
                    'points': x['points'].toString(),
                  }),
            )
          : [],
      requestedByProfile: json['requested_by_profile'].toString(),
    );
  }
}
