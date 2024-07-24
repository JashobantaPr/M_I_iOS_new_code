class Fetchedbuzzes {
  final String? k;
  final String? birthdayimg;
  final String? anniimage;
  final Map<String, BuzzUser>? users;
  final List<BuzzPost>? posts;
  final List<BuzzComment>? comments;
  final String? recognitionfile;
  final String? certificateaudio;

  Fetchedbuzzes({
    this.k,
    this.birthdayimg,
    this.anniimage,
    this.users,
    this.comments,
    this.posts,
    this.recognitionfile,
    this.certificateaudio,
  });

  factory Fetchedbuzzes.fromJson(Map<String, dynamic> json) {
    return Fetchedbuzzes(
      k: json['k'],
      birthdayimg: json['birthdayimg'],
      anniimage: json['anniimage'],
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, BuzzUser.fromJson(value)),
      ),
      posts: json['posts'] != null
          ? (json['posts'] as List).map((i) => BuzzPost.fromJson(i)).toList()
          : [],
      comments: json['comments'] != null
          ? (json['comments'] as Map<String, dynamic>).entries.map((entry) {
              return BuzzComment.fromJson(entry.value[0]);
            }).toList()
          : [],
      recognitionfile: json['recognitionfile'] ?? null,
      certificateaudio: json['certificateaudio'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'k': k,
      'birthdayimg': birthdayimg,
      'anniimage': anniimage,
      'users': users?.map((key, value) => MapEntry(key, value.toJson())),
      'posts': posts?.map((i) => i.toJson()).toList(),
      'comments': comments?.map((i) => i.toJson()).toList(),
      'recognitionfile': recognitionfile,
      'certificateaudio': certificateaudio,
    };
  }
}

class BuzzUser {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final String? userIdPk;
  final String? country;
  final String? dpname;
  final String? dsname;
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

  BuzzUser({
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

  factory BuzzUser.fromJson(Map<String, dynamic> json) {
    return BuzzUser(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profile: json['profile'],
      userIdPk: json['user_id_pk'],
      country: json['country'] ?? null,
      dpname: json['dpname'],
      dsname: json['dsname'],
      scope: json['scope'],
      state: json['state'] ?? '',
      city: json['city'] ?? '',
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

class BuzzPost {
  final String? postIdPk;
  final String? scopeIdFk;
  final String? deletedReason;
  final String? description;
  final String? name;
  final String? authoredBy;
  final String? postType;
  final String? recorddate;
  final String? image;
  final String? deleted;
  final String? deletedByUserId;
  final String? buzzzTypeName;
  final String? buzzzPostTypeFk;
  final String? isGlobalPost;
  final String? taggedUsers;
  final String? likes;
  final String? totalcomments;
  final String? userlike;
  final String? behaviour;
  final String? icon;
  final String? bmActive;
  final String? recognitionfile;
  final String? recognitionthumb;

  BuzzPost({
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
  });

  factory BuzzPost.fromJson(Map<String, dynamic> json) {
    return BuzzPost(
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
    };
  }
}

class BuzzComment {
  final String? commentIdPk;
  final String? comment;
  final String? cmsUserIdFk;
  final String? postIdFk;
  final String? recorddate;
  final String? likes;
  final String? userlike;

  BuzzComment({
    this.commentIdPk,
    this.comment,
    this.cmsUserIdFk,
    this.postIdFk,
    this.recorddate,
    this.likes,
    this.userlike,
  });

  factory BuzzComment.fromJson(Map<String, dynamic> json) {
    return BuzzComment(
      commentIdPk: json['comment_id_pk'],
      comment: json['comment'],
      cmsUserIdFk: json['cms_user_id_fk'],
      postIdFk: json['post_id_fk'],
      recorddate: json['recorddate'],
      likes: json['likes'],
      userlike: json['userlike'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment_id_pk': commentIdPk,
      'comment': comment,
      'cms_user_id_fk': cmsUserIdFk,
      'post_id_fk': postIdFk,
      'recorddate': recorddate,
      'likes': likes,
      'userlike': userlike,
    };
  }
}
