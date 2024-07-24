class viewmywallet {
  String? status;
  Data? data;

  viewmywallet({this.status, this.data});

  factory viewmywallet.fromJson(Map<String, dynamic> json) {
    return viewmywallet(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? comid;
  String? debitWalletUrl;
  String? type;
  List<TotalMywalletDistributed>? totalMywalletDistributed;
  List<TotalMywalletReedemed>? totalMywalletReedemed;
  List<TotalMybudgetExpired>? totalMybudgetExpired;
  TotalMywalletDistributed? totalMywalletBalance;
  TotalReceviedOrderPoint? totalReceviedOrderPoint;
  String? from;
  String? to;
  String? financialFrom;
  String? financialTo;

  Data({
    this.comid,
    this.debitWalletUrl,
    this.type,
    this.totalMywalletDistributed,
    this.totalMywalletReedemed,
    this.totalMybudgetExpired,
    this.totalMywalletBalance,
    this.totalReceviedOrderPoint,
    this.from,
    this.to,
    this.financialFrom,
    this.financialTo,
  });

  Data.fromJson(Map<String, dynamic> json) {
    comid = json['comid'];
    debitWalletUrl = json['debit_wallet_url'];
    type = json['type'];
    if (json['total_mywallet_distributed'] != null) {
      totalMywalletDistributed = <TotalMywalletDistributed>[];
      json['total_mywallet_distributed'].forEach((v) {
        totalMywalletDistributed!.add(TotalMywalletDistributed.fromJson(v));
      });
    }
    if (json['total_mywallet_reedemed'] != null) {
      totalMywalletReedemed = <TotalMywalletReedemed>[];
      json['total_mywallet_reedemed'].forEach((v) {
        totalMywalletReedemed!.add(TotalMywalletReedemed.fromJson(v));
      });
    }
    if (json['total_mybudget_expired'] != null) {
      totalMybudgetExpired = <TotalMybudgetExpired>[];
      json['total_mybudget_expired'].forEach((v) {
        totalMybudgetExpired!.add(TotalMybudgetExpired.fromJson(v));
      });
    }
    totalMywalletBalance = json['total_mywallet_balance'] != null
        ? TotalMywalletDistributed.fromJson(json['total_mywallet_balance'])
        : null;
    totalReceviedOrderPoint = json['total_recevied_order_point'] != null
        ? TotalReceviedOrderPoint.fromJson(json['total_recevied_order_point'])
        : null;
    from = json['from'];
    to = json['to'];
    financialFrom = json['financial_from'];
    financialTo = json['financial_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comid'] = comid;
    data['debit_wallet_url'] = debitWalletUrl;
    data['type'] = type;
    if (totalMywalletDistributed != null) {
      data['total_mywallet_distributed'] =
          totalMywalletDistributed!.map((v) => v.toJson()).toList();
    }
    if (totalMywalletReedemed != null) {
      data['total_mywallet_reedemed'] =
          totalMywalletReedemed!.map((v) => v.toJson()).toList();
    }
    if (totalMybudgetExpired != null) {
      data['total_mybudget_expired'] =
          totalMybudgetExpired!.map((v) => v.toJson()).toList();
    }
    if (totalMywalletBalance != null) {
      data['total_mywallet_balance'] = totalMywalletBalance!.toJson();
    }
    if (totalReceviedOrderPoint != null) {
      data['total_recevied_order_point'] = totalReceviedOrderPoint!.toJson();
    }
    data['from'] = from;
    data['to'] = to;
    data['financial_from'] = financialFrom;
    data['financial_to'] = financialTo;
    return data;
  }
}

class TotalMywalletDistributed {
  String? sum;

  TotalMywalletDistributed({this.sum});

  TotalMywalletDistributed.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sum'] = sum;
    return data;
  }
}

class TotalMywalletReedemed {
  String? points;

  TotalMywalletReedemed({this.points});

  TotalMywalletReedemed.fromJson(Map<String, dynamic> json) {
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['points'] = points;
    return data;
  }
}

class TotalReceviedOrderPoint {
  String? totalpoint;

  TotalReceviedOrderPoint({this.totalpoint});

  TotalReceviedOrderPoint.fromJson(Map<String, dynamic> json) {
    totalpoint = json['totalpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalpoint'] = totalpoint;
    return data;
  }
}

class TotalMybudgetExpired {
  int? sum;

  TotalMybudgetExpired({this.sum});

  TotalMybudgetExpired.fromJson(Map<String, dynamic> json) {
    sum = int.parse(
        json['sum'] ?? '0'); // Handle null or non-integer values gracefully
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sum'] = sum;
    return data;
  }
}
