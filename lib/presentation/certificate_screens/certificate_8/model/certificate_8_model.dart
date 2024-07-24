class CertificateResponse {
  final String logoSignUrl;
  final String backImgUrl;
  final String signNameImgUrl;
  final String dateImgUrl;
  final String overlayImgUrl;
  final List<Certificate> allCertificates;
  final bool certificateAwardStatus;

  CertificateResponse({
    required this.logoSignUrl,
    required this.backImgUrl,
    required this.signNameImgUrl,
    required this.dateImgUrl,
    required this.overlayImgUrl,
    required this.allCertificates,
    required this.certificateAwardStatus,
  });

  factory CertificateResponse.fromJson(Map<String, dynamic> json) {
    var list = json['allCertificates'] as List;
    List<Certificate> certificateList =
        list.map((i) => Certificate.fromJson(i)).toList();

    return CertificateResponse(
      logoSignUrl: json['logo_sign_url'],
      backImgUrl: json['back_img_url'],
      signNameImgUrl: json['sign_name_img_url'],
      dateImgUrl: json['date_img_url'],
      overlayImgUrl: json['overlay_img_url'],
      allCertificates: certificateList,
      certificateAwardStatus: json['certificateAwardStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'logo_sign_url': logoSignUrl,
      'back_img_url': backImgUrl,
      'sign_name_img_url': signNameImgUrl,
      'date_img_url': dateImgUrl,
      'overlay_img_url': overlayImgUrl,
      'allCertificates': allCertificates.map((v) => v.toJson()).toList(),
      'certificateAwardStatus': certificateAwardStatus,
    };
  }
}

class Certificate {
  final String certificateMasterIdPk;
  final String certificateName;
  final String certificatePoints;
  final String certificateTypeIdFk;
  final String certificateAllocationIdPk;
  final String bucketIdFk;
  final String certificateAllotedCertificateCount;
  final String certificateDistributionCount;
  final String certificateDetailIdPk;
  final String certificateDetailTitle;
  final String certificateDetailSubtitle;
  final String certificateDetailCompanyLogoUrl;
  final String certificateDetailSignatureUrl;
  final String certificateTemplateMasterIdPk;
  final String certificateTemplateName;

  Certificate({
    required this.certificateMasterIdPk,
    required this.certificateName,
    required this.certificatePoints,
    required this.certificateTypeIdFk,
    required this.certificateAllocationIdPk,
    required this.bucketIdFk,
    required this.certificateAllotedCertificateCount,
    required this.certificateDistributionCount,
    required this.certificateDetailIdPk,
    required this.certificateDetailTitle,
    required this.certificateDetailSubtitle,
    required this.certificateDetailCompanyLogoUrl,
    required this.certificateDetailSignatureUrl,
    required this.certificateTemplateMasterIdPk,
    required this.certificateTemplateName,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      certificateMasterIdPk: json['certificate_master_id_pk'],
      certificateName: json['certificate_name'],
      certificatePoints: json['certificate_points'],
      certificateTypeIdFk: json['certificate_type_id_fk'],
      certificateAllocationIdPk: json['certificate_allocation_id_pk'],
      bucketIdFk: json['bucket_id_fk'],
      certificateAllotedCertificateCount:
          json['certificate_alloted_certificate_count'],
      certificateDistributionCount: json['certificate_distribution_count'],
      certificateDetailIdPk: json['certificate_detail_id_pk'],
      certificateDetailTitle: json['certificate_detail_title'],
      certificateDetailSubtitle: json['certificate_detail_subtitle'],
      certificateDetailCompanyLogoUrl:
          json['certificate_detail_company_logo_url'],
      certificateDetailSignatureUrl: json['certificate_detail_signature_url'],
      certificateTemplateMasterIdPk: json['certificate_template_master_id_pk'],
      certificateTemplateName: json['certificate_template_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'certificate_master_id_pk': certificateMasterIdPk,
      'certificate_name': certificateName,
      'certificate_points': certificatePoints,
      'certificate_type_id_fk': certificateTypeIdFk,
      'certificate_allocation_id_pk': certificateAllocationIdPk,
      'bucket_id_fk': bucketIdFk,
      'certificate_alloted_certificate_count':
          certificateAllotedCertificateCount,
      'certificate_distribution_count': certificateDistributionCount,
      'certificate_detail_id_pk': certificateDetailIdPk,
      'certificate_detail_title': certificateDetailTitle,
      'certificate_detail_subtitle': certificateDetailSubtitle,
      'certificate_detail_company_logo_url': certificateDetailCompanyLogoUrl,
      'certificate_detail_signature_url': certificateDetailSignatureUrl,
      'certificate_template_master_id_pk': certificateTemplateMasterIdPk,
      'certificate_template_name': certificateTemplateName,
    };
  }
}
