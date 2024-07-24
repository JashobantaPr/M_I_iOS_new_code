class User {
  String phoneNumber;
  String userIdPk;
  String countryCode;
  String fullname;
  String email;
  String firstName;
  String lastName;
  String profile;
  DateTime dateOfBirth;
  DateTime dateOfJoin;

  User({
    required this.phoneNumber,
    required this.userIdPk,
    required this.countryCode,
    required this.fullname,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profile,
    required this.dateOfBirth,
    required this.dateOfJoin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['phone_number'] ?? '',
      userIdPk: json['user_id_pk'],
      countryCode: json['country_code'],
      fullname: json['fullname'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profile: json['profile'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      dateOfJoin: DateTime.parse(json['date_of_join']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
      'user_id_pk': userIdPk,
      'country_code': countryCode,
      'fullname': fullname,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'profile': profile,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'date_of_join': dateOfJoin.toIso8601String(),
    };
  }
}

class Certificate {
  String postIdPk;
  String name;
  String description;
  String postedDate;
  String authoredBy;
  String certificateToCmsUserId;
  String certificateName;
  String certificateRecipientName;
  String certificatePoints;
  String certificateTemplate;
  String likes;
  String totalComments;

  Certificate({
    required this.postIdPk,
    required this.name,
    required this.description,
    required this.postedDate,
    required this.authoredBy,
    required this.certificateToCmsUserId,
    required this.certificateName,
    required this.certificateRecipientName,
    required this.certificatePoints,
    required this.certificateTemplate,
    required this.likes,
    required this.totalComments,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      postIdPk: json['post_id_pk'],
      name: json['name'],
      description: json['description'],
      postedDate: json['posted_date'],
      authoredBy: json['authored_by'],
      certificateToCmsUserId: json['certificate_to_cms_user_id'],
      certificateName: json['certificate_name'],
      certificateRecipientName: json['certificate_recipient_name'],
      certificatePoints: json['certificate_points'],
      certificateTemplate: json['certificate_template'],
      likes: json['likes'],
      totalComments: json['totalcomments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'post_id_pk': postIdPk,
      'name': name,
      'description': description,
      'posted_date': postedDate,
      'authored_by': authoredBy,
      'certificate_to_cms_user_id': certificateToCmsUserId,
      'certificate_name': certificateName,
      'certificate_recipient_name': certificateRecipientName,
      'certificate_points': certificatePoints,
      'certificate_template': certificateTemplate,
      'likes': likes,
      'totalcomments': totalComments,
    };
  }

  String getAuthorFullname(Map<String, User> userdata) {
    return userdata[authoredBy]?.fullname ?? 'Unknown';
  }
}


class ApiResponse {
  Map<String, User> userdata;
  Map<String, User> taggedUserdata;
  bool status;
  List<Certificate> certificatesList;

  ApiResponse({
    required this.userdata,
    required this.taggedUserdata,
    required this.status,
    required this.certificatesList,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var userdataJson = json['userdata'] as Map<String, dynamic>;
    var taggedUserdataJson = json['tagged_userdata'] as Map<String, dynamic>;
    var certificatesListJson = json['certificates_list'] as List;

    Map<String, User> userdata =
        userdataJson.map((key, value) => MapEntry(key, User.fromJson(value)));
    Map<String, User> taggedUserdata = taggedUserdataJson
        .map((key, value) => MapEntry(key, User.fromJson(value)));
    List<Certificate> certificatesList =
        certificatesListJson.map((item) => Certificate.fromJson(item)).toList();

    return ApiResponse(
      userdata: userdata,
      taggedUserdata: taggedUserdata,
      status: json['status'],
      certificatesList: certificatesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userdata': userdata.map((key, value) => MapEntry(key, value.toJson())),
      'tagged_userdata':
          taggedUserdata.map((key, value) => MapEntry(key, value.toJson())),
      'status': status,
      'certificates_list':
          certificatesList.map((item) => item.toJson()).toList(),
    };
  }
}
