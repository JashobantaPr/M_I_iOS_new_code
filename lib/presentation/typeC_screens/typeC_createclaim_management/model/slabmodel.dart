class SlabPoint {
  final String incentiveType;
  final String range;
  final String percentage;
  final String points;

  SlabPoint({
    required this.incentiveType,
    required this.range,
    required this.percentage,
    required this.points,
  });

  factory SlabPoint.fromJson(Map<String, dynamic> json) {
    return SlabPoint(
      incentiveType: json['incentive_type'] ?? '',
      range: json['range'] ?? '',
      percentage: json['percentage'] ?? '',
      points: json['points'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'incentive_type': incentiveType,
      'range': range,
      'percentage': percentage,
      'points': points,
    };
  }
}
