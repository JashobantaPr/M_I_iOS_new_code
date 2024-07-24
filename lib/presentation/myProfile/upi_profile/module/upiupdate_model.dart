class UpiProfileSubmitResponse {
  final String? msg;
  final String? userUpiId;

  UpiProfileSubmitResponse({
     this.msg,
     this.userUpiId,
  });

  factory UpiProfileSubmitResponse.fromJson(Map<String, dynamic> json) {
    return UpiProfileSubmitResponse(
      msg: json['msg'] ?? '',
      userUpiId: json['user_upi_id'] ?? '',
    );
  }
}
