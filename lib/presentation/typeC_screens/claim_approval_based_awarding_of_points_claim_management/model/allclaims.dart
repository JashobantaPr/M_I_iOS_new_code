class Claim {
  final String claimId;
  final String claimCode;
  final String cmsUserId;
  final String invoiceId;
  final String createDate;
  final String? skuCode;
  final String? skuDesc;
  final String? quantity;
  final String totalPoints;
  final String statusId;
  final String statusName;
  final String claimType;

  Claim({
    required this.claimId,
    required this.claimCode,
    required this.cmsUserId,
    required this.invoiceId,
    required this.createDate,
    this.skuCode,
    this.skuDesc,
    this.quantity,
    required this.totalPoints,
    required this.statusId,
    required this.statusName,
    required this.claimType,
  });

  factory Claim.fromJson(Map<String, dynamic> json) {
    return Claim(
      claimId: json['claim_id'],
      claimCode: json['claim_code'],
      cmsUserId: json['cms_user_id'],
      invoiceId: json['invoice_id'],
      createDate: json['create_date'],
      skuCode: json['sku_code'],
      skuDesc: json['sku_desc'],
      quantity: json['quantity'],
      totalPoints: json['total_points'],
      statusId: json['status_id'],
      statusName: json['status_name'],
      claimType: json['claim_type'],
    );
  }
}
