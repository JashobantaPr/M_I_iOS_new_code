class TypeBCampaignDetails {
  String? status;
  List<Data>? data;

  TypeBCampaignDetails({this.status, this.data});

  TypeBCampaignDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? earnedpoints;
  String? redempoints;
  String? expirepoints;
  String? oredempoints;

  Data({this.earnedpoints, this.redempoints, this.expirepoints, this.oredempoints, required Map users, required List userIds, required List programDetails, required List programOwners, required List programCoOwners, required Map allRank});

  Data.fromJson(Map<String, dynamic> json) {
    earnedpoints = json['earnedpoints'];
    redempoints = json['redempoints'];
    expirepoints = json['expirepoints'];
    oredempoints = json['oredempoints'];
  }

  get programDetails => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['earnedpoints'] = earnedpoints;
    data['redempoints'] = redempoints;
    data['expirepoints'] = expirepoints;
    data['oredempoints'] = oredempoints;
    return data;
  }
}






