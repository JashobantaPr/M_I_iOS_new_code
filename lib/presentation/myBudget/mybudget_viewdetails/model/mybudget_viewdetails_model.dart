class ViewDetailsModel {
  String? name;
  String? transactionCode;
  String? fromUserFirstname;
  String? fromUserLastname;
  String? transactionDate;
  String? transactionPoints;
  String? transactionDescription;
  String? transactionTypeCode;

  ViewDetailsModel({
    this.name,
    this.transactionCode,
    this.fromUserFirstname,
    this.fromUserLastname,
    this.transactionDate,
    this.transactionPoints,
    this.transactionDescription,
    this.transactionTypeCode,
  });

  factory ViewDetailsModel.fromJson(Map<String, dynamic> json) {
    return ViewDetailsModel(
      name: json['name'],
      transactionCode: json['transaction_code'],
      fromUserFirstname: json['from_user_firstname'],
      fromUserLastname: json['from_user_lastname'],
      transactionDate: json['tdate'],
      transactionPoints: json['tpoint'],
      transactionDescription: json['tdescription'],
      transactionTypeCode: json['transaction_type_code'],
    );
  }
}
