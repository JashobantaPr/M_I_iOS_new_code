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
  String? orderPlacedOn;
  String? orderId;
  String? rewardCode;
  String? rewardName;
  String? rewardCategory;
  String? orderQuantity;
  String? totalPointsValue;
  String? rewardValue;
  String? orderStatusValue;

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
    this.orderPlacedOn,
    this.orderId,
    this.rewardCode,
    this.rewardName,
    this.rewardCategory,
    this.orderQuantity,
    this.totalPointsValue,
    this.rewardValue,
    this.orderStatusValue,
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
      orderPlacedOn: json['order_placed_on'],
      orderId: json['order_id'],
      rewardCode: json['reward_code'],
      rewardName: json['reward_name'],
      rewardCategory: json['reward_category'],
      orderQuantity: json['order_quantity'],
      totalPointsValue: json['total_points_value'],
      rewardValue: json['reward_value'],
      orderStatusValue: json['order_status_value'],
    );
  }
}
