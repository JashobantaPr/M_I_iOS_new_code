class PanProfileEdit {
  final List<ProfileType>? listProfileTypes;
  final PanDetails? panDetails;
  final ApprovalDetails? approvalDetails;
  final String? countryIsoCode;
  final bool? isRedemptionLimitCrossed;

  PanProfileEdit({
    this.listProfileTypes,
    this.panDetails,
    this.approvalDetails,
    this.countryIsoCode,
    this.isRedemptionLimitCrossed,
  });

  factory PanProfileEdit.fromJson(Map<String, dynamic> json) {
    print('shfgh ${json['approval_details']}');
    return PanProfileEdit(
      listProfileTypes: (json['list_profile_types'] as List<dynamic>?)
          ?.map((e) => ProfileType.fromJson(e as Map<String, dynamic>))
          .toList(),
      panDetails: json['pan_details'] != null
          ? PanDetails.fromJson(json['pan_details'])
          : null,
      approvalDetails: json['approval_details'] != null
          ? ApprovalDetails.fromJson(json['approval_details'])
          : null,
      countryIsoCode: json['country_iso_code'] as String?,
      isRedemptionLimitCrossed: json['isRedemptionLimitCrossed'],
    );
  }
}

class ProfileType {
  final String? profileTypeId;
  final String? profileTypeName;

  ProfileType({
    this.profileTypeId,
    this.profileTypeName,
  });

  factory ProfileType.fromJson(Map<String, dynamic> json) {
    return ProfileType(
      profileTypeId: json['profile_type_id'] as String?,
      profileTypeName: json['profile_type_name'] as String?,
    );
  }
}

class PanDetails {
  final String? userId;
  final String? profileTypeId;
  final String? nameOnPanCard;
  final String? panCardNumber;
  final String? panCardImage;
  final String? approvalStatusId;
  final String? panSubmitDate;
  final String? approvalStatus;
  final String? profileTypeName;
  final String? userFirstName;
  final String? userLastName;
  final String? userPanId;
  final String? userEmail;
  final String? panCardImageUrl;
  final String? allowUserToEditPan;
  final int? disabled;
  final int? showNsdlApproval;

  PanDetails({
    this.userId,
    this.profileTypeId,
    this.nameOnPanCard,
    this.panCardNumber,
    this.panCardImage,
    this.approvalStatusId,
    this.panSubmitDate,
    this.approvalStatus,
    this.profileTypeName,
    this.userFirstName,
    this.userLastName,
    this.userPanId,
    this.userEmail,
    this.panCardImageUrl,
    this.allowUserToEditPan,
    this.disabled,
    this.showNsdlApproval,
  });

  factory PanDetails.fromJson(Map<String, dynamic> json) {
    return PanDetails(
      userId: json['user_id'] as String?,
      profileTypeId: json['profile_type_id'] as String?,
      nameOnPanCard: json['name_on_pan_card'] as String?,
      panCardNumber: json['pan_card_number'] as String?,
      panCardImage: json['pan_card_image'] as String?,
      approvalStatusId: json['approval_status_id'] as String?,
      panSubmitDate: json['pan_submit_date'] as String?,
      approvalStatus: json['approval_status'] as String?,
      profileTypeName: json['profile_type_name'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      userPanId: json['user_pan_id'] as String?,
      userEmail: json['user_email'] as String?,
      panCardImageUrl: json['pan_card_image_url'] as String?,
      allowUserToEditPan: json['allow_user_to_edit_pan'].toString(),
      disabled: json['disabled'],
      showNsdlApproval: json['show_nsdl_approval'],
    );
  }
}

class ApprovalDetails {
  final String? panApprovalId;
  final String? userPanId;
  final String? userId;
  final String? comments;
  final String? approvalStatusId;
  final String? nameOnPancardApproved;
  final String? pancardNumberApproved;
  final String? pancardImageApproved;
  final String? nsdlApproved;
  final String? approverUserId;
  final String? approverUserName;
  final String? approverUserEmail;
  final String? recordDate;
  final String? updatedDate;

  ApprovalDetails({
    this.panApprovalId,
    this.userPanId,
    this.userId,
    this.comments,
    this.approvalStatusId,
    this.nameOnPancardApproved,
    this.pancardNumberApproved,
    this.pancardImageApproved,
    this.nsdlApproved,
    this.approverUserId,
    this.approverUserName,
    this.approverUserEmail,
    this.recordDate,
    this.updatedDate,
  });

  factory ApprovalDetails.fromJson(Map<String, dynamic> json) {
    return ApprovalDetails(
      panApprovalId: json['pan_approval_id'] as String?,
      userPanId: json['user_pan_id'] as String?,
      userId: json['user_id'] as String?,
      comments: json['comments'] as String?,
      approvalStatusId: json['approval_status_id'] as String?,
      nameOnPancardApproved: json['name_on_pancard_approved'] as String?,
      pancardNumberApproved: json['pancard_number_approved'] as String?,
      pancardImageApproved: json['pancard_image_approved'] as String?,
      nsdlApproved: json['nsdl_approved'] as String?,
      approverUserId: json['approver_user_id'] as String?,
      approverUserName: json['approver_user_name'] as String?,
      approverUserEmail: json['approver_user_email'] as String?,
      recordDate: json['record_date'] as String?,
      updatedDate: json['updated_date'] as String?,
    );
  }
}
