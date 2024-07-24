import 'dart:convert';

class ClaimData1 {
  int pending;
  int approved;
  int rejected;
  int submitted;
  int discarded;

  ClaimData1({
    required this.pending,
    required this.approved,
    required this.rejected,
    required this.submitted,
    required this.discarded,
  });

  factory ClaimData1.fromJson(Map<String, dynamic> json) {
    return ClaimData1(
      pending: int.parse(json['Pending']),
      approved: int.parse(json['Approved']),
      rejected: int.parse(json['Rejected']),
      submitted: int.parse(json['Submitted']),
      discarded: int.parse(json['Discarded']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Pending': pending.toString(),
      'Approved': approved.toString(),
      'Rejected': rejected.toString(),
      'Submitted': submitted.toString(),
      'Discarded': discarded.toString(),
    };
  }
}

class ApiResponse {
  ClaimData1 claimData;
  bool status;

  ApiResponse({
    required this.claimData,
    required this.status,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      claimData: ClaimData1.fromJson(json['claim_data']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'claim_data': claimData.toJson(),
      'status': status,
    };
  }
}

void main() {
  String jsonString = '''
  {
    "claim_data": {
        "Pending": "2",
        "Approved": "1",
        "Rejected": "0",
        "Submitted": "3",
        "Discarded": "0"
    },
    "status": true
  }
  ''';

  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  ApiResponse apiResponse = ApiResponse.fromJson(jsonMap);

  print('Pending: ${apiResponse.claimData.pending}');
  print('Approved: ${apiResponse.claimData.approved}');
  print('Rejected: ${apiResponse.claimData.rejected}');
  print('Submitted: ${apiResponse.claimData.submitted}');
  print('Discarded: ${apiResponse.claimData.discarded}');
  print('Status: ${apiResponse.status}');
}
