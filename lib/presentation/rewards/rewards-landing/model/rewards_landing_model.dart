class RewardsProduct {
  String? baseCurrency;
  double? sitePrice;
  int? productIdPk;
  String? name;
  String? productCode;
  String? smallImageLink;
  String? largeImageLink;
  String? outletLink;
  int? sortOrder;
  int? shippingDays;
  int? shippingCharges;
  int? productVisible;
  int? activeStatus;
  String? productType;
  String? category;
  String? walletTypes;
  int? newPoints;

  RewardsProduct({
    this.baseCurrency,
    this.sitePrice,
    this.productIdPk,
    this.name,
    this.productCode,
    this.smallImageLink,
    this.largeImageLink,
    this.outletLink,
    this.sortOrder,
    this.shippingDays,
    this.shippingCharges,
    this.productVisible,
    this.activeStatus,
    this.productType,
    this.category,
    this.walletTypes,
    this.newPoints,
  });

  factory RewardsProduct.fromJson(Map<String, dynamic> json) {
    return RewardsProduct(
      baseCurrency: json['base_currency'],
      sitePrice: json['site_price'] != null
          ? double.parse(json['site_price'].toString())
          : null,
      productIdPk: json['product_id_pk'],
      name: json['name'],
      productCode: json['product_code'],
      smallImageLink: json['small_image_link'],
      largeImageLink: json['large_image_link'],
      outletLink: json['outlet_link'],
      sortOrder: json['sort_order'],
      shippingDays: json['shipping_days'],
      shippingCharges: json['shipping_charges'],
      productVisible: json['product_visible'],
      activeStatus: json['active_status'],
      productType: json['product_type'],
      category: json['p_category_name'],
      walletTypes: json['wallet_types'],
      newPoints: json['new_points'],
    );
  }
}
