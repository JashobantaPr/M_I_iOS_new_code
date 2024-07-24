class getWalletModel {
  bool? status;
  List<TypeLists>? typeLists;

  getWalletModel({this.status, this.typeLists});

  getWalletModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['type_lists'] != null) {
      typeLists = <TypeLists>[];
      json['type_lists'].forEach((v) {
        typeLists!.add(new TypeLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.typeLists != null) {
      data['type_lists'] = this.typeLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TypeLists {
  String? id;
  String? typeName;
  String? name;
  String? walletPoints;
  String? walletTypeId;

  TypeLists(
      {this.id,
      this.typeName,
      this.name,
      this.walletPoints,
      this.walletTypeId});

  TypeLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    name = json['name'];
    walletPoints = json['wallet_points'];
    walletTypeId = json['wallet_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_name'] = this.typeName;
    data['name'] = this.name;
    data['wallet_points'] = this.walletPoints;
    data['wallet_type_id'] = this.walletTypeId;
    return data;
  }
}
