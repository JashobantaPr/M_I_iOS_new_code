class BankProfileData {
  final List<ProfileType>? listProfileTypes;
  final List<AccountType>? listAccountTypes;
  final List<Bank>? bankList;
  final BankDetails? bankDetails;
  final ApprovalDetails? approvalDetails;
  final String? countryIsoCode;

  BankProfileData({
    this.listProfileTypes,
    this.listAccountTypes,
    this.bankList,
    this.bankDetails,
    this.approvalDetails,
    this.countryIsoCode,
  });

  factory BankProfileData.fromJson(Map<String, dynamic> json) {
    return BankProfileData(
      listProfileTypes: (json['list_profile_types'] as List?)
          ?.map((e) => ProfileType.fromJson(e))
          .toList(),
      listAccountTypes: (json['list_account_types'] as List?)
          ?.map((e) => AccountType.fromJson(e))
          .toList(),
      bankList:
          (json['bank_list'] as List?)?.map((e) => Bank.fromJson(e)).toList(),
      bankDetails: json['bank_details'] != null
          ? BankDetails.fromJson(json['bank_details'])
          : null,
      approvalDetails: json['approval_details'] != null
          ? ApprovalDetails.fromJson(json['approval_details'])
          : null,
      countryIsoCode: json['country_iso_code'] as String?,
    );
  }
}

class ProfileType {
  final String? profileTypeId;
  final String? profileTypeName;

  ProfileType({this.profileTypeId, this.profileTypeName});

  factory ProfileType.fromJson(Map<String, dynamic> json) {
    return ProfileType(
      profileTypeId: json['profile_type_id'] as String?,
      profileTypeName: json['profile_type_name'] as String?,
    );
  }
}

class AccountType {
  final String? accountTypeIdPk;
  final String? typeName;

  AccountType({this.accountTypeIdPk, this.typeName});

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return AccountType(
      accountTypeIdPk: json['account_type_id_pk'] as String?,
      typeName: json['type_name'] as String?,
    );
  }
}

class Bank {
  final String? bankId;
  final String? bankName;

  Bank({this.bankId, this.bankName});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      bankId: json['bank_id'] as String?,
      bankName: json['bank_name'] as String?,
    );
  }
}

class BankDetails {
  final String? userId;
  final String? accountHolderName;
  final String? bankId;
  final String? bankAccountNumber;
  final String? accountType;
  final String? cancelledChequeImage;
  final String? approvalStatusId;
  final String? approvalStatus;
  final String? profileTypeId;
  final String? ifscCode;
  final String? profileTypeName;
  final String? userFirstName;
  final String? userLastName;
  final String? userEmail;
  final String? bankName;
  final String? userBankId;
  final String? typeName;
  final String? bankSubmitDate;
  final String? pennyDropProcess;
  final String? userCode;
  final String? countryIsoCode;
  final String? branchId;
  final String? branchName;
  final String? cancelledChequeImageUrl;
  final int? allowUserToEditBank;
  final int? disabled;
  final int? showAutomatedApiCheck;

  BankDetails({
    this.userId,
    this.accountHolderName,
    this.bankId,
    this.bankAccountNumber,
    this.accountType,
    this.cancelledChequeImage,
    this.approvalStatusId,
    this.approvalStatus,
    this.profileTypeId,
    this.ifscCode,
    this.profileTypeName,
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.bankName,
    this.userBankId,
    this.typeName,
    this.bankSubmitDate,
    this.pennyDropProcess,
    this.userCode,
    this.countryIsoCode,
    this.branchId,
    this.branchName,
    this.cancelledChequeImageUrl,
    this.allowUserToEditBank,
    this.disabled,
    this.showAutomatedApiCheck,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return BankDetails(
      userId: json['user_id'] as String?,
      accountHolderName: json['account_holder_name'] as String?,
      bankId: json['bank_id'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
      accountType: json['account_type'] as String?,
      cancelledChequeImage: json['cancelled_cheque_image'] as String?,
      approvalStatusId: json['approval_status_id'] as String?,
      approvalStatus: json['approval_status'] as String?,
      profileTypeId: json['profile_type_id'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      profileTypeName: json['profile_type_name'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      userEmail: json['user_email'] as String?,
      bankName: json['bank_name'] as String?,
      userBankId: json['user_bank_id'] as String?,
      typeName: json['type_name'] as String?,
      bankSubmitDate: json['bank_submit_date'] as String?,
      pennyDropProcess: json['penny_drop_process'] as String?,
      userCode: json['user_code'] as String?,
      countryIsoCode: json['country_iso_code'] as String?,
      branchId: json['branch_id'] as String?,
      branchName: json['branch_name'] as String?,
      cancelledChequeImageUrl: json['cancelled_cheque_image_url'] as String?,
      allowUserToEditBank: json['allow_user_to_edit_bank'] as int?,
      disabled: json['disabled'] as int?,
      showAutomatedApiCheck: json['show_automated_api_check'] as int?,
    );
  }
}

class ApprovalDetails {
  final String? bankApprovalId;
  final String? userBankId;
  final String? userId;
  final String? comments;
  final String? approvalStatusId;
  final String? ifscCodeApproved;
  final String? accountTypeApproved;
  final String? bankNameApproved;
  final String? cancelledChequeApproved;
  final String? accountHolderNameApproved;
  final String? bankAccountNumberApproved;
  final String? pennyDropApproved;
  final String? approverUserId;
  final String? approverUserName;
  final String? approverUserEmail;
  final String? recordDate;
  final String? updatedDate;
  final String? beneficiaryName;
  final String? beneficiaryNameManualApproved;
  final String? beneficiaryNameAutoApproved;
  final String? pennyDropResponse;
  final String? branchNameApproved;

  ApprovalDetails({
    this.bankApprovalId,
    this.userBankId,
    this.userId,
    this.comments,
    this.approvalStatusId,
    this.ifscCodeApproved,
    this.accountTypeApproved,
    this.bankNameApproved,
    this.cancelledChequeApproved,
    this.accountHolderNameApproved,
    this.bankAccountNumberApproved,
    this.pennyDropApproved,
    this.approverUserId,
    this.approverUserName,
    this.approverUserEmail,
    this.recordDate,
    this.updatedDate,
    this.beneficiaryName,
    this.beneficiaryNameManualApproved,
    this.beneficiaryNameAutoApproved,
    this.pennyDropResponse,
    this.branchNameApproved,
  });

  factory ApprovalDetails.fromJson(Map<String, dynamic> json) {
    return ApprovalDetails(
      bankApprovalId: json['bank_approval_id'] as String?,
      userBankId: json['user_bank_id'] as String?,
      userId: json['user_id'] as String?,
      comments: json['comments'] as String?,
      approvalStatusId: json['approval_status_id'] as String?,
      ifscCodeApproved: json['ifsc_code_approved'] as String?,
      accountTypeApproved: json['account_type_approved'] as String?,
      bankNameApproved: json['bank_name_approved'] as String?,
      cancelledChequeApproved: json['cancelled_cheque_approved'] as String?,
      accountHolderNameApproved:
          json['account_holder_name_approved'] as String?,
      bankAccountNumberApproved:
          json['bank_account_number_approved'] as String?,
      pennyDropApproved: json['penny_drop_approved'] as String?,
      approverUserId: json['approver_user_id'] as String?,
      approverUserName: json['approver_user_name'] as String?,
      approverUserEmail: json['approver_user_email'] as String?,
      recordDate: json['record_date'] as String?,
      updatedDate: json['updated_date'] as String?,
      beneficiaryName: json['beneficiary_name'] as String?,
      beneficiaryNameManualApproved:
          json['beneficiary_name_manual_approved'] as String?,
      beneficiaryNameAutoApproved:
          json['beneficiary_name_auto_approved'] as String?,
      pennyDropResponse: json['penny_drop_response'] as String?,
      branchNameApproved: json['branch_name_approved'] as String?,
    );
  }
}
