class cuntryPickerModel {
  String? countryIdPk;
  String? name;
  String? active;
  String? phonecode;
  String? deleted;
  String? smsStatus;
  String? iso;

  cuntryPickerModel(
      {this.countryIdPk,
      this.name,
      this.active,
      this.phonecode,
      this.deleted,
      this.smsStatus,
      this.iso});

  cuntryPickerModel.fromJson(Map<String, dynamic> json) {
    countryIdPk = json['country_id_pk'];
    name = json['name'];
    active = json['active'];
    phonecode = json['phonecode'];
    deleted = json['deleted'];
    smsStatus = json['sms_status'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id_pk'] = this.countryIdPk;
    data['name'] = this.name;
    data['active'] = this.active;
    data['phonecode'] = this.phonecode;
    data['deleted'] = this.deleted;
    data['sms_status'] = this.smsStatus;
    data['iso'] = this.iso;
    return data;
  }
}
