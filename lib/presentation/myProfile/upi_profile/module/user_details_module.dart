class UpiDetails {
  final UpiDetailsData? upiDetails;
  final ApprovalDetails? approvalDetails;

  UpiDetails({
    this.upiDetails,
    this.approvalDetails,
  });

  factory UpiDetails.fromJson(Map<String, dynamic> json) {
    return UpiDetails(
      upiDetails: json['upi_details'] != null
          ? UpiDetailsData.fromJson(json['upi_details'])
          : null,
      approvalDetails: json['approval_details'] != null
          ? ApprovalDetails.fromJson(json['approval_details'])
          : null,
    );
  }
}

class UpiDetailsData {
  final String? userId;
  final String? upiId;
  final String? upiFname;
  final String? upiLname;
  final String? approvalStatusId;
  final String? approvalStatus;
  final String? userFirstName;
  final String? userLastName;
  final String? userEmail;
  final String? userUpiId;
  final String? upiSubmitDate;
  final String? userCode;
  final int? allowUserToEditUpi;
  final int? disabled;
  final int? showAutomatedApiCheck;

  UpiDetailsData({
    this.userId,
    this.upiId,
    this.upiFname,
    this.upiLname,
    this.approvalStatusId,
    this.approvalStatus,
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.userUpiId,
    this.upiSubmitDate,
    this.userCode,
    this.allowUserToEditUpi,
    this.disabled,
    this.showAutomatedApiCheck,
  });

  factory UpiDetailsData.fromJson(Map<String, dynamic> json) {
    return UpiDetailsData(
      userId: json['user_id'],
      upiId: json['upi_id'],
      upiFname: json['upi_fname'],
      upiLname: json['upi_lname'],
      approvalStatusId: json['approval_status_id'],
      approvalStatus: json['approval_status'],
      userFirstName: json['user_first_name'],
      userLastName: json['user_last_name'],
      userEmail: json['user_email'],
      userUpiId: json['user_upi_id'],
      upiSubmitDate: json['upi_submit_date'],
      userCode: json['user_code'],
      allowUserToEditUpi: json['allow_user_to_edit_upi'],
      disabled: json['disabled'],
      showAutomatedApiCheck: json['show_automated_api_check'],
    );
  }
}

class ApprovalDetails {
  final String? upiApprovalId;
  final String? userUpiId;
  final String? userId;
  final String? comments;
  final String? approvalStatusId;
  final String? upiIdApproved;
  final String? upiFirstnameApproved;
  final String? upiLastnameApproved;
  final String? pennyDropApproved;
  final String? approverUserId;
  final String? approverUserName;
  final String? approverUserEmail;
  final String? upiBeneficiaryName;
  final String? upiBeneficiaryNameManualApproved;
  final String? upiBeneficiaryNameAutoApproved;
  final String? pennyDropResponse;
  final String? createdAt;

  ApprovalDetails({
    this.upiApprovalId,
    this.userUpiId,
    this.userId,
    this.comments,
    this.approvalStatusId,
    this.upiIdApproved,
    this.upiFirstnameApproved,
    this.upiLastnameApproved,
    this.pennyDropApproved,
    this.approverUserId,
    this.approverUserName,
    this.approverUserEmail,
    this.upiBeneficiaryName,
    this.upiBeneficiaryNameManualApproved,
    this.upiBeneficiaryNameAutoApproved,
    this.pennyDropResponse,
    this.createdAt,
  });

  factory ApprovalDetails.fromJson(Map<String, dynamic> json) {
    return ApprovalDetails(
      upiApprovalId: json['upi_approval_id'],
      userUpiId: json['user_upi_id'],
      userId: json['user_id'],
      comments: json['comments'],
      approvalStatusId: json['approval_status_id'],
      upiIdApproved: json['upi_id_approved'],
      upiFirstnameApproved: json['upi_firstname_approved'],
      upiLastnameApproved: json['upi_lastname_approved'],
      pennyDropApproved: json['penny_drop_approved'],
      approverUserId: json['approver_user_id'],
      approverUserName: json['approver_user_name'],
      approverUserEmail: json['approver_user_email'],
      upiBeneficiaryName: json['upi_beneficiary_name'],
      upiBeneficiaryNameManualApproved:
          json['upi_beneficiary_name_manual_approved'],
      upiBeneficiaryNameAutoApproved:
          json['upi_beneficiary_name_auto_approved'],
      pennyDropResponse: json['penny_drop_response'],
      createdAt: json['created_at'],
    );
  }
}
