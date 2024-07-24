class EmailPreference {
  String? userProfileName;
  List<EmailStatus>? emailStatus;
  List<EmailDetails>? emailDetails;
  List<EmailActive>? emailActive;
  List<EmailDetailsFull>? emailDetailsFull;

  EmailPreference({
    this.userProfileName,
    this.emailStatus,
    this.emailDetails,
    this.emailActive,
    this.emailDetailsFull,
  });

  factory EmailPreference.fromJson(Map<String, dynamic> json) {
    return EmailPreference(
      userProfileName: json['userprofilename'] ?? '',
      emailStatus: (json['email_status'] as List?)
              ?.map((item) => EmailStatus.fromJson(item))
              .toList() ??
          [],
      emailDetails: (json['emaildetaisl'] as List?)
              ?.map((item) => EmailDetails.fromJson(item))
              .toList() ??
          [],
      emailActive: (json['email_active'] as List?)
              ?.map((item) => EmailActive.fromJson(item))
              .toList() ??
          [],
      emailDetailsFull: (json['emaildetaisfull'] as List?)
              ?.map((item) => EmailDetailsFull.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userprofilename': userProfileName,
      'email_status': emailStatus?.map((item) => item.toJson()).toList() ?? [],
      'emaildetaisl': emailDetails?.map((item) => item.toJson()).toList() ?? [],
      'email_active': emailActive?.map((item) => item.toJson()).toList() ?? [],
      'emaildetaisfull':
          emailDetailsFull?.map((item) => item.toJson()).toList() ?? [],
    };
  }
}

class EmailStatus {
  String? emailStatus;

  EmailStatus({this.emailStatus});

  factory EmailStatus.fromJson(Map<String, dynamic> json) {
    return EmailStatus(
      emailStatus: json['email_status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email_status': emailStatus,
    };
  }
}

class EmailDetails {
  String? emailCompanyMappingId;
  String? emailId;
  String? companyId;
  String? status;
  String? createdAt;

  EmailDetails({
    this.emailCompanyMappingId,
    this.emailId,
    this.companyId,
    this.status,
    this.createdAt,
  });

  factory EmailDetails.fromJson(Map<String, dynamic> json) {
    return EmailDetails(
      emailCompanyMappingId: json['email_company_mapping_id'] ?? '',
      emailId: json['email_id'] ?? '',
      companyId: json['company_id'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email_company_mapping_id': emailCompanyMappingId,
      'email_id': emailId,
      'company_id': companyId,
      'status': status,
      'created_at': createdAt,
    };
  }
}

class EmailActive {
  String? emailCompanyMappingId;
  String? emailId;
  String? companyId;
  String? status;
  String? createdAt;

  EmailActive({
    this.emailCompanyMappingId,
    this.emailId,
    this.companyId,
    this.status,
    this.createdAt,
  });

  factory EmailActive.fromJson(Map<String, dynamic> json) {
    return EmailActive(
      emailCompanyMappingId: json['email_company_mapping_id'] ?? '',
      emailId: json['email_id'] ?? '',
      companyId: json['company_id'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email_company_mapping_id': emailCompanyMappingId,
      'email_id': emailId,
      'company_id': companyId,
      'status': status,
      'created_at': createdAt,
    };
  }
}

class EmailDetailsFull {
  String? emailType;
  String? emailId;
  String? emailCompanyIdPk;
  String? userId;
  String? subscriptionStatus;
  String? unsubscriptionDate;
  String? unsubscriptionTillDate;
  String? emailSendDate;
  String? emailUserIdPk;
  String? cmsUserId;
  String? pSendStatus;

  EmailDetailsFull({
    this.emailType,
    this.emailId,
    this.emailCompanyIdPk,
    this.userId,
    this.subscriptionStatus,
    this.unsubscriptionDate,
    this.unsubscriptionTillDate,
    this.emailSendDate,
    this.emailUserIdPk,
    this.cmsUserId,
    this.pSendStatus,
  });

  factory EmailDetailsFull.fromJson(Map<String, dynamic> json) {
    return EmailDetailsFull(
      emailType: json['email_type'] ?? '',
      emailId: json['email_id'] ?? '',
      emailCompanyIdPk: json['email_company_id_pk'] ?? '',
      userId: json['userid'] ?? '',
      subscriptionStatus: json['subscription_status'] ?? '',
      unsubscriptionDate: json['unsubscription_date'] ?? '',
      unsubscriptionTillDate: json['unsubscription_tilldate'] ?? '',
      emailSendDate: json['email_send_date'] ?? '',
      emailUserIdPk: json['email_user_id_pk'] ?? '',
      cmsUserId: json['cms_user_id'] ?? '',
      pSendStatus: json['p_send_status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email_type': emailType,
      'email_id': emailId,
      'email_company_id_pk': emailCompanyIdPk,
      'userid': userId,
      'subscription_status': subscriptionStatus,
      'unsubscription_date': unsubscriptionDate,
      'unsubscription_tilldate': unsubscriptionTillDate,
      'email_send_date': emailSendDate,
      'email_user_id_pk': emailUserIdPk,
      'cms_user_id': cmsUserId,
      'p_send_status': pSendStatus,
    };
  }
}
