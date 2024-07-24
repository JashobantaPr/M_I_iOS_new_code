class CompanyProfileModel {
  String? type;
  String? totallicence;
  String? licenseExpiry;
  String? totaluserlicenc;
  List<Company>? company;
  List<CompanyProfile>? companyProfile;
  List<BillingCycle>? billingCycle;
  List<Days>? days;
  List<String>? workingDays;
  String? logoUrl;

  CompanyProfileModel(
      {this.type,
      this.totallicence,
      this.licenseExpiry,
      this.totaluserlicenc,
      this.company,
      this.companyProfile,
      this.billingCycle,
      this.days,
      this.workingDays,
      this.logoUrl});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    totallicence = json['totallicence'];
    licenseExpiry = json['licenseExpiry'];
    totaluserlicenc = json['totaluserlicenc'];
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
    if (json['company_profile'] != null) {
      companyProfile = <CompanyProfile>[];
      json['company_profile'].forEach((v) {
        companyProfile!.add(new CompanyProfile.fromJson(v));
      });
    }
    if (json['billing_cycle'] != null) {
      billingCycle = <BillingCycle>[];
      json['billing_cycle'].forEach((v) {
        billingCycle!.add(new BillingCycle.fromJson(v));
      });
    }
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
    workingDays =
        (json['workingDays'] != null) ? json['workingDays'].cast<String>() : [];
    logoUrl = json['logoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['totallicence'] = this.totallicence;
    data['licenseExpiry'] = this.licenseExpiry;
    data['totaluserlicenc'] = this.totaluserlicenc;
    if (this.company != null) {
      data['company'] = this.company!.map((v) => v.toJson()).toList();
    }
    if (this.companyProfile != null) {
      data['company_profile'] =
          this.companyProfile!.map((v) => v.toJson()).toList();
    }
    if (this.billingCycle != null) {
      data['billing_cycle'] =
          this.billingCycle!.map((v) => v.toJson()).toList();
    }
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    data['workingDays'] = this.workingDays;
    data['logoUrl'] = this.logoUrl;
    return data;
  }
}

class Company {
  String? enableSso;
  String? allowNonSsoUsers;
  String? code;
  String? name;
  String? address;
  String? adminEmailId;
  String? adminMobileNo;
  String? logo;
  String? isPhoneMandatory;
  String? isEmailMandatory;

  Company(
      {this.enableSso,
      this.allowNonSsoUsers,
      this.code,
      this.name,
      this.address,
      this.adminEmailId,
      this.adminMobileNo,
      this.logo,
      this.isPhoneMandatory,
      this.isEmailMandatory});

  Company.fromJson(Map<String, dynamic> json) {
    enableSso = json['enable_sso'];
    allowNonSsoUsers = json['allow_non_sso_users'];
    code = json['code'];
    name = json['name'];
    address = json['address'];
    adminEmailId = json['admin_email_id'];
    adminMobileNo = json['admin_mobile_no'];
    logo = json['logo'];
    isPhoneMandatory = json['is_phone_mandatory'];
    isEmailMandatory = json['is_email_mandatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enable_sso'] = this.enableSso;
    data['allow_non_sso_users'] = this.allowNonSsoUsers;
    data['code'] = this.code;
    data['name'] = this.name;
    data['address'] = this.address;
    data['admin_email_id'] = this.adminEmailId;
    data['admin_mobile_no'] = this.adminMobileNo;
    data['logo'] = this.logo;
    data['is_phone_mandatory'] = this.isPhoneMandatory;
    data['is_email_mandatory'] = this.isEmailMandatory;
    return data;
  }
}

class CompanyProfile {
  String? companyProfileIdPk;
  String? cmsCompanyIdFk;
  String? suppEmail;
  String? onePointIs;
  String? perUserPerMonth;
  String? billingCycleId;
  String? billingCycle;
  String? billingDay;
  String? financialYearFrom;
  String? financialYearTo;
  String? rewardCatalogue;
  String? showRewardWorth;
  String? galleryStorage;
  String? cmsCompanyImage;
  String? happinessChangeDays;
  String? active;
  String? emailStatus;
  String? notificationStatus;
  String? transactionLogicMasterId;
  String? variableStatus;
  String? audioFlag;
  String? videoFlag;
  String? recorddate;
  String? otpMode;
  String? isSalaryCreditEnable;
  String? tdsApplicableOl;
  String? rewardTdsOld;
  String? cashRewardEnable;
  String? panFinanceApproverIdOld;
  String? panDocumentsApproverIdOld;
  String? bankFinanceApproverIdOld;
  String? upiFinanceApproverIdOld;
  String? paytmFinanceApproverId;
  String? bankDocumentsApproverIdOld;
  String? upiDocumentsApproverIdOld;
  String? paytmDocumentsApproverId;
  String? allowUserEditMobileEmail;
  String? allowUserEditPanOld;
  String? allowUserEditBankOld;
  String? isHierarchyEnabled;
  String? productcode;
  String? productPoweredBy;
  String? isForecedRedemptionEnabled;
  String? paymentModeId;
  String? displayProcessingFee;
  String? isAutoPennyDropEnabledOld;
  String? smsStatus;
  String? redemptionLimitOld;
  String? tdsApplicabilityIdFkOld;
  String? paytmTransferEnable;
  String? allowUserEditPaytmNumber;
  String? updatedDate;
  String? countryIsoCode;
  String? level1DocumentsApproverId;
  String? level2FinanceApproverId;
  String? countryCode;
  String? tdsApplicabilityIdFk;

  CompanyProfile(
      {this.companyProfileIdPk,
      this.cmsCompanyIdFk,
      this.suppEmail,
      this.onePointIs,
      this.perUserPerMonth,
      this.billingCycleId,
      this.billingCycle,
      this.billingDay,
      this.financialYearFrom,
      this.financialYearTo,
      this.rewardCatalogue,
      this.showRewardWorth,
      this.galleryStorage,
      this.cmsCompanyImage,
      this.happinessChangeDays,
      this.active,
      this.emailStatus,
      this.notificationStatus,
      this.transactionLogicMasterId,
      this.variableStatus,
      this.audioFlag,
      this.videoFlag,
      this.recorddate,
      this.otpMode,
      this.isSalaryCreditEnable,
      this.tdsApplicableOl,
      this.rewardTdsOld,
      this.cashRewardEnable,
      this.panFinanceApproverIdOld,
      this.panDocumentsApproverIdOld,
      this.bankFinanceApproverIdOld,
      this.upiFinanceApproverIdOld,
      this.paytmFinanceApproverId,
      this.bankDocumentsApproverIdOld,
      this.upiDocumentsApproverIdOld,
      this.paytmDocumentsApproverId,
      this.allowUserEditMobileEmail,
      this.allowUserEditPanOld,
      this.allowUserEditBankOld,
      this.isHierarchyEnabled,
      this.productcode,
      this.productPoweredBy,
      this.isForecedRedemptionEnabled,
      this.paymentModeId,
      this.displayProcessingFee,
      this.isAutoPennyDropEnabledOld,
      this.smsStatus,
      this.redemptionLimitOld,
      this.tdsApplicabilityIdFkOld,
      this.paytmTransferEnable,
      this.allowUserEditPaytmNumber,
      this.updatedDate,
      this.countryIsoCode,
      this.level1DocumentsApproverId,
      this.level2FinanceApproverId,
      this.countryCode,
      this.tdsApplicabilityIdFk});

  CompanyProfile.fromJson(Map<String, dynamic> json) {
    companyProfileIdPk = json['company_profile_id_pk'];
    cmsCompanyIdFk = json['cms_company_id_fk'];
    suppEmail = json['supp_email'];
    onePointIs = json['one_point_is'];
    perUserPerMonth = json['per_user_per_month'];
    billingCycleId = json['billing_cycle_id'];
    billingCycle = json['billing_cycle'];
    billingDay = json['billing_day'];
    financialYearFrom = json['financial_year_from'];
    financialYearTo = json['financial_year_to'];
    rewardCatalogue = json['reward_catalogue'];
    showRewardWorth = json['show_reward_worth'];
    galleryStorage = json['gallery_storage'];
    cmsCompanyImage = json['cms_company_image'];
    happinessChangeDays = json['happiness_change_days'];
    active = json['active'];
    emailStatus = json['email_status'];
    notificationStatus = json['notification_status'];
    transactionLogicMasterId = json['transaction_logic_master_id'];
    variableStatus = json['variable_status'];
    audioFlag = json['audio_flag'];
    videoFlag = json['video_flag'];
    recorddate = json['recorddate'];
    otpMode = json['otp_mode'];
    isSalaryCreditEnable = json['is_salary_credit_enable'];
    tdsApplicableOl = json['tds_applicable_ol'];
    rewardTdsOld = json['reward_tds_old'];
    cashRewardEnable = json['cash_reward_enable'];
    panFinanceApproverIdOld = json['pan_finance_approver_id_old'];
    panDocumentsApproverIdOld = json['pan_documents_approver_id_old'];
    bankFinanceApproverIdOld = json['bank_finance_approver_id_old'];
    upiFinanceApproverIdOld = json['upi_finance_approver_id_old'];
    paytmFinanceApproverId = json['paytm_finance_approver_id'];
    bankDocumentsApproverIdOld = json['bank_documents_approver_id_old'];
    upiDocumentsApproverIdOld = json['upi_documents_approver_id_old'];
    paytmDocumentsApproverId = json['paytm_documents_approver_id'];
    allowUserEditMobileEmail = json['allow_user_edit_mobile_email'];
    allowUserEditPanOld = json['allow_user_edit_pan_old'];
    allowUserEditBankOld = json['allow_user_edit_bank_old'];
    isHierarchyEnabled = json['is_hierarchy_enabled'];
    productcode = json['productcode'];
    productPoweredBy = json['product_powered_by'];
    isForecedRedemptionEnabled = json['is_foreced_redemption_enabled'];
    paymentModeId = json['payment_mode_id'];
    displayProcessingFee = json['display_processing_fee'];
    isAutoPennyDropEnabledOld = json['is_auto_penny_drop_enabled_old'];
    smsStatus = json['sms_status'];
    redemptionLimitOld = json['redemption_limit_old'];
    tdsApplicabilityIdFkOld = json['tds_applicability_id_fk_old'];
    paytmTransferEnable = json['paytm_transfer_enable'];
    allowUserEditPaytmNumber = json['allow_user_edit_paytm_number'];
    updatedDate = json['updated_date'];
    countryIsoCode = json['country_iso_code'];
    level1DocumentsApproverId = json['level1_documents_approver_id'];
    level2FinanceApproverId = json['level2_finance_approver_id'];
    countryCode = json['country_code'];
    tdsApplicabilityIdFk = json['tds_applicability_id_fk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_profile_id_pk'] = this.companyProfileIdPk;
    data['cms_company_id_fk'] = this.cmsCompanyIdFk;
    data['supp_email'] = this.suppEmail;
    data['one_point_is'] = this.onePointIs;
    data['per_user_per_month'] = this.perUserPerMonth;
    data['billing_cycle_id'] = this.billingCycleId;
    data['billing_cycle'] = this.billingCycle;
    data['billing_day'] = this.billingDay;
    data['financial_year_from'] = this.financialYearFrom;
    data['financial_year_to'] = this.financialYearTo;
    data['reward_catalogue'] = this.rewardCatalogue;
    data['show_reward_worth'] = this.showRewardWorth;
    data['gallery_storage'] = this.galleryStorage;
    data['cms_company_image'] = this.cmsCompanyImage;
    data['happiness_change_days'] = this.happinessChangeDays;
    data['active'] = this.active;
    data['email_status'] = this.emailStatus;
    data['notification_status'] = this.notificationStatus;
    data['transaction_logic_master_id'] = this.transactionLogicMasterId;
    data['variable_status'] = this.variableStatus;
    data['audio_flag'] = this.audioFlag;
    data['video_flag'] = this.videoFlag;
    data['recorddate'] = this.recorddate;
    data['otp_mode'] = this.otpMode;
    data['is_salary_credit_enable'] = this.isSalaryCreditEnable;
    data['tds_applicable_ol'] = this.tdsApplicableOl;
    data['reward_tds_old'] = this.rewardTdsOld;
    data['cash_reward_enable'] = this.cashRewardEnable;
    data['pan_finance_approver_id_old'] = this.panFinanceApproverIdOld;
    data['pan_documents_approver_id_old'] = this.panDocumentsApproverIdOld;
    data['bank_finance_approver_id_old'] = this.bankFinanceApproverIdOld;
    data['upi_finance_approver_id_old'] = this.upiFinanceApproverIdOld;
    data['paytm_finance_approver_id'] = this.paytmFinanceApproverId;
    data['bank_documents_approver_id_old'] = this.bankDocumentsApproverIdOld;
    data['upi_documents_approver_id_old'] = this.upiDocumentsApproverIdOld;
    data['paytm_documents_approver_id'] = this.paytmDocumentsApproverId;
    data['allow_user_edit_mobile_email'] = this.allowUserEditMobileEmail;
    data['allow_user_edit_pan_old'] = this.allowUserEditPanOld;
    data['allow_user_edit_bank_old'] = this.allowUserEditBankOld;
    data['is_hierarchy_enabled'] = this.isHierarchyEnabled;
    data['productcode'] = this.productcode;
    data['product_powered_by'] = this.productPoweredBy;
    data['is_foreced_redemption_enabled'] = this.isForecedRedemptionEnabled;
    data['payment_mode_id'] = this.paymentModeId;
    data['display_processing_fee'] = this.displayProcessingFee;
    data['is_auto_penny_drop_enabled_old'] = this.isAutoPennyDropEnabledOld;
    data['sms_status'] = this.smsStatus;
    data['redemption_limit_old'] = this.redemptionLimitOld;
    data['tds_applicability_id_fk_old'] = this.tdsApplicabilityIdFkOld;
    data['paytm_transfer_enable'] = this.paytmTransferEnable;
    data['allow_user_edit_paytm_number'] = this.allowUserEditPaytmNumber;
    data['updated_date'] = this.updatedDate;
    data['country_iso_code'] = this.countryIsoCode;
    data['level1_documents_approver_id'] = this.level1DocumentsApproverId;
    data['level2_finance_approver_id'] = this.level2FinanceApproverId;
    data['country_code'] = this.countryCode;
    data['tds_applicability_id_fk'] = this.tdsApplicabilityIdFk;
    return data;
  }
}

class BillingCycle {
  String? billingCycleId;
  String? billingCycle;

  BillingCycle({this.billingCycleId, this.billingCycle});

  BillingCycle.fromJson(Map<String, dynamic> json) {
    billingCycleId = json['billing_cycle_id'];
    billingCycle = json['billing_cycle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billing_cycle_id'] = this.billingCycleId;
    data['billing_cycle'] = this.billingCycle;
    return data;
  }
}

class Days {
  String? dayId;
  String? dayName;

  Days({this.dayId, this.dayName});

  Days.fromJson(Map<String, dynamic> json) {
    dayId = json['day_id'];
    dayName = json['day_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_id'] = this.dayId;
    data['day_name'] = this.dayName;
    return data;
  }
}
