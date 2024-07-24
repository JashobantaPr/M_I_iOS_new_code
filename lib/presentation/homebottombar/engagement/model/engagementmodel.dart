class EngagementModel {
  final String menuIdPk;
  final String menuName;
  final String menuController;
  final String menuFunction;
  final String? activityCode; // Nullable
  final String parentId;
  final String type;
  final String sequence;
  final String groupType;
  final String access;
  final String? imgLink; // Nullable

  EngagementModel({
    required this.menuIdPk,
    required this.menuName,
    required this.menuController,
    required this.menuFunction,
    this.activityCode, // Nullable
    required this.parentId,
    required this.type,
    required this.sequence,
    required this.groupType,
    required this.access,
    this.imgLink, // Nullable,
  });

  factory EngagementModel.fromJson(Map<String, dynamic> json) {
    return EngagementModel(
      menuIdPk: json['menu_id_pk'] ?? '',
      menuName: json['menu_name'] ?? '',
      menuController: json['menu_controller'] ?? '',
      menuFunction: json['menu_function'] ?? '',
      activityCode: (json['activity_code'] as String?)?.isEmpty ?? true ? null : json['activity_code'],
      parentId: json['parent_id'] ?? '',
      type: json['type'] ?? '',
      sequence: json['sequence'] ?? '',
      groupType: json['group_type'] ?? '',
      access: json['access'] ?? '',
      imgLink: (json['img_link'] as String?)?.isEmpty ?? true ? null : json['img_link'],
    );
  }
}
