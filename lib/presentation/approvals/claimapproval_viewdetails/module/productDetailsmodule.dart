class ApiResponse {
  bool status;
  String msg;
  String error;
  ViewReferral? viewReferral;

  ApiResponse({
    required this.status,
    required this.msg,
    required this.error,
    this.viewReferral,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      msg: json['msg'],
      error: json['error'],
      viewReferral: json['viewRefferal'] != null
          ? ViewReferral.fromJson(json['viewRefferal'])
          : null,
    );
  }
}

class ViewReferral {
  GetProgram? getProgram;
  String? levelRankN1;
  String? levelRankN;
  String? hierarchyParentNodeid;
  String? hierarchyChildNodeid;
  String? referrerName;
  String? refereeName;
  Referral? referral;
  String? progId;
  String? requestedDate;
  String? requestedId;
  String? approverEmail;
  int? level;
  String? currentStatus;
  String? levelStatus;
  String? requestedBy;
  String? approverComment;
  String? userReferralClaimStagingId;

  ViewReferral({
    this.getProgram,
    this.levelRankN1,
    this.levelRankN,
    this.hierarchyParentNodeid,
    this.hierarchyChildNodeid,
    this.referrerName,
    this.refereeName,
    this.referral,
    this.progId,
    this.requestedDate,
    this.requestedId,
    this.approverEmail,
    this.level,
    this.currentStatus,
    this.levelStatus,
    this.requestedBy,
    this.approverComment,
    this.userReferralClaimStagingId,
  });

  factory ViewReferral.fromJson(Map<String, dynamic> json) {
    return ViewReferral(
      getProgram: json['get_program'] != null
          ? GetProgram.fromJson(json['get_program'])
          : null,
      levelRankN1: json['level_rank_n_1'],
      levelRankN: json['level_rank_n'],
      hierarchyParentNodeid: json['Hierarchy_parent_nodeid'],
      hierarchyChildNodeid: json['Hierarchy_child_nodeid'],
      referrerName: json['referrer_name'],
      refereeName: json['referee_name'],
      referral:
          json['referral'] != null ? Referral.fromJson(json['referral']) : null,
      progId: json['prog_id'],
      requestedDate: json['requested_date'],
      requestedId: json['requested_id'],
      approverEmail: json['approver_email'],
      level: json['level'],
      currentStatus: json['current_status'],
      levelStatus: json['level_status'],
      requestedBy: json['requested_by'],
      approverComment: json['approver_comment'],
      userReferralClaimStagingId: json['user_referral_claim_staging_id'],
    );
  }
}

class GetProgram {
  String? programId;
  String? name;
  String? programCode;
  String? campaignModeIdFk;
  String? description;
  String? programStatusId;
  String? bannerUrl;
  String? cmsCompanyId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? tentativeBudget;
  String? expiryDate;
  String? walletTypeId;
  String? frEnabledStatus;
  String? frNotificationDate;
  String? frDate;
  String? leaderboardEnable;
  String? showEarnedPointsLeaderboard;
  String? participantsViewLeaderboard;
  String? ranksLeaderboard;
  String? freqStatusIdFk;
  String? targetMeterEnable;
  String? targetName;
  String? kpiValue;
  String? startDate;
  String? endDate;
  String? updatedBy;
  String? defaultBannerAdded;
  String? participantsTableName;
  String? nudgeParticipantTableName;
  String? calculationTableName;
  String? incentivePayoutColumnName;
  String? kpiDisplayTypeIdFk;
  String? frPaymentModeType;
  String? useBaseScanTable;
  String? multiScanEnable;
  String? syncFlag;
  String? syncLastDate;
  String? syncDataSourceTableName;
  String? freezeStatus;
  String? bucketIdFk;
  String? campignMode;
  String? caModeIdPk;
  String? owner;
  String? awardPointLevelIdFk;
  String? claimTypeIdFk;
  String? workflowApprovalType;
  String? claimTypeName;

  GetProgram({
    this.programId,
    this.name,
    this.programCode,
    this.campaignModeIdFk,
    this.description,
    this.programStatusId,
    this.bannerUrl,
    this.cmsCompanyId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.tentativeBudget,
    this.expiryDate,
    this.walletTypeId,
    this.frEnabledStatus,
    this.frNotificationDate,
    this.frDate,
    this.leaderboardEnable,
    this.showEarnedPointsLeaderboard,
    this.participantsViewLeaderboard,
    this.ranksLeaderboard,
    this.freqStatusIdFk,
    this.targetMeterEnable,
    this.targetName,
    this.kpiValue,
    this.startDate,
    this.endDate,
    this.updatedBy,
    this.defaultBannerAdded,
    this.participantsTableName,
    this.nudgeParticipantTableName,
    this.calculationTableName,
    this.incentivePayoutColumnName,
    this.kpiDisplayTypeIdFk,
    this.frPaymentModeType,
    this.useBaseScanTable,
    this.multiScanEnable,
    this.syncFlag,
    this.syncLastDate,
    this.syncDataSourceTableName,
    this.freezeStatus,
    this.bucketIdFk,
    this.campignMode,
    this.caModeIdPk,
    this.owner,
    this.awardPointLevelIdFk,
    this.claimTypeIdFk,
    this.workflowApprovalType,
    this.claimTypeName,
  });

  factory GetProgram.fromJson(Map<String, dynamic> json) {
    return GetProgram(
      programId: json['program_id'],
      name: json['name'],
      programCode: json['program_code'],
      campaignModeIdFk: json['campaign_mode_id_fk'],
      description: json['description'],
      programStatusId: json['program_status_id'],
      bannerUrl: json['banner_url'],
      cmsCompanyId: json['cms_company_id'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      tentativeBudget: json['tentative_budget'],
      expiryDate: json['expiry_date'],
      walletTypeId: json['wallet_type_id'],
      frEnabledStatus: json['fr_enabled_status'],
      frNotificationDate: json['fr_notification_date'],
      frDate: json['fr_date'],
      leaderboardEnable: json['leaderboard_enable'],
      showEarnedPointsLeaderboard: json['show_earned_points_leaderboard'],
      participantsViewLeaderboard: json['participants_view_leaderboard'],
      ranksLeaderboard: json['ranks_leaderboard'],
      freqStatusIdFk: json['freq_status_id_fk'],
      targetMeterEnable: json['target_meter_enable'],
      targetName: json['target_name'],
      kpiValue: json['kpi_value'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      updatedBy: json['updated_by'],
      defaultBannerAdded: json['default_banner_added'],
      participantsTableName: json['participants_table_name'],
      nudgeParticipantTableName: json['nudge_participant_table_name'],
      calculationTableName: json['calculation_table_name'],
      incentivePayoutColumnName: json['incentive_payout_column_name'],
      kpiDisplayTypeIdFk: json['kpi_display_type_id_fk'],
      frPaymentModeType: json['fr_payment_mode_type'],
      useBaseScanTable: json['use_base_scan_table'],
      multiScanEnable: json['multi_scan_enable'],
      syncFlag: json['sync_flag'],
      syncLastDate: json['sync_last_date'],
      syncDataSourceTableName: json['sync_data_source_table_name'],
      freezeStatus: json['freeze_status'],
      bucketIdFk: json['bucket_id_fk'],
      campignMode: json['campign_mode'],
      caModeIdPk: json['ca_mode_id_pk'],
      owner: json['owner'],
      awardPointLevelIdFk: json['award_point_level_id_fk'],
      claimTypeIdFk: json['claim_type_id_fk'],
      workflowApprovalType: json['workflow_approval_type'],
      claimTypeName: json['claim_type_name'],
    );
  }
}

class Referral {
  String? purchasedParentNodeid;
  String? purchasedChildNodeid;
  String? invoiceImageUrl;
  String? hierarchyParentNodeid;
  String? hierarchyChildNodeid;
  List<ProductDetails> productDetails;
  List<PurchasedProductDetail>? purchasedProductDetails;
  ReferralDetails? details;
  ClaimDetails? claimDetails;

  Referral({
    this.purchasedParentNodeid,
    this.purchasedChildNodeid,
    this.invoiceImageUrl,
    this.hierarchyParentNodeid,
    this.hierarchyChildNodeid,
    required this.productDetails,
    this.purchasedProductDetails,
    this.details,
    this.claimDetails,
  });

  factory Referral.fromJson(Map<String, dynamic> json) {
    var productDetailsList = (json['productDetails'] as List?)
        ?.map((e) => ProductDetails.fromJson(e))
        .toList() ?? [];

    var purchasedProductDetailsList = (json['purchasedproductDetails'] as List?)
        ?.map((e) => PurchasedProductDetail.fromJson(e))
        .toList();

    return Referral(
      purchasedParentNodeid: json['purchased_parent_nodeid'],
      purchasedChildNodeid: json['purchased_child_nodeid'],
      invoiceImageUrl: json['invoice_image_url'],
      hierarchyParentNodeid: json['Hierarchy_parent_nodeid'],
      hierarchyChildNodeid: json['Hierarchy_child_nodeid'],
      productDetails: productDetailsList,
      purchasedProductDetails: purchasedProductDetailsList,
      details: json['details'] != null
          ? ReferralDetails.fromJson(json['details'])
          : null,
      claimDetails: json['claim_details'] != null
          ? ClaimDetails.fromJson(json['claim_details'])
          : null,
    );
  }
}

class ProductDetails {
  String nodeId;
  String code;
  String description;
  String parentNode;
  String status;
  String skuSize;
  String skuWeight;
  String skuVolume;
  String skuCost;
  String skuPrice;
  String skuSizeUnit;
  String skuWeightUnit;
  String skuVolumeUnit;
  String skuCodePresent;
  String skuDescPresent;
  String skuWeightPresent;
  String skuVolumePresent;
  String skuSizePresent;
  String skuCostPresent;
  String skuPricePresent;

  ProductDetails({
    required this.nodeId,
    required this.code,
    required this.description,
    required this.parentNode,
    required this.status,
    required this.skuSize,
    required this.skuWeight,
    required this.skuVolume,
    required this.skuCost,
    required this.skuPrice,
    required this.skuSizeUnit,
    required this.skuWeightUnit,
    required this.skuVolumeUnit,
    required this.skuCodePresent,
    required this.skuDescPresent,
    required this.skuWeightPresent,
    required this.skuVolumePresent,
    required this.skuSizePresent,
    required this.skuCostPresent,
    required this.skuPricePresent,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      nodeId: json['node_id'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      parentNode: json['parentnode'] ?? '',
      status: json['status'] ?? '',
      skuSize: json['sku_size'] ?? '',
      skuWeight: json['sku_weight'] ?? '',
      skuVolume: json['sku_volume'] ?? '',
      skuCost: json['sku_cost'] ?? '',
      skuPrice: json['sku_price'] ?? '',
      skuSizeUnit: json['sku_size_unit'] ?? '',
      skuWeightUnit: json['sku_weight_unit'] ?? '',
      skuVolumeUnit: json['sku_volume_unit'] ?? '',
      skuCodePresent: json['sku_code_present'] ?? '',
      skuDescPresent: json['sku_desc_present'] ?? '',
      skuWeightPresent: json['sku_weight_present'] ?? '',
      skuVolumePresent: json['sku_volume_present'] ?? '',
      skuSizePresent: json['sku_size_present'] ?? '',
      skuCostPresent: json['sku_cost_present'] ?? '',
      skuPricePresent: json['sku_price_present'] ?? '',
    );
  }
}

class PurchasedProductDetail {
  String? nodeId;
  String? code;
  String? description;
  String? parentnode;
  String? status;
  String? skuSize;
  String? skuWeight;
  String? skuVolume;
  String? skuCost;
  String? skuPrice;
  String? skuSizeUnit;
  String? skuWeightUnit;
  String? skuVolumeUnit;
  String? skuCodePresent;
  String? skuDescPresent;
  String? skuWeightPresent;
  String? skuVolumePresent;
  String? skuSizePresent;
  String? skuCostPresent;
  String? skuPricePresent;

  PurchasedProductDetail({
    this.nodeId,
    this.code,
    this.description,
    this.parentnode,
    this.status,
    this.skuSize,
    this.skuWeight,
    this.skuVolume,
    this.skuCost,
    this.skuPrice,
    this.skuSizeUnit,
    this.skuWeightUnit,
    this.skuVolumeUnit,
    this.skuCodePresent,
    this.skuDescPresent,
    this.skuWeightPresent,
    this.skuVolumePresent,
    this.skuSizePresent,
    this.skuCostPresent,
    this.skuPricePresent,
  });

  factory PurchasedProductDetail.fromJson(Map<String, dynamic> json) {
    return PurchasedProductDetail(
      nodeId: json['node_id'],
      code: json['code'],
      description: json['description'],
      parentnode: json['parentnode'],
      status: json['status'],
      skuSize: json['sku_size'],
      skuWeight: json['sku_weight'],
      skuVolume: json['sku_volume'],
      skuCost: json['sku_cost'],
      skuPrice: json['sku_price'],
      skuSizeUnit: json['sku_size_unit'],
      skuWeightUnit: json['sku_weight_unit'],
      skuVolumeUnit: json['sku_volume_unit'],
      skuCodePresent: json['sku_code_present'],
      skuDescPresent: json['sku_desc_present'],
      skuWeightPresent: json['sku_weight_present'],
      skuVolumePresent: json['sku_volume_present'],
      skuSizePresent: json['sku_size_present'],
      skuCostPresent: json['sku_cost_present'],
      skuPricePresent: json['sku_price_present'],
    );
  }
}

class ReferralDetails {
  String createDate;
  String referralIdCode;
  String referralCode;
  String referrerUserId;
  String refereeName;
  String refereeCountryCode;
  String refereeMobileNumber;
  String hierarchyParentNodeId;
  String hierarchyChildNodeId;
  String campaignReferralsIdPk;
  String campaignId;
  String name;
  String refereeEmailId;

  ReferralDetails({
    required this.createDate,
    required this.referralIdCode,
    required this.referralCode,
    required this.referrerUserId,
    required this.refereeName,
    required this.refereeCountryCode,
    required this.refereeMobileNumber,
    required this.hierarchyParentNodeId,
    required this.hierarchyChildNodeId,
    required this.campaignReferralsIdPk,
    required this.campaignId,
    required this.name,
    required this.refereeEmailId,
  });

  factory ReferralDetails.fromJson(Map<String, dynamic> json) {
    return ReferralDetails(
      createDate: json['create_date'] ?? '',
      referralIdCode: json['referral_id_code'] ?? '',
      referralCode: json['referral_code'] ?? '',
      referrerUserId: json['referrer_user_id'] ?? '',
      refereeName: json['referee_name'] ?? '',
      refereeCountryCode: json['referee_country_code'] ?? '',
      refereeMobileNumber: json['referee_mobile_number'] ?? '',
      hierarchyParentNodeId: json['Hierarchy_parent_nodeid'] ?? '',
      hierarchyChildNodeId: json['Hierarchy_child_nodeid'] ?? '',
      campaignReferralsIdPk: json['campaign_referrals_id_pk'] ?? '',
      campaignId: json['campaign_id'] ?? '',
      name: json['name'] ?? '',
      refereeEmailId: json['referee_email_id'] ?? '',
    );
  }
}

class ClaimDetails {
  final String programId;
  final String createDate;
  final String purchaseDate;
  final String claimId;
  final String refereeName;
  final String referralId;
  final String userReferralClaimStagingId;
  final String nodeId;
  final String parentNodeId;
  final String claimCode;
  final String campaignAwardingDetailsStatusName;
  final String claimStatusId;
  final String cmsUserId;
  final String skuCode;
  final String invoiceId;
  final String referralCode;
  final String invoiceImage;
  final String pointsToReferrer;
  final String pointsToReferee;

  ClaimDetails({
    required this.programId,
    required this.createDate,
    required this.purchaseDate,
    required this.claimId,
    required this.refereeName,
    required this.referralId,
    required this.userReferralClaimStagingId,
    required this.nodeId,
    required this.parentNodeId,
    required this.claimCode,
    required this.campaignAwardingDetailsStatusName,
    required this.claimStatusId,
    required this.cmsUserId,
    required this.skuCode,
    required this.invoiceId,
    required this.referralCode,
    required this.invoiceImage,
    required this.pointsToReferrer,
    required this.pointsToReferee,
  });

  factory ClaimDetails.fromJson(Map<String, dynamic> json) {
    return ClaimDetails(
      programId: json['program_id'] ?? '',
      createDate: json['create_date'] ?? '',
      purchaseDate: json['purchase_date'] ?? '',
      claimId: json['claim_id'] ?? '',
      refereeName: json['referee_name'] ?? '',
      referralId: json['referral_id'] ?? '',
      userReferralClaimStagingId: json['user_referral_claim_staging_id'] ?? '',
      nodeId: json['node_id'] ?? '',
      parentNodeId: json['parent_node_id'] ?? '',
      claimCode: json['claim_code'] ?? '',
      campaignAwardingDetailsStatusName: json['campaign_awarding_details_status_name'] ?? '',
      claimStatusId: json['claim_status_id'] ?? '',
      cmsUserId: json['cms_user_id'] ?? '',
      skuCode: json['sku_code'] ?? '',
      invoiceId: json['invoice_id'] ?? '',
      referralCode: json['referral_code'] ?? '',
      invoiceImage: json['invoice_image'] ?? '',
      pointsToReferrer: json['points_to_referrer'] ?? '',
      pointsToReferee: json['points_to_referee'] ?? '',
    );
  }
}
