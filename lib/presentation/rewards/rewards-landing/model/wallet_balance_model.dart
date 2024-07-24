class GetBudgetBalance {
  final List<BudgetSum> totalMyBudgetAllocated;
  final List<BudgetSum> totalMyBudgetDistributed;
  final List<BudgetSum> totalMyBudgetExpired;
  final int buval;
  final int walval;

  GetBudgetBalance({
    required this.totalMyBudgetAllocated,
    required this.totalMyBudgetDistributed,
    required this.totalMyBudgetExpired,
    required this.buval,
    required this.walval,
  });

  factory GetBudgetBalance.fromJson(Map<String, dynamic> json) {
    return GetBudgetBalance(
      totalMyBudgetAllocated: json['total_mybudget_allocated'] != null
          ? List<BudgetSum>.from(json['total_mybudget_allocated']
              .map((x) => BudgetSum.fromJson(x)))
          : [],
      totalMyBudgetDistributed: json['total_mybudget_distributed'] != null
          ? List<BudgetSum>.from(json['total_mybudget_distributed']
              .map((x) => BudgetSum.fromJson(x)))
          : [],
      totalMyBudgetExpired: json['total_mybudget_expired'] != null
          ? List<BudgetSum>.from(
              json['total_mybudget_expired'].map((x) => BudgetSum.fromJson(x)))
          : [],
      buval: json['buval'] ?? 0,
      walval: json['walval'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_mybudget_allocated':
          List<dynamic>.from(totalMyBudgetAllocated.map((x) => x.toJson())),
      'total_mybudget_distributed':
          List<dynamic>.from(totalMyBudgetDistributed.map((x) => x.toJson())),
      'total_mybudget_expired':
          List<dynamic>.from(totalMyBudgetExpired.map((x) => x.toJson())),
      'buval': buval,
      'walval': walval,
    };
  }
}

class BudgetSum {
  final String? sum;

  BudgetSum({this.sum});

  factory BudgetSum.fromJson(Map<String, dynamic> json) {
    return BudgetSum(
      sum: json['sum'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sum': sum,
    };
  }
}
