/// This class defines the variables used in the [iphone_13_mini_ten_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class resendotpmodel {
  int? otp;
  String? msgType;

  resendotpmodel({this.otp, this.msgType});

  resendotpmodel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    msgType = json['msg_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['msg_type'] = this.msgType;
    return data;
  }
}

class LoginApiResponse {
  final String messageType;
  final String message;

  LoginApiResponse({required this.messageType, required this.message});

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) {
    return LoginApiResponse(
      messageType: json['mssg_type'],
      message: json['mssg'],
    );
  }
}
