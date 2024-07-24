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
    transactionCode = json['transaction_code'];
    tDesc = json['t_desc'];
    additionalInformation = json['additional_information'];
    recorddate = json['recorddate'];
    bucketCatCode = json['bucket_cat_code'];
    transactionTypeId = json['transaction_type_id'];
    transactionHeaderIdPk = json['transaction_header_id_pk'];
    cmsUserIdTo = json['cms_user_id_to'];
    transactionType = json['transaction_type'];
    transactionTypeCode = json['transaction_type_code'];
    bucketCode = json['bucket_code'];
    bucketId = json['bucket_id'];
    points = json['points'];
    debit = json['debit'];
    expired = json['expired'];
    description = json['description'];
    productPoint = json['product_point'];
    orderPoint = json['order_point'];
    orderQty = json['order_qty'];
    productCode = json['product_code'];
    givenBy = json['given_by'];
    bucketType = json['bucket_type'];
    userId = json['user_id'];
    programId = json['program_id'];
    programName = json['program_name'];
    expiryDate = json['expiry_date'];
    orderId = json['order_id'];
    orderDescription = json['order_description'];
    orderStatus = json['order_status'];
    sponsorName = json['sponsor_name'];
    walletTypeName = json['wallet_type_name'];
    campaignModeIdFk = json['campaign_mode_id_fk'];
    membershipStatus = json['membership_status'];
    nodeIdFk = json['node_id_fk'];
    nodePath = json['node_path'];
    awarderEmail = json['awarder_email'];
    approver1Email = json['approver1_email'];
    approver2Email = json['approver2_email'];
    approver3Email = json['approver3_email'];
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
