class BankDocumentSubmissionResponse {
  final String? userPanId;
  final String? msg;

  BankDocumentSubmissionResponse({
    this.userPanId,
    this.msg,
  });

  factory BankDocumentSubmissionResponse.fromJson(Map<String, dynamic> json) {
    return BankDocumentSubmissionResponse(
      userPanId: json['user_bank_id'] as String?,
      msg: json['msg'] as String?,
    );
  }
}
