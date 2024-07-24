class TierDataResponse {
  final List<TierType> tierType;
  final List<Tier> tiers;
  final List<AuditTrail> auditTrail;
  final List<NextTier> nextTier;
  final List<TiersTarget> tiersTarget;

  TierDataResponse({
    required this.tierType,
    required this.tiers,
    required this.auditTrail,
    required this.nextTier,
    required this.tiersTarget,
  });

  factory TierDataResponse.fromJson(Map<String, dynamic> json) {
    return TierDataResponse(
      tierType: (json['tier_type'] as List)
          .map((item) => TierType.fromJson(item))
          .toList(),
      tiers:
          (json['tiers'] as List).map((item) => Tier.fromJson(item)).toList(),
      auditTrail: (json['audit_trail'] as List)
          .map((item) => AuditTrail.fromJson(item))
          .toList(),
      nextTier: (json['next_tier'] as List)
          .map((item) => NextTier.fromJson(item))
          .toList(),
      // tiersTarget: (json['tiers_target'] as List)
      //     .map((item) => TiersTarget.fromJson(item))
      //     .toList(),
      tiersTarget: json['tiers_target'] is List
          ? (json['tiers_target'] as List)
              .map((item) => TiersTarget.fromJson(item))
              .toList()
          : [],
    );
  }
}

class TierType {
  final String segment;
  final String tierBackgroundColor;
  final String tierCode;
  final String tierName;
  final String tierDescription;
  final String tierLogoName;
  final String tierOrder;
  final String tierSchemaNname;

  TierType({
    required this.segment,
    required this.tierBackgroundColor,
    required this.tierCode,
    required this.tierName,
    required this.tierDescription,
    required this.tierLogoName,
    required this.tierOrder,
    required this.tierSchemaNname,
  });

  factory TierType.fromJson(Map<String, dynamic> json) {
    return TierType(
      segment: json['segment'] ?? "",
      tierBackgroundColor: json['tier_background_color'] ?? "",
      tierCode: json['tier_code'] ?? "",
      tierName: json['tier_name'] ?? "",
      tierDescription: json['tier_description'] ?? "",
      tierLogoName: json['tier_logo_name'] ?? "",
      tierOrder: json['tier_order'] ?? "",
      tierSchemaNname: json['temp_table_schema_name'] ?? "",
    );
  }
}

class Tier {
  final String tierName;
  final String tierDescription;
  final String tierBackgroundColor;
  final String tierLogoName;

  Tier({
    required this.tierName,
    required this.tierDescription,
    required this.tierBackgroundColor,
    required this.tierLogoName,
  });

  factory Tier.fromJson(Map<String, dynamic> json) {
    return Tier(
      tierName: json['tier_name'],
      tierDescription: json['tier_description'],
      tierBackgroundColor: json['tier_background_color'],
      tierLogoName: json['tier_logo_name'],
    );
  }
}

class AuditTrail {
  final String userId;
  final String tierUpdateDate;
  final String recordDate;
  final String tierIdFk;
  final String tierName;
  final String tierCode;
  final String tierDescription;

  AuditTrail({
    required this.userId,
    required this.tierUpdateDate,
    required this.recordDate,
    required this.tierIdFk,
    required this.tierName,
    required this.tierCode,
    required this.tierDescription,
  });

  factory AuditTrail.fromJson(Map<String, dynamic> json) {
    return AuditTrail(
      userId: json['user_id'],
      tierUpdateDate: json['tier_update_date'],
      recordDate: json['record_date'],
      tierIdFk: json['tier_id_fk'],
      tierName: json['tier_name'],
      tierCode: json['tier_code'],
      tierDescription: json['tier_description'],
    );
  }
}

class NextTier {
  final String tierOrder;

  NextTier({
    required this.tierOrder,
  });

  factory NextTier.fromJson(Map<String, dynamic> json) {
    return NextTier(
      tierOrder: json['tier_order'],
    );
  }
}

class TiersTarget {
  final double percentage;
  final String tierKpisCode;
  final int target;
  final double achieved;
  final String kpiName;
  final String lastCalculated;
  final String nextTierName;

  TiersTarget({
    required this.percentage,
    required this.tierKpisCode,
    required this.target,
    required this.achieved,
    required this.kpiName,
    required this.lastCalculated,
    required this.nextTierName,
  });

  factory TiersTarget.fromJson(Map<String, dynamic> json) {
    return TiersTarget(
      percentage: (json['percentage'] is int)
          ? (json['percentage'] as int).toDouble()
          : json['percentage'] ?? 0.0,
      tierKpisCode: json['tier_kpis_code'],
      target: json['target'] ?? 0,
      achieved: (json['achieved'] is int)
          ? (json['achieved'] as int).toDouble()
          : json['achieved'] ?? 0.0,
      kpiName: json['kpi_name'],
      lastCalculated: json['last_calculated'],
      nextTierName: json['next_tier_name'],
    );
  }
}
