class viewCertificate {
  bool? status;
  Data? data;

  viewCertificate({this.status, this.data});

  factory viewCertificate.fromJson(Map<String, dynamic> json) {
    return viewCertificate(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  List<String>? birthdayimg;
  List<String>? anniimage;
  List<String>? eventimage;
  List<String>? quizimage;
  Map<String, User>? users;
  List<Comment>? comments;
  List<Post>? posts;

  Data({
    this.type,
    this.birthdayimg,
    this.anniimage,
    this.eventimage,
    this.quizimage,
    this.users,
    this.comments,
    this.posts,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      type: json['type'],
      birthdayimg: List<String>.from(json['birthdayimg'] ?? []),
      anniimage: List<String>.from(json['anniimage'] ?? []),
      eventimage: List<String>.from(json['eventimage'] ?? []),
      quizimage: List<String>.from(json['quizimage'] ?? []),
      users: json['users'] != null
          ? Map<String, User>.from(json['users']
              .map((key, value) => MapEntry(key, User.fromJson(value))))
          : {},
      comments: _parseComments(json['comments']),
      posts: json['posts'] != null
          ? List<Post>.from(json['posts'].map((x) => Post.fromJson(x)))
          : [],
    );
  }

  static List<Comment>? _parseComments(dynamic commentsJson) {
    if (commentsJson is List) {
      // Handle empty comments case
      return [];
    } else if (commentsJson is Map<String, dynamic>) {
      // Handle comments with data case
      List<Comment> comments = [];
      commentsJson.forEach((key, value) {
        if (value is List) {
          // Handle comments list case
          comments.addAll(value.map((e) => Comment.fromJson(e)));
        } else if (value is Map<String, dynamic>) {
          // Handle single comment case
          comments.add(Comment.fromJson(value));
        }
      });
      return comments;
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = this.type;
    data['birthdayimg'] = this.birthdayimg;
    data['anniimage'] = this.anniimage;
    data['eventimage'] = this.eventimage;
    data['quizimage'] = this.quizimage;
    if (this.users != null) {
      data['users'] =
          this.users!.map((key, value) => MapEntry(key, value.toJson()));
    }
    if (this.comments != null) {
      // Convert comments list to a map if needed
      data['comments'] = this
          .comments!
          .map((x) => x.toJson())
          .toList(); // or this.comments!.fold({}, (map, item) => map..addAll(item.toJson()));
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? profile;
  String? userIdPk;
  String? country;
  String? dpname;
  String? dsname;
  String? scope;
  String? state;
  String? city;
  String? roleName;
  String? departmentIdFk;
  String? designationIdFk;
  String? scopeIdPk;
  String? dateOfBirth;
  String? rolesIdPk;
  String? countryCode;
  String? phoneNumber;
  String? empoyeeId;
  String? userStatusId;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
    this.userIdPk,
    this.country,
    this.dpname,
    this.dsname,
    this.scope,
    this.state,
    this.city,
    this.roleName,
    this.departmentIdFk,
    this.designationIdFk,
    this.scopeIdPk,
    this.dateOfBirth,
    this.rolesIdPk,
    this.countryCode,
    this.phoneNumber,
    this.empoyeeId,
    this.userStatusId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profile: json['profile'],
      userIdPk: json['user_id_pk'],
      country: json['country'],
      dpname: json['dpname'],
      dsname: json['dsname'],
      scope: json['scope'],
      state: json['state'],
      city: json['city'],
      roleName: json['roleName'],
      departmentIdFk: json['department_id_fk'],
      designationIdFk: json['designation_id_fk'],
      scopeIdPk: json['scope_id_pk'],
      dateOfBirth: json['date_of_birth'],
      rolesIdPk: json['roles_id_pk'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      empoyeeId: json['empoyee_id'],
      userStatusId: json['user_status_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'profile': profile,
      'user_id_pk': userIdPk,
      'country': country,
      'dpname': dpname,
      'dsname': dsname,
      'scope': scope,
      'state': state,
      'city': city,
      'roleName': roleName,
      'department_id_fk': departmentIdFk,
      'designation_id_fk': designationIdFk,
      'scope_id_pk': scopeIdPk,
      'date_of_birth': dateOfBirth,
      'roles_id_pk': rolesIdPk,
      'country_code': countryCode,
      'phone_number': phoneNumber,
      'empoyee_id': empoyeeId,
      'user_status_id': userStatusId,
    };
  }
}

class Post {
  String? postIdPk;
  String? scopeIdFk;
  String? deletedReason;
  String? description;
  String? name;
  String? authoredBy;
  String? postType;
  String? recorddate;
  String? image;
  String? deleted;
  String? deletedByUserId;
  String? buzzzTypeName;
  String? buzzzPostTypeFk;
  String? isGlobalPost;
  String? taggedUsers;
  String? likes;
  String? totalcomments;
  String? userlike;
  String? behaviour;
  String? icon;
  String? bmActive;
  String? recognitionfile;
  String? recognitionthumb;
  String? certificateUserMappingId;
  String? certificateTemplate;
  String? certificateCompanyLogo;
  String? certificateTitle;
  String? certificateRecipientName;
  String? certificateSubtitle;
  String? certificateAwardedOn;
  String? certificateSignature;
  String? html;

  Post({
    this.postIdPk,
    this.scopeIdFk,
    this.deletedReason,
    this.description,
    this.name,
    this.authoredBy,
    this.postType,
    this.recorddate,
    this.image,
    this.deleted,
    this.deletedByUserId,
    this.buzzzTypeName,
    this.buzzzPostTypeFk,
    this.isGlobalPost,
    this.taggedUsers,
    this.likes,
    this.totalcomments,
    this.userlike,
    this.behaviour,
    this.icon,
    this.bmActive,
    this.recognitionfile,
    this.recognitionthumb,
    this.certificateUserMappingId,
    this.certificateTemplate,
    this.certificateCompanyLogo,
    this.certificateTitle,
    this.certificateRecipientName,
    this.certificateSubtitle,
    this.certificateAwardedOn,
    this.certificateSignature,
    this.html,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postIdPk: json['post_id_pk'],
      scopeIdFk: json['scope_id_fk'],
      deletedReason: json['deleted_reason'],
      description: json['description'],
      name: json['name'],
      authoredBy: json['authored_by'],
      postType: json['post_type'],
      recorddate: json['recorddate'],
      image: json['image'],
      deleted: json['deleted'],
      deletedByUserId: json['deleted_by_user_id'],
      buzzzTypeName: json['buzzz_type_name'],
      buzzzPostTypeFk: json['buzzz_post_type_fk'],
      isGlobalPost: json['is_global_post'],
      taggedUsers: json['tagged_users'],
      likes: json['likes'],
      totalcomments: json['totalcomments'],
      userlike: json['userlike'],
      behaviour: json['behaviour'],
      icon: json['icon'],
      bmActive: json['bm_active'],
      recognitionfile: json['recognitionfile'],
      recognitionthumb: json['recognitionthumb'],
      certificateUserMappingId: json['certificate_user_mapping_id'],
      certificateTemplate: json['certificate_template'],
      certificateCompanyLogo: json['certificate_company_logo'],
      certificateTitle: json['certificate_title'],
      certificateRecipientName: json['certificate_recipient_name'],
      certificateSubtitle: json['certificate_subtitle'],
      certificateAwardedOn: json['certificate_awarded_on'],
      certificateSignature: json['certificate_signature'],
      html: json['html'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'post_id_pk': postIdPk,
      'scope_id_fk': scopeIdFk,
      'deleted_reason': deletedReason,
      'description': description,
      'name': name,
      'authored_by': authoredBy,
      'post_type': postType,
      'recorddate': recorddate,
      'image': image,
      'deleted': deleted,
      'deleted_by_user_id': deletedByUserId,
      'buzzz_type_name': buzzzTypeName,
      'buzzz_post_type_fk': buzzzPostTypeFk,
      'is_global_post': isGlobalPost,
      'tagged_users': taggedUsers,
      'likes': likes,
      'totalcomments': totalcomments,
      'userlike': userlike,
      'behaviour': behaviour,
      'icon': icon,
      'bm_active': bmActive,
      'recognitionfile': recognitionfile,
      'recognitionthumb': recognitionthumb,
      'certificate_user_mapping_id': certificateUserMappingId,
      'certificate_template': certificateTemplate,
      'certificate_company_logo': certificateCompanyLogo,
      'certificate_title': certificateTitle,
      'certificate_recipient_name': certificateRecipientName,
      'certificate_subtitle': certificateSubtitle,
      'certificate_awarded_on': certificateAwardedOn,
      'certificate_signature': certificateSignature,
      'html': html,
    };
  }
}

class Comment {
  String? commentIdPk;
  String? postIdFk;
  String? userIdFk;
  String? comment;
  String? commentDate;

  Comment({
    this.commentIdPk,
    this.postIdFk,
    this.userIdFk,
    this.comment,
    this.commentDate,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentIdPk: json['comment_id_pk'],
      postIdFk: json['post_id_fk'],
      userIdFk: json['user_id_fk'],
      comment: json['comment'],
      commentDate: json['comment_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment_id_pk': commentIdPk,
      'post_id_fk': postIdFk,
      'user_id_fk': userIdFk,
      'comment': comment,
      'comment_date': commentDate,
    };
  }
}
