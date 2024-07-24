class Transaction {
  String? transactionCode;
  String? tDesc;
  String? additionalInformation;
  String? recorddate;
  String? bucketCatCode;
  String? transactionTypeId;
  String? transactionHeaderIdPk;
  String? cmsUserIdTo;
  String? transactionType;
  String? transactionTypeCode;
  String? bucketCode;
  String? bucketId;
  String? points;
  String? debit;
  String? expired;
  String? description;
  String? productPoint;
  String? orderPoint;
  String? orderQty;
  String? productCode;
  String? givenBy;
  String? bucketType;
  String? userId;
  String? programId;
  String? programName;
  String? expiryDate;
  String? orderId;
  String? orderDescription;
  String? orderStatus;
  String? sponsorName;
  String? walletTypeName;
  String? campaignModeIdFk;
  String? membershipStatus;
  String? nodeIdFk;
  String? nodePath;
  String? awarderEmail;
  String? approver1Email;
  String? approver2Email;
  String? approver3Email;

  Transaction(
      {this.transactionCode,
      this.tDesc,
      this.additionalInformation,
      this.recorddate,
      this.bucketCatCode,
      this.transactionTypeId,
      this.transactionHeaderIdPk,
      this.cmsUserIdTo,
      this.transactionType,
      this.transactionTypeCode,
      this.bucketCode,
      this.bucketId,
      this.points,
      this.debit,
      this.expired,
      this.description,
      this.productPoint,
      this.orderPoint,
      this.orderQty,
      this.productCode,
      this.givenBy,
      this.bucketType,
      this.userId,
      this.programId,
      this.programName,
      this.expiryDate,
      this.orderId,
      this.orderDescription,
      this.orderStatus,
      this.sponsorName,
      this.walletTypeName,
      this.campaignModeIdFk,
      this.membershipStatus,
      this.nodeIdFk,
      this.nodePath,
      this.awarderEmail,
      this.approver1Email,
      this.approver2Email,
      this.approver3Email});

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionCode = json['transaction_code'] as String?;
    tDesc = json['t_desc'] as String?;
    additionalInformation = json['additional_information'] as String?;
    recorddate = json['recorddate'] as String?;
    bucketCatCode = json['bucket_cat_code'] as String?;
    transactionTypeId = json['transaction_type_id'] as String?;
    transactionHeaderIdPk = json['transaction_header_id_pk'] as String?;
    cmsUserIdTo = json['cms_user_id_to'] as String?;
    transactionType = json['transaction_type'] as String?;
    transactionTypeCode = json['transaction_type_code'] as String?;
    bucketCode = json['bucket_code'] as String?;
    bucketId = json['bucket_id'] as String?;
    points = json['points'] as String?;
    debit = json['debit'] as String?;
    expired = json['expired'] as String?;
    description = json['description'] as String?;
    productPoint = json['product_point'] as String?;
    orderPoint = json['order_point'] as String?;
    orderQty = json['order_qty'] as String?;
    productCode = json['product_code'] as String?;
    givenBy = json['given_by'] as String?;
    bucketType = json['bucket_type'] as String?;
    userId = json['user_id'] as String?;
    programId = json['program_id'] as String?;
    programName = json['program_name'] as String?;
    expiryDate = json['expiry_date'] as String?;
    orderId = json['order_id'] as String?;
    orderDescription = json['order_description'] as String?;
    orderStatus = json['order_status'] as String?;
    sponsorName = json['sponsor_name'] as String?;
    walletTypeName = json['wallet_type_name'] as String?;
    campaignModeIdFk = json['campaign_mode_id_fk'] as String?;
    membershipStatus = json['membership_status'] as String?;
    nodeIdFk = json['node_id_fk'] as String?;
    nodePath = json['node_path'] as String?;
    awarderEmail = json['awarder_email'] as String?;
    approver1Email = json['approver1_email'] as String?;
    approver2Email = json['approver2_email'] as String?;
    approver3Email = json['approver3_email'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_code'] = transactionCode;
    data['t_desc'] = tDesc;
    data['additional_information'] = additionalInformation;
    data['recorddate'] = recorddate;
    data['bucket_cat_code'] = bucketCatCode;
    data['transaction_type_id'] = transactionTypeId;
    data['transaction_header_id_pk'] = transactionHeaderIdPk;
    data['cms_user_id_to'] = cmsUserIdTo;
    data['transaction_type'] = transactionType;
    data['transaction_type_code'] = transactionTypeCode;
    data['bucket_code'] = bucketCode;
    data['bucket_id'] = bucketId;
    data['points'] = points;
    data['debit'] = debit;
    data['expired'] = expired;
    data['description'] = description;
    data['product_point'] = productPoint;
    data['order_point'] = orderPoint;
    data['order_qty'] = orderQty;
    data['product_code'] = productCode;
    data['given_by'] = givenBy;
    data['bucket_type'] = bucketType;
    data['user_id'] = userId;
    data['program_id'] = programId;
    data['program_name'] = programName;
    data['expiry_date'] = expiryDate;
    data['order_id'] = orderId;
    data['order_description'] = orderDescription;
    data['order_status'] = orderStatus;
    data['sponsor_name'] = sponsorName;
    data['wallet_type_name'] = walletTypeName;
    data['campaign_mode_id_fk'] = campaignModeIdFk;
    data['membership_status'] = membershipStatus;
    data['node_id_fk'] = nodeIdFk;
    data['node_path'] = nodePath;
    data['awarder_email'] = awarderEmail;
    data['approver1_email'] = approver1Email;
    data['approver2_email'] = approver2Email;
    data['approver3_email'] = approver3Email;
    return data;
  }
}
