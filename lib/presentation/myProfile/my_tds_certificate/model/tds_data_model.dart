class TDSCertificate {
  final String userEmail;
  final String quarter;
  final String year;
  final String fileName;
  final String tdsPoints;
  final String uploadedByDate;
  final String userwiseTdsId;

  TDSCertificate({
    required this.userEmail,
    required this.quarter,
    required this.year,
    required this.fileName,
    required this.tdsPoints,
    required this.uploadedByDate,
    required this.userwiseTdsId,
  });

  factory TDSCertificate.fromJson(Map<String, dynamic> json) {
    return TDSCertificate(
      userEmail: json['user_email'],
      quarter: json['quarter'],
      year: json['year'],
      fileName: json['file_name'],
      tdsPoints: json['tds_points'],
      uploadedByDate: json['uploaded_by_date'],
      userwiseTdsId: json['userwise_tds_id'],
    );
  }
}