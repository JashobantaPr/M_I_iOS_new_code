class myProfileModel {
  String? menuIdPk;
  String? menuName;
  String? menuController;
  String? menuFunction;
  String? menuParentId;
  String? menuTypeId;
  String? active;
  String? sequence;
  String? groupType;

  myProfileModel(
      {this.menuIdPk,
      this.menuName,
      this.menuController,
      this.menuFunction,
      this.menuParentId,
      this.menuTypeId,
      this.active,
      this.sequence,
      this.groupType});

  myProfileModel.fromJson(Map<String, dynamic> json) {
    menuIdPk = json['menu_id_pk'];
    menuName = json['menu_name'];
    menuController = json['menu_controller'];
    menuFunction = json['menu_function'];
    menuParentId = json['menu_parent_id'];
    menuTypeId = json['menu_type_id'];
    active = json['active'];
    sequence = json['sequence'];
    groupType = json['group_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_id_pk'] = this.menuIdPk;
    data['menu_name'] = this.menuName;
    data['menu_controller'] = this.menuController;
    data['menu_function'] = this.menuFunction;
    data['menu_parent_id'] = this.menuParentId;
    data['menu_type_id'] = this.menuTypeId;
    data['active'] = this.active;
    data['sequence'] = this.sequence;
    data['group_type'] = this.groupType;
    return data;
  }
}
