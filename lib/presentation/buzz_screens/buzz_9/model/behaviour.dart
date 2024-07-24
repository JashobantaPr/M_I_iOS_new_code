class Behavior {
  final String behaviorId;
  final String code;
  final String companyId;
  final String name;
  final String description;
  final String icon;
  final String active;
  final String recordDate;

  Behavior({
    required this.behaviorId,
    required this.code,
    required this.companyId,
    required this.name,
    required this.description,
    required this.icon,
    required this.active,
    required this.recordDate,
  });

  factory Behavior.fromJson(Map<String, dynamic> json) {
    return Behavior(
      behaviorId: json['behaviour_id_pk'],
      code: json['code'],
      companyId: json['cms_company_id_fk'],
      name: json['name'],
      description: json['description'],
      icon: json['icon'],
      active: json['active'],
      recordDate: json['recorddate'],
    );
  }
}
