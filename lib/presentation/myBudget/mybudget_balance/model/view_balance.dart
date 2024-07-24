class mybalancemodel {
  String? status;
  Data? data;

  mybalancemodel({this.status, this.data});

  mybalancemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? comid;
  String? userId;
  String? from;
  String? to;
  String? financialFrom;
  String? financialTo;
  String? type;
  List<TotalMybudgetAllocated>? totalMybudgetAllocated;
  List<TotalMybudgetDistributed>? totalMybudgetDistributed;
  List<TotalMybudgetExpired>? totalMybudgetExpired;
  int? totalMybudgetBalance;

  Data(
      {this.comid,
      this.userId,
      this.from,
      this.to,
      this.financialFrom,
      this.financialTo,
      this.type,
      this.totalMybudgetAllocated,
      this.totalMybudgetDistributed,
      this.totalMybudgetExpired,
      this.totalMybudgetBalance});

  Data.fromJson(Map<String, dynamic> json) {
    comid = json['comid'];
    userId = json['user_id'];
    from = json['from'];
    to = json['to'];
    financialFrom = json['financial_from'];
    financialTo = json['financial_to'];
    type = json['type'];
    if (json['total_mybudget_allocated'] != null) {
      totalMybudgetAllocated = <TotalMybudgetAllocated>[];
      json['total_mybudget_allocated'].forEach((v) {
        totalMybudgetAllocated!.add(new TotalMybudgetAllocated.fromJson(v));
      });
    }
    if (json['total_mybudget_distributed'] != null) {
      totalMybudgetDistributed = <TotalMybudgetDistributed>[];
      json['total_mybudget_distributed'].forEach((v) {
        totalMybudgetDistributed!.add(new TotalMybudgetDistributed.fromJson(v));
      });
    }
    if (json['total_mybudget_expired'] != null) {
      totalMybudgetExpired = <TotalMybudgetExpired>[];
      json['total_mybudget_expired'].forEach((v) {
        totalMybudgetExpired!.add(new TotalMybudgetExpired.fromJson(v));
      });
    }
    totalMybudgetBalance = json['total_mybudget_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comid'] = this.comid;
    data['user_id'] = this.userId;
    data['from'] = this.from;
    data['to'] = this.to;
    data['financial_from'] = this.financialFrom;
    data['financial_to'] = this.financialTo;
    data['type'] = this.type;
    if (this.totalMybudgetAllocated != null) {
      data['total_mybudget_allocated'] =
          this.totalMybudgetAllocated!.map((v) => v.toJson()).toList();
    }
    if (this.totalMybudgetDistributed != null) {
      data['total_mybudget_distributed'] =
          this.totalMybudgetDistributed!.map((v) => v.toJson()).toList();
    }
    if (this.totalMybudgetExpired != null) {
      data['total_mybudget_expired'] =
          this.totalMybudgetExpired!.map((v) => v.toJson()).toList();
    }
    data['total_mybudget_balance'] = this.totalMybudgetBalance;
    return data;
  }
}

class TotalMybudgetAllocated {
  String? sum;

  TotalMybudgetAllocated({this.sum});

  TotalMybudgetAllocated.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sum'] = this.sum;
    return data;
  }
}

class TotalMybudgetDistributed {
  String? sum;

  TotalMybudgetDistributed({this.sum});

  TotalMybudgetDistributed.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sum'] = this.sum;
    return data;
  }
}

class TotalMybudgetExpired {
  String? sum;

  TotalMybudgetExpired({this.sum});

  TotalMybudgetExpired.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sum'] = this.sum;
    return data;
  }
}
