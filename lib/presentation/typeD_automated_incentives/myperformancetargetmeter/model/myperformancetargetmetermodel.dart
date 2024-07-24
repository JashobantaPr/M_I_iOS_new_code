class KPI {
  final String id;
  final String cmsUserId;
  final int employeeId;
  final double totalRevenue;
  final double kpiPercentage;
  final int kpiRank;
  final bool showRank;
  final String kpiName;
  final bool showPercentage;
  final String kpiUnit;
  final int numOfDecimals;
  final double kpiTargetValue;
  final double kpiAchievementValue;

  KPI({
    required this.id,
    required this.cmsUserId,
    required this.employeeId,
    required this.totalRevenue,
    required this.kpiPercentage,
    required this.kpiRank,
    required this.showRank,
    required this.kpiName,
    required this.showPercentage,
    required this.kpiUnit,
    required this.numOfDecimals,
    required this.kpiTargetValue,
    required this.kpiAchievementValue,
  });

  factory KPI.fromJson(Map<String, dynamic> json) {
    return KPI(
      id: json['_id'] ?? '',
      cmsUserId: json['sys_80_pid000102_cms_user_id']?.toString() ?? '',
      employeeId: json['sys_80_employee_id_1'] ?? 0,
      totalRevenue: json['sys_80_total_revenue_1'] != null
          ? double.tryParse(json['sys_80_total_revenue_1'].toString()) ?? 0.0
          : 0.0,
      kpiPercentage: json['kpipercentage'] != null
          ? double.tryParse(json['kpipercentage'].toString()) ?? 0.0
          : 0.0,
      kpiRank: json['kpiRank'] ?? 0,
      showRank: json['show_rank'] == 1,
      kpiName: json['kpi_name'] ?? '',
      showPercentage: json['show_percentage'] == 1,
      kpiUnit: json['kpi_unit'] ?? '',
      numOfDecimals: json['num_of_decimals'] != null
          ? int.tryParse(json['num_of_decimals'].toString()) ?? 0
          : 0,
      kpiTargetValue: json['kpi_target_value'] != null
          ? double.tryParse(json['kpi_target_value'].toString()) ?? 0.0
          : 0.0,
      kpiAchievementValue: json['kpi_achievement_value'] != null
          ? double.tryParse(json['kpi_achievement_value'].toString()) ?? 0.0
          : 0.0,
    );
  }
}
