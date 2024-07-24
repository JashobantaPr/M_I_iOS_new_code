class SuperChequeStatus {
  final String status;
  final dynamic data;
  final String msg;

  SuperChequeStatus({
    required this.status,
    required this.data,
    required this.msg,
  });

  factory SuperChequeStatus.fromJson(Map<String, dynamic> json) {
    return SuperChequeStatus(
      status: json['status'],
      data: json['data'],
      msg: json['msg'],
    );
  }
}
