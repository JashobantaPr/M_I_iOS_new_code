class WalletTypesResponse {
  bool status;
  List<WalletType> typeLists;

  WalletTypesResponse({
    required this.status,
    required this.typeLists,
  });

  factory WalletTypesResponse.fromJson(Map<String, dynamic> json) {
    return WalletTypesResponse(
      status: json['status'] ?? false,
      typeLists: json['type_lists'] != null
          ? (json['type_lists'] as List)
              .map((i) => WalletType.fromJson(i))
              .toList()
          : [],
    );
  }
}

class WalletType {
  String id;
  String typeName;
  String name;
  String walletPoints;
  String walletTypeId;

  WalletType({
    required this.id,
    required this.typeName,
    required this.name,
    required this.walletPoints,
    required this.walletTypeId,
  });

  factory WalletType.fromJson(Map<String, dynamic> json) {
    return WalletType(
      id: json['id'] ?? '',
      typeName: json['type_name'] ?? '',
      name: json['name'] ?? '',
      walletPoints: json['wallet_points'] ?? '',
      walletTypeId: json['wallet_type_id'] ?? '',
    );
  }
}
