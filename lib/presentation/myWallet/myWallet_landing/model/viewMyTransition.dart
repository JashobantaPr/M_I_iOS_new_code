class ViewAllTransition {
  String transactionId;
  String transactionCode;
  String bucketCode;
  String recorddate;
  String catDescription;
  String bucketDescription;
  String fromUsername;
  String toUsername;
  int credit;
  int debit;
  int expired;
  String expiryDate;

  ViewAllTransition({
    required this.transactionId,
    required this.transactionCode,
    required this.bucketCode,
    required this.recorddate,
    required this.catDescription,
    required this.bucketDescription,
    required this.fromUsername,
    required this.toUsername,
    required this.credit,
    required this.debit,
    required this.expired,
    required this.expiryDate,
  });

  factory ViewAllTransition.fromJson(Map<String, dynamic> json) {
    return ViewAllTransition(
      transactionId: json['transaction_id'],
      transactionCode: json['transaction_code'],
      bucketCode: json['bucket_code'],
      recorddate: json['recorddate'],
      catDescription: json['cat_description'],
      bucketDescription: json['bucket_description'],
      fromUsername: json['from_username'],
      toUsername: json['to_username'],
      credit: json['credit'],
      debit: json['debit'],
      expired: json['expired'],
      expiryDate: json['expiry_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'transaction_code': transactionCode,
      'bucket_code': bucketCode,
      'recorddate': recorddate,
      'cat_description': catDescription,
      'bucket_description': bucketDescription,
      'from_username': fromUsername,
      'to_username': toUsername,
      'credit': credit,
      'debit': debit,
      'expired': expired,
      'expiry_date': expiryDate,
    };
  }
}
