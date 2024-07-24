class BudgetResponse {
  final String status;
  final Data data;

  BudgetResponse({required this.status, required this.data});

  factory BudgetResponse.fromJson(Map<String, dynamic> json) {
    return BudgetResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String comid;
  final String userId;
  final String from;
  final String to;
  final String financialFrom;
  final String financialTo;
  final String type;
  final List<BudgetItem> totalMybudgetAllocated;
  final List<BudgetItem> totalMybudgetDistributed;
  final List<BudgetItem> totalMybudgetExpired;
  final int totalMybudgetBalance;

  Data({
    required this.comid,
    required this.userId,
    required this.from,
    required this.to,
    required this.financialFrom,
    required this.financialTo,
    required this.type,
    required this.totalMybudgetAllocated,
    required this.totalMybudgetDistributed,
    required this.totalMybudgetExpired,
    required this.totalMybudgetBalance,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      comid: json['comid'],
      userId: json['user_id'],
      from: json['from'],
      to: json['to'],
      financialFrom: json['financial_from'],
      financialTo: json['financial_to'],
      type: json['type'],
      totalMybudgetAllocated: (json['total_mybudget_allocated'] as List)
          .map((i) => BudgetItem.fromJson(i))
          .toList(),
      totalMybudgetDistributed: (json['total_mybudget_distributed'] as List)
          .map((i) => BudgetItem.fromJson(i))
          .toList(),
      totalMybudgetExpired: (json['total_mybudget_expired'] as List)
          .map((i) => BudgetItem.fromJson(i))
          .toList(),
      totalMybudgetBalance: json['total_mybudget_balance'],
    );
  }
}

class BudgetItem {
  final String sum;

  BudgetItem({required this.sum});

  factory BudgetItem.fromJson(Map<String, dynamic> json) {
    return BudgetItem(
      sum: json['sum'],
    );
  }
}
