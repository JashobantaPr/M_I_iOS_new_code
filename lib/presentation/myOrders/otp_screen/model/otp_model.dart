class OtpCodeModel {
  bool? status;
  String? msg;
  String? otpType;
  int? otpEmail;
  int? otpMobile;
  int? otp;

  OtpCodeModel(
      {this.status,
      this.msg,
      this.otpType,
      this.otpEmail,
      this.otpMobile,
      this.otp});

  OtpCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    otpType = json['otp_type'];
    otpEmail = json['otp_email'];
    otpMobile = json['otp_mobile'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['otp_type'] = this.otpType;
    data['otp_email'] = this.otpEmail;
    data['otp_mobile'] = this.otpMobile;
    data['otp'] = this.otp;
    return data;
  }
}
