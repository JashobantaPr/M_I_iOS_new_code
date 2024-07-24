class ViewDetailsModel {
  String? transactionType;
  String? transactionDate;
  String? transactionCode;
  String? to;
  String? from;
  String? points;
  String? expiryDate;
  String? category;
  String? campaignName;
  String? description;
  String? additionalInformation;

  ViewDetailsModel({
    this.transactionType,
    this.transactionDate,
    this.transactionCode,
    this.to,
    this.from,
    this.points,
    this.expiryDate,
    this.category,
    this.campaignName,
    this.description,
    this.additionalInformation,
  });

  factory ViewDetailsModel.fromJson(Map<String, dynamic> json) {
    return ViewDetailsModel(
      transactionType: json['transaction_type'],
      transactionDate: json['transaction_date'],
      transactionCode: json['transaction_code'],
      to: json['to'],
      from: json['from'],
      points: json['points'],
      expiryDate: json['expiry_date'],
      category: json['category'],
      campaignName: json['campaign_name'],
      description: json['description'],
      additionalInformation: json['additional_information'],
    );
  }
}
