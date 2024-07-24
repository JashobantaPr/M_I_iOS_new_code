class ViewAllTransition {
  String transactionId;
  String transactionCode;
  String transactionTypeCode;
  String bucketCode;
  String recorddate;
  String description;
  String fromUsername;
  String toUsername;
  int credit;
  int debit;
  int expired;
  String expiryStatus;
  String? postDeleted; // Nullable field
  String expiryDate;
  String additionalInformation;

  ViewAllTransition({
    required this.transactionId,
    required this.transactionCode,
    required this.transactionTypeCode,
    required this.bucketCode,
    required this.recorddate,
    required this.description,
    required this.fromUsername,
    required this.toUsername,
    required this.credit,
    required this.debit,
    required this.expired,
    required this.expiryStatus,
    this.postDeleted,
    required this.expiryDate,
    required this.additionalInformation,
  });

  factory ViewAllTransition.fromJson(Map<String, dynamic> json) {
    return ViewAllTransition(
      transactionId: json['transaction_id'] ?? '',
      transactionCode: json['transaction_code'] ?? '',
      transactionTypeCode: json['transaction_type_code'] ?? '',
      bucketCode: json['bucket_code'] ?? '',
      recorddate: json['recorddate'] ?? '',
      description: json['description'] ?? '',
      fromUsername: json['from_username'] ?? '',
      toUsername: json['to_username'] ?? '',
      credit: json['credit'] ?? 0,
      debit: json['debit'] ?? 0,
      expired: json['expired'] ?? 0,
      expiryStatus: json['expiry_status'] ?? '',
      postDeleted: json['post_deleted'],
      expiryDate: json['expiry_date'] ?? '',
      additionalInformation: json['additional_information'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'transaction_code': transactionCode,
      'transaction_type_code': transactionTypeCode,
      'bucket_code': bucketCode,
      'recorddate': recorddate,
      'description': description,
      'from_username': fromUsername,
      'to_username': toUsername,
      'credit': credit,
      'debit': debit,
      'expired': expired,
      'expiry_status': expiryStatus,
      'post_deleted': postDeleted,
      'expiry_date': expiryDate,
      'additional_information': additionalInformation,
    };
  }
}
