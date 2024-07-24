class PaytmDetailsResponse {
  final PaytmDetails? paytmDetails;
  final ApprovalDetails? approvalDetails;

  PaytmDetailsResponse({
    this.paytmDetails,
    this.approvalDetails,
  });

  factory PaytmDetailsResponse.fromJson(Map<String, dynamic> json) {
    print('dkfhgf $json');
    return PaytmDetailsResponse(
      paytmDetails: json['paytm_details'] != null
          ? PaytmDetails.fromJson(json['paytm_details'])
          : null,
      approvalDetails: json['approval_details'] != null
          ? ApprovalDetails.fromJson(json['approval_details'])
          : null,
    );
  }
}

class PaytmDetails {
  final String? userId;
  final String? approvalStatusId;
  final String? approvalStatus;
  final String? paytmHolderFname;
  final String? paytmHolderLname;
  final String? userPaytmId;
  final String? paytmLinkedMobile;
  final String? userFirstName;
  final String? userLastName;
  final String? userEmail;
  final String? paytmSubmitDate;
  final String? pennyDropProcess;
  final String? userCode;
  final int? allowUserToEditPaytm;
  final int? disabled;
  final int? showAutomatedApiCheck;

  PaytmDetails({
    this.userId,
    this.approvalStatusId,
    this.approvalStatus,
    this.paytmHolderFname,
    this.paytmHolderLname,
    this.userPaytmId,
    this.paytmLinkedMobile,
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.paytmSubmitDate,
    this.pennyDropProcess,
    this.userCode,
    this.allowUserToEditPaytm,
    this.disabled,
    this.showAutomatedApiCheck,
  });

  factory PaytmDetails.fromJson(Map<String, dynamic> json) {
    print('sdhf $json');
    return PaytmDetails(
      userId: json['user_id'] as String?,
      approvalStatusId: json['approval_status_id'] as String?,
      approvalStatus: json['approval_status'] as String?,
      paytmHolderFname: json['paytm_holder_fname'] as String?,
      paytmHolderLname: json['paytm_holder_lname'] as String?,
      userPaytmId: json['user_paytm_id'] as String?,
      paytmLinkedMobile: json['paytm_linked_mobile'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      userEmail: json['user_email'] as String?,
      paytmSubmitDate: json['paytm_submit_date'] as String?,
      pennyDropProcess: json['penny_drop_process'] as String?,
      userCode: json['user_code'] as String?,
      allowUserToEditPaytm: json['allow_user_to_edit_paytm'] as int?,
      disabled: json['disabled'] as int?,
      showAutomatedApiCheck: json['show_automated_api_check'] as int?,
    );
  }
}

class ApprovalDetails {
  final String? paytmApprovalId;
  final String? userPaytmId;
  final String? userId;
  final String? comments;
  final String? approvalStatusId;
  final String? paytmIdApproved;
  final String? paytmFirstnameApproved;
  final String? paytmLastnameApproved;
  final String? paytmMobileApproved;
  final String? pennyDropApproved;
  final String? approverUserId;
  final String? approverUserName;
  final String? approverUserEmail;
  final String? paytmBeneficiaryName;
  final String? paytmBeneficiaryNameManualApproved;
  final String? paytmBeneficiaryNameAutoApproved;
  final String? pennyDropResponse;
  final String? createdAt;

  ApprovalDetails({
    this.paytmApprovalId,
    this.userPaytmId,
    this.userId,
    this.comments,
    this.approvalStatusId,
    this.paytmIdApproved,
    this.paytmFirstnameApproved,
    this.paytmLastnameApproved,
    this.paytmMobileApproved,
    this.pennyDropApproved,
    this.approverUserId,
    this.approverUserName,
    this.approverUserEmail,
    this.paytmBeneficiaryName,
    this.paytmBeneficiaryNameManualApproved,
    this.paytmBeneficiaryNameAutoApproved,
    this.pennyDropResponse,
    this.createdAt,
  });

  factory ApprovalDetails.fromJson(Map<String, dynamic> json) {
    return ApprovalDetails(
      paytmApprovalId: json['paytm_approval_id'] as String?,
      userPaytmId: json['user_paytm_id'] as String?,
      userId: json['user_id'] as String?,
      comments: json['comments'] as String?,
      approvalStatusId: json['approval_status_id'] as String?,
      paytmIdApproved: json['paytm_id_approved'] as String?,
      paytmFirstnameApproved: json['paytm_firstname_approved'] as String?,
      paytmLastnameApproved: json['paytm_lastname_approved'] as String?,
      paytmMobileApproved: json['paytm_mobile_approved'] as String?,
      pennyDropApproved: json['penny_drop_approved'] as String?,
      approverUserId: json['approver_user_id'] as String?,
      approverUserName: json['approver_user_name'] as String?,
      approverUserEmail: json['approver_user_email'] as String?,
      paytmBeneficiaryName: json['paytm_beneficiary_name'] as String?,
      paytmBeneficiaryNameManualApproved:
          json['paytm_beneficiary_name_manual_approved'] as String?,
      paytmBeneficiaryNameAutoApproved:
          json['paytm_beneficiary_name_auto_approved'] as String?,
      pennyDropResponse: json['penny_drop_response'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }
}
