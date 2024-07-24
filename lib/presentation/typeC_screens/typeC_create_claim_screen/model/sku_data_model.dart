class SkuData {
  final String nodeId;
  final String code;
  final String description;
  final String parentNode;
  final String status;
  final String skuSize;
  final String skuWeight;
  final String skuVolume;
  final String skuCost;
  final String skuPrice;
  final String skuSizeUnit;
  final String skuWeightUnit;
  final String skuVolumeUnit;
  final bool skuCodePresent;
  final bool skuDescPresent;
  final bool skuWeightPresent;
  final bool skuVolumePresent;
  final bool skuSizePresent;
  final bool skuCostPresent;
  final bool skuPricePresent;

  SkuData({
    required this.nodeId,
    required this.code,
    required this.description,
    required this.parentNode,
    required this.status,
    required this.skuSize,
    required this.skuWeight,
    required this.skuVolume,
    required this.skuCost,
    required this.skuPrice,
    required this.skuSizeUnit,
    required this.skuWeightUnit,
    required this.skuVolumeUnit,
    required this.skuCodePresent,
    required this.skuDescPresent,
    required this.skuWeightPresent,
    required this.skuVolumePresent,
    required this.skuSizePresent,
    required this.skuCostPresent,
    required this.skuPricePresent,
  });

  factory SkuData.fromJson(Map<String, dynamic> json) {
    return SkuData(
      nodeId: json['node_id'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      parentNode: json['parentnode'] as String,
      status: json['status'] as String,
      skuSize: json['sku_size'] as String,
      skuWeight: json['sku_weight'] as String,
      skuVolume: json['sku_volume'] as String,
      skuCost: json['sku_cost'] as String,
      skuPrice: json['sku_price'] as String,
      skuSizeUnit: json['sku_size_unit'] as String,
      skuWeightUnit: json['sku_weight_unit'] as String,
      skuVolumeUnit: json['sku_volume_unit'] as String,
      skuCodePresent: json['sku_code_present'] == 'yes',
      skuDescPresent: json['sku_desc_present'] == 'yes',
      skuWeightPresent: json['sku_weight_present'] == 'yes',
      skuVolumePresent: json['sku_volume_present'] == 'yes',
      skuSizePresent: json['sku_size_present'] == 'yes',
      skuCostPresent: json['sku_cost_present'] == 'yes',
      skuPricePresent: json['sku_price_present'] == 'yes',
    );
  }
}

class ApiResponse {
  final String status;
  final List<SkuData> data;
  final String totalData;
  final String totalFilter;

  ApiResponse({
    required this.status,
    required this.data,
    required this.totalData,
    required this.totalFilter,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((item) => SkuData.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalData: json['totaldata'] as String,
      totalFilter: json['totalFilter'] as String,
    );
  }
}
