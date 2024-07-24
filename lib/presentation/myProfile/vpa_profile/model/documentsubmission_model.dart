class DocumentSubmissionResponse {
  final String? userPanId;
  final String? msg;

  DocumentSubmissionResponse({
    this.userPanId,
    this.msg,
  });

  factory DocumentSubmissionResponse.fromJson(Map<String, dynamic> json) {
    return DocumentSubmissionResponse(
      userPanId: json['user_pan_id'] as String?,
      msg: json['msg'] as String?,
    );
  }
}
