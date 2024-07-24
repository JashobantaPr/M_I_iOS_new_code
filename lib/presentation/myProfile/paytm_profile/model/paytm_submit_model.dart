class PaytmProfileResponse {
  final String? msg;
  final String? userPaytmId;

  PaytmProfileResponse({this.msg, this.userPaytmId});

  factory PaytmProfileResponse.fromJson(Map<String, dynamic> json) {
    return PaytmProfileResponse(
      msg: json['msg'] as String?,
      userPaytmId: json['user_paytm_id'] as String?,
    );
  }
}
