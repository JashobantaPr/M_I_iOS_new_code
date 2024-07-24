import 'dart:convert';

class VpaProfileResponse {
  List<VpaWallet> vpaWalletList;
  VpaDetails vpaDetails;
  bool status;
  ApprovalDetails approvalDetails;

  VpaProfileResponse({
    required this.vpaWalletList,
    required this.vpaDetails,
    required this.status,
    required this.approvalDetails,
  });

  factory VpaProfileResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return VpaProfileResponse(
        vpaWalletList: [],
        vpaDetails: VpaDetails.empty(),
        status: false,
        approvalDetails: ApprovalDetails.empty(),
      );
    }

    return VpaProfileResponse(
      vpaWalletList: (json['vpa_wallet_list'] as List<dynamic>?)
              ?.map((item) => VpaWallet.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      vpaDetails: json['vpa_details'] != null
          ? VpaDetails.fromJson(json['vpa_details'] as Map<String, dynamic>)
          : VpaDetails.empty(),
      status: json['status'] ?? false,
      approvalDetails: json['approval_details'] != null
          ? ApprovalDetails.fromJson(
              json['approval_details'] as Map<String, dynamic>)
          : ApprovalDetails.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vpa_wallet_list': vpaWalletList.map((item) => item.toJson()).toList(),
      'vpa_details': vpaDetails.toJson(),
      'status': status,
      'approval_details': approvalDetails.toJson(),
    };
  }
}

class VpaWallet {
  String id;
  String name;
  String countryIsoCode;
  String type;
  String code;
  String recordDate;
  String updatedDate;

  VpaWallet({
    required this.id,
    required this.name,
    required this.countryIsoCode,
    required this.type,
    required this.code,
    required this.recordDate,
    required this.updatedDate,
  });

  factory VpaWallet.fromJson(Map<String, dynamic> json) {
    return VpaWallet(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      countryIsoCode: json['country_iso_code'] as String? ?? '',
      type: json['type'] as String? ?? '',
      code: json['code'] as String? ?? '',
      recordDate: json['record_date'] as String? ?? '',
      updatedDate: json['updated_date'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country_iso_code': countryIsoCode,
      'type': type,
      'code': code,
      'record_date': recordDate,
      'updated_date': updatedDate,
    };
  }
}

class VpaDetails {
  String userId;
  String vpaAccount;
  String approvalStatusId;
  String approvalStatus;
  String userFirstName;
  String userLastName;
  String userEmail;
  String userVpaId;
  String vpaSubmitDate;
  String vpaLinkedMobile;
  String userCode;
  String vpaWalletName;
  String vpaWalletType;
  String vpaWalletId;
  String pennyDropProcess;
  bool allowUserToEditVpa;
  int disabled;
  int showAutomatedApiCheck;

  VpaDetails({
    required this.userId,
    required this.vpaAccount,
    required this.approvalStatusId,
    required this.approvalStatus,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.userVpaId,
    required this.vpaSubmitDate,
    required this.vpaLinkedMobile,
    required this.userCode,
    required this.vpaWalletName,
    required this.vpaWalletType,
    required this.vpaWalletId,
    required this.pennyDropProcess,
    required this.allowUserToEditVpa,
    required this.disabled,
    required this.showAutomatedApiCheck,
  });

  factory VpaDetails.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return VpaDetails.empty();
    }

    return VpaDetails(
      userId: json['user_id'] as String? ?? '',
      vpaAccount: json['vpa_account'] as String? ?? '',
      approvalStatusId: json['approval_status_id'] as String? ?? '',
      approvalStatus: json['approval_status'] as String? ?? '',
      userFirstName: json['user_first_name'] as String? ?? '',
      userLastName: json['user_last_name'] as String? ?? '',
      userEmail: json['user_email'] as String? ?? '',
      userVpaId: json['user_vpa_id'] as String? ?? '',
      vpaSubmitDate: json['vpa_submit_date'] as String? ?? '',
      vpaLinkedMobile: json['vpa_linked_mobile'] as String? ?? '',
      userCode: json['user_code'] as String? ?? '',
      vpaWalletName: json['vpa_wallet_name'] as String? ?? '',
      vpaWalletType: json['vpa_wallet_type'] as String? ?? '',
      vpaWalletId: json['vpa_wallet_id'] as String? ?? '',
      pennyDropProcess: json['penny_drop_process'] as String? ?? '',
      allowUserToEditVpa: json['allow_user_to_edit_vpa'] == 1,
      disabled: json['disabled'] as int? ?? 0,
      showAutomatedApiCheck: json['show_automated_api_check'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'vpa_account': vpaAccount,
      'approval_status_id': approvalStatusId,
      'approval_status': approvalStatus,
      'user_first_name': userFirstName,
      'user_last_name': userLastName,
      'user_email': userEmail,
      'user_vpa_id': userVpaId,
      'vpa_submit_date': vpaSubmitDate,
      'vpa_linked_mobile': vpaLinkedMobile,
      'user_code': userCode,
      'vpa_wallet_name': vpaWalletName,
      'vpa_wallet_type': vpaWalletType,
      'vpa_wallet_id': vpaWalletId,
      'penny_drop_process': pennyDropProcess,
      'allow_user_to_edit_vpa': allowUserToEditVpa ? 1 : 0,
      'disabled': disabled,
      'show_automated_api_check': showAutomatedApiCheck,
    };
  }

  // Factory constructor to return an empty instance
  factory VpaDetails.empty() {
    return VpaDetails(
      userId: '',
      vpaAccount: '',
      approvalStatusId: '',
      approvalStatus: '',
      userFirstName: '',
      userLastName: '',
      userEmail: '',
      userVpaId: '',
      vpaSubmitDate: '',
      vpaLinkedMobile: '',
      userCode: '',
      vpaWalletName: '',
      vpaWalletType: '',
      vpaWalletId: '',
      pennyDropProcess: '',
      allowUserToEditVpa: false,
      disabled: 0,
      showAutomatedApiCheck: 0,
    );
  }
}

class ApprovalDetails {
  String vpaApprovalId;
  String userVpaId;
  String userId;
  String? comments;
  String approvalStatusId;
  String vpaAccountNameApproved;
  String vpaWalletNameApproved;
  String vpaMobileApproved;
  String pennyDropApproved;
  String approverUserId;
  String approverUserName;
  String approverUserEmail;
  String? vpaBeneficiaryName;
  String vpaBeneficiaryNameManualApproved;
  String vpaBeneficiaryNameAutoApproved;
  String? pennyDropResponse;
  String createdAt;

  ApprovalDetails({
    required this.vpaApprovalId,
    required this.userVpaId,
    required this.userId,
    this.comments,
    required this.approvalStatusId,
    required this.vpaAccountNameApproved,
    required this.vpaWalletNameApproved,
    required this.vpaMobileApproved,
    required this.pennyDropApproved,
    required this.approverUserId,
    required this.approverUserName,
    required this.approverUserEmail,
    this.vpaBeneficiaryName,
    required this.vpaBeneficiaryNameManualApproved,
    required this.vpaBeneficiaryNameAutoApproved,
    this.pennyDropResponse,
    required this.createdAt,
  });

  factory ApprovalDetails.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ApprovalDetails.empty();
    }

    return ApprovalDetails(
      vpaApprovalId: json['vpa_approval_id'] as String? ?? '',
      userVpaId: json['user_vpa_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      comments: json['comments'] as String?,
      approvalStatusId: json['approval_status_id'] as String? ?? '',
      vpaAccountNameApproved:
          json['vpa_account_name_approved'] as String? ?? '',
      vpaWalletNameApproved: json['vpa_wallet_name_approved'] as String? ?? '',
      vpaMobileApproved: json['vpa_mobile_approved'] as String? ?? '',
      pennyDropApproved: json['penny_drop_approved'] as String? ?? '',
      approverUserId: json['approver_user_id'] as String? ?? '',
      approverUserName: json['approver_user_name'] as String? ?? '',
      approverUserEmail: json['approver_user_email'] as String? ?? '',
      vpaBeneficiaryName: json['vpa_beneficiary_name'] as String?,
      vpaBeneficiaryNameManualApproved:
          json['vpa_beneficiary_name_manual_approved'] as String? ?? '',
      vpaBeneficiaryNameAutoApproved:
          json['vpa_beneficiary_name_auto_approved'] as String? ?? '',
      pennyDropResponse: json['penny_drop_response'] as String?,
      createdAt: json['created_at'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vpa_approval_id': vpaApprovalId,
      'user_vpa_id': userVpaId,
      'user_id': userId,
      'comments': comments,
      'approval_status_id': approvalStatusId,
      'vpa_account_name_approved': vpaAccountNameApproved,
      'vpa_wallet_name_approved': vpaWalletNameApproved,
      'vpa_mobile_approved': vpaMobileApproved,
      'penny_drop_approved': pennyDropApproved,
      'approver_user_id': approverUserId,
      'approver_user_name': approverUserName,
      'approver_user_email': approverUserEmail,
      'vpa_beneficiary_name': vpaBeneficiaryName,
      'vpa_beneficiary_name_manual_approved': vpaBeneficiaryNameManualApproved,
      'vpa_beneficiary_name_auto_approved': vpaBeneficiaryNameAutoApproved,
      'penny_drop_response': pennyDropResponse,
      'created_at': createdAt,
    };
  }

  // Factory constructor to return an empty instance
  factory ApprovalDetails.empty() {
    return ApprovalDetails(
      vpaApprovalId: '',
      userVpaId: '',
      userId: '',
      comments: null,
      approvalStatusId: '',
      vpaAccountNameApproved: '',
      vpaWalletNameApproved: '',
      vpaMobileApproved: '',
      pennyDropApproved: '',
      approverUserId: '',
      approverUserName: '',
      approverUserEmail: '',
      vpaBeneficiaryName: null,
      vpaBeneficiaryNameManualApproved: '',
      vpaBeneficiaryNameAutoApproved: '',
      pennyDropResponse: null,
      createdAt: '',
    );
  }
}
