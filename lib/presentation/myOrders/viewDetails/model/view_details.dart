class ViewDetails {
  List<Product>? product;
  List<WalletBalance>? walletBalance;
  String? otpMode;
  String? showRewardWorth;
  String? displayProcessingFee;
  String? emailFlag;
  String? smsFlag;
  bool? status;

  ViewDetails(
      {this.product,
      this.walletBalance,
      this.otpMode,
      this.showRewardWorth,
      this.displayProcessingFee,
      this.emailFlag,
      this.smsFlag,
      this.status});

  ViewDetails.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    if (json['wallet_balance'] != null) {
      walletBalance = <WalletBalance>[];
      json['wallet_balance'].forEach((v) {
        walletBalance!.add(new WalletBalance.fromJson(v));
      });
    }
    otpMode = json['otp_mode'];
    showRewardWorth = json['show_reward_worth'];
    displayProcessingFee = json['display_processing_fee'];
    emailFlag = json['email_flag'];
    smsFlag = json['sms_flag'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.walletBalance != null) {
      data['wallet_balance'] =
          this.walletBalance!.map((v) => v.toJson()).toList();
    }
    data['otp_mode'] = this.otpMode;
    data['show_reward_worth'] = this.showRewardWorth;
    data['display_processing_fee'] = this.displayProcessingFee;
    data['email_flag'] = this.emailFlag;
    data['sms_flag'] = this.smsFlag;
    data['status'] = this.status;
    return data;
  }
}

class Product {
  String? frCode;
  String? name;
  String? productCode;
  String? largeDescription;
  String? smallImageLink;
  String? largeImageLink;
  String? points;
  String? productType;
  String? sitePrice;
  String? baseCurrency;
  String? comments;
  String? productDeliveryMode;

  Product(
      {this.frCode,
      this.name,
      this.productCode,
      this.largeDescription,
      this.smallImageLink,
      this.largeImageLink,
      this.points,
      this.productType,
      this.sitePrice,
      this.baseCurrency,
      this.comments,
      this.productDeliveryMode});

  Product.fromJson(Map<String, dynamic> json) {
    frCode = json['fr_code'];
    name = json['name'];
    productCode = json['product_code'];
    largeDescription = json['large_description'];
    smallImageLink = json['small_image_link'];
    largeImageLink = json['large_image_link'];
    points = json['points'];
    productType = json['product_type'];
    sitePrice = json['site_price'];
    baseCurrency = json['base_currency'];
    comments = json['comments'];
    productDeliveryMode = json['product_delivery_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fr_code'] = this.frCode;
    data['name'] = this.name;
    data['product_code'] = this.productCode;
    data['large_description'] = this.largeDescription;
    data['small_image_link'] = this.smallImageLink;
    data['large_image_link'] = this.largeImageLink;
    data['points'] = this.points;
    data['product_type'] = this.productType;
    data['site_price'] = this.sitePrice;
    data['base_currency'] = this.baseCurrency;
    data['comments'] = this.comments;
    data['product_delivery_mode'] = this.productDeliveryMode;
    return data;
  }
}

class WalletBalance {
  String? sum;

  WalletBalance({this.sum});

  WalletBalance.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sum'] = this.sum;
    return data;
  }
}
