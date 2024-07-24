class CommentsResponse {
  final CommentsData? comments;
  final Map<String, UserDetails>? users;

  CommentsResponse({this.comments, this.users});

  factory CommentsResponse.fromJson(Map<String, dynamic> json) {
    return CommentsResponse(
      comments: json['comments'] != null
          ? CommentsData.fromJson(json['comments'])
          : null,
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (k, v) => MapEntry(k, UserDetails.fromJson(v as Map<String, dynamic>)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comments': comments?.toJson(),
      'users': users?.map((k, v) => MapEntry(k, v.toJson())),
    };
  }
}

class CommentsData {
  final List<Comment> comments;
  final String? commentUsers;

  CommentsData({this.comments = const [], this.commentUsers});

  factory CommentsData.fromJson(Map<String, dynamic> json) {
    var commentsList = json['comments'] as List? ?? [];
    List<Comment> comments =
        commentsList.map((i) => Comment.fromJson(i)).toList();

    return CommentsData(
      comments: comments,
      commentUsers: json['comment_users'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comments': comments.map((v) => v.toJson()).toList(),
      'comment_users': commentUsers,
    };
  }
}

class Comment {
  final String? commentIdPk;
  final String? postIdFk;
  final String? cmsUserIdFk;
  final String? comment;
  final String? parentCommentId;
  final String? active;
  final String? deleted;
  final String? deletedBy;
  final String? recordDate;
  final String? deletedReason;
  final String? likes;
  final String? userLike;

  Comment({
    this.commentIdPk,
    this.postIdFk,
    this.cmsUserIdFk,
    this.comment,
    this.parentCommentId,
    this.active,
    this.deleted,
    this.deletedBy,
    this.recordDate,
    this.deletedReason,
    this.likes,
    this.userLike,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentIdPk: json['comment_id_pk'],
      postIdFk: json['post_id_fk'],
      cmsUserIdFk: json['cms_user_id_fk'],
      comment: json['comment'],
      parentCommentId: json['parent_comment_id'],
      active: json['active'],
      deleted: json['deleted'],
      deletedBy: json['deleted_by'],
      recordDate: json['recorddate'],
      deletedReason: json['deleted_reason'],
      likes: json['likes'],
      userLike: json['userlike'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment_id_pk': commentIdPk,
      'post_id_fk': postIdFk,
      'cms_user_id_fk': cmsUserIdFk,
      'comment': comment,
      'parent_comment_id': parentCommentId,
      'active': active,
      'deleted': deleted,
      'deleted_by': deletedBy,
      'recorddate': recordDate,
      'deleted_reason': deletedReason,
      'likes': likes,
      'userlike': userLike,
    };
  }
}

class UserDetails {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final String? userIdPk;
  final String? country;
  final String? dpName;
  final String? dsName;
  final String? scope;
  final String? state;
  final String? city;
  final String? roleName;
  final String? departmentIdFk;
  final String? designationIdFk;
  final String? scopeIdPk;
  final String? dateOfBirth;
  final String? rolesIdPk;
  final String? countryCode;
  final String? phoneNumber;
  final String? empoyeeId;
  final String? userStatusId;

  UserDetails({
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
    this.userIdPk,
    this.country,
    this.dpName,
    this.dsName,
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

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profile: json['profile'],
      userIdPk: json['user_id_pk'],
      country: json['country'],
      dpName: json['dpname'],
      dsName: json['dsname'],
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
      'dpname': dpName,
      'dsname': dsName,
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
