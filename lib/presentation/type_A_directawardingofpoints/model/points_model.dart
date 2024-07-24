class Pointscounts {
  String? earnedpoints;
  String? redempoints;
  String? expirepoints;
  String? oredempoints;

  Pointscounts(
      {this.earnedpoints,
      this.redempoints,
      this.expirepoints,
      this.oredempoints});

  Pointscounts.fromJson(Map<String, dynamic> json) {
    earnedpoints = json['earnedpoints'];
    redempoints = json['redempoints'];
    expirepoints = json['expirepoints'];
    oredempoints = json['oredempoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['earnedpoints'] = earnedpoints;
    data['redempoints'] = redempoints;
    data['expirepoints'] = expirepoints;
    data['oredempoints'] = oredempoints;
    return data;
  }

  int get balancePoints {
    int earned = int.tryParse(earnedpoints ?? '0') ?? 0;
    int redeemed = int.tryParse(redempoints ?? '0') ?? 0;
    int expired = int.tryParse(expirepoints ?? '0') ?? 0;
    return earned - (redeemed + expired);
  }
}
