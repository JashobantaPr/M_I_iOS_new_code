class LeaderData {
  final Map<String, User>? users;
  final List<String>? userIds;
  final List<ProgramDetails>? programDetails;
  final List<ProgramOwner>? programOwners;
  final List<ProgramCoOwner>? programCoOwners;
  final Map<String, AllRank>? allRank;
  final List<ProgramReportOwner>? programReportOwners;

  LeaderData(
      {this.users,
      this.userIds,
      this.programDetails,
      this.programOwners,
      this.programCoOwners,
      this.allRank,
      this.programReportOwners});

  factory LeaderData.fromJson(Map<String, dynamic> json) {
    print('hdsjhdks${json['users']}');
    print('hdsjhdks${json['user_ids']}');
    print('hdsjhdks${json['program_details']}');
    print('hdsjhdks${json['program_owners']}');
    var usersMap = <String, User>{};
    if (json['users'] != null) {
      json['users'].forEach((key, value) {
        usersMap[key] = User.fromJson(value);
      });
    }

    List<String> userIdsList = [];
    if (json['user_ids'] != null) {
      userIdsList = (json['user_ids'] as String).split(',');
    }

    List<ProgramDetails> programDetailsList = [];
    if (json['program_details'] != null) {
      for (var program in json['program_details']) {
        programDetailsList.add(ProgramDetails.fromJson(program));
      }
    }

    List<ProgramOwner> programOwnersList = [];
    if (json['program_owners'] != null) {
      for (var owner in json['program_owners']) {
        programOwnersList.add(ProgramOwner.fromJson(owner));
      }
    }

    List<ProgramCoOwner> programCoOwnersList = [];
    if (json['program_co_owners'] != null) {
      for (var coOwner in json['program_co_owners']) {
        programCoOwnersList.add(ProgramCoOwner.fromJson(coOwner));
      }
    }
    List<ProgramReportOwner> programReportOwnersList = [];
    if (json['program_report_owners'] != null) {
      for (var coOwner in json['program_report_owners']) {
        programReportOwnersList.add(ProgramReportOwner.fromJson(coOwner));
      }
    }

    var allRankMap = <String, AllRank>{};
    if (json['allrank'] != null) {
      json['allrank'].forEach((key, value) {
        allRankMap[key] = AllRank.fromJson(value);
      });
    }

    return LeaderData(
      users: usersMap,
      userIds: userIdsList,
      programDetails: programDetailsList,
      programOwners: programOwnersList,
      programCoOwners: programCoOwnersList,
      allRank: allRankMap,
      programReportOwners: programReportOwnersList,
    );
  }
}

class User {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profile;
  final String? userId;
  final String? country;
  final String? dpname;
  final String? dsname;
  final String? scope;
  final String? state;
  final String? city;
  final String? roleName;
  final String? departmentId;
  final String? designationId;
  final String? scopeId;
  final String? dateOfBirth;
  final String? rolesId;
  final String? countryCode;
  final String? phoneNumber;
  final String? empoyeeId;
  final String? userStatusId;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
    this.userId,
    this.country,
    this.dpname,
    this.dsname,
    this.scope,
    this.state,
    this.city,
    this.roleName,
    this.departmentId,
    this.designationId,
    this.scopeId,
    this.dateOfBirth,
    this.rolesId,
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
      userId: json['user_id_pk'],
      country: json['country'],
      dpname: json['dpname'],
      dsname: json['dsname'],
      scope: json['scope'],
      state: json['state'],
      city: json['city'],
      roleName: json['roleName'],
      departmentId: json['department_id_fk'],
      designationId: json['designation_id_fk'],
      scopeId: json['scope_id_pk'],
      dateOfBirth: json['date_of_birth'],
      rolesId: json['roles_id_pk'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      empoyeeId: json['empoyee_id'],
      userStatusId: json['user_status_id'],
    );
  }
}

class ProgramDetails {
  final String? programId;
  final String? name;
  final String? programCode;
  final String? campaignModeIdFk;
  final String? description;
  final String? programStatusId;
  final String? bannerUrl;
  final String? cmsCompanyId;
  final String? createdBy;
  final String? createdAt;
  final String? updatedAt;
  final String? tentativeBudget;
  final String? expiryDate;
  final String? startdate;
  final String? enddate;
  final String? walletTypeId;
  final String? frEnabledStatus;
  final String? frNotificationDate;
  final String? frDate;
  final String? leaderboardEnable;
  final String? showEarnedPointsLeaderboard;
  final String? participantsViewLeaderboard;
  final String? ranksLeaderboard;
  final String? freqStatusIdFk;
  final String? targetMeterEnable;
  final String? targetName;
  final String? kpiValue;
  final String? startDate;
  final String? endDate;
  final String? updatedBy;
  final String? defaultBannerAdded;
  final String? participantsTableName;
  final String? calculationTableName;
  final String? incentivePayoutColumnName;
  final String? kpiDisplayTypeIdFk;
  final String? frPaymentModeType;
  final String? freezeStatus;
  final String? bucketIdFk;
  final String? campignMode;
  final String? caModeIdPk;
  final String? owner;
  final String? awardPointLevelIdFk;
  final String? claimTypeIdFk;
  final String? workflowApprovalType;
  final String? claimTypeName;

  ProgramDetails({
    this.programId,
    this.name,
    this.programCode,
    this.campaignModeIdFk,
    this.description,
    this.programStatusId,
    this.bannerUrl,
    this.cmsCompanyId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.tentativeBudget,
    this.expiryDate,
    this.startdate,
    this.enddate,
    this.walletTypeId,
    this.frEnabledStatus,
    this.frNotificationDate,
    this.frDate,
    this.leaderboardEnable,
    this.showEarnedPointsLeaderboard,
    this.participantsViewLeaderboard,
    this.ranksLeaderboard,
    this.freqStatusIdFk,
    this.targetMeterEnable,
    this.targetName,
    this.kpiValue,
    this.startDate,
    this.endDate,
    this.updatedBy,
    this.defaultBannerAdded,
    this.participantsTableName,
    this.calculationTableName,
    this.incentivePayoutColumnName,
    this.kpiDisplayTypeIdFk,
    this.frPaymentModeType,
    this.freezeStatus,
    this.bucketIdFk,
    this.campignMode,
    this.caModeIdPk,
    this.owner,
    this.awardPointLevelIdFk,
    this.claimTypeIdFk,
    this.workflowApprovalType,
    this.claimTypeName,
  });

  factory ProgramDetails.fromJson(Map<String, dynamic> json) {
    return ProgramDetails(
      programId: json['program_id'],
      name: json['name'],
      programCode: json['program_code'],
      campaignModeIdFk: json['campaign_mode_id_fk'],
      description: json['description'],
      programStatusId: json['program_status_id'],
      bannerUrl: json['banner_url'],
      cmsCompanyId: json['cms_company_id'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      tentativeBudget: json['tentative_budget'],
      expiryDate: json['expiry_date'],
      startdate: json['start_date'],
      enddate: json['end_date'],
      walletTypeId: json['wallet_type_id'],
      frEnabledStatus: json['fr_enabled_status'],
      frNotificationDate: json['fr_notification_date'],
      frDate: json['fr_date'],
      leaderboardEnable: json['leaderboard_enable'],
      showEarnedPointsLeaderboard: json['show_earned_points_leaderboard'],
      participantsViewLeaderboard: json['participants_view_leaderboard'],
      ranksLeaderboard: json['ranks_leaderboard'],
      freqStatusIdFk: json['freq_status_id_fk'],
      targetMeterEnable: json['target_meter_enable'],
      targetName: json['target_name'],
      kpiValue: json['kpi_value'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      updatedBy: json['updated_by'],
      defaultBannerAdded: json['default_banner_added'],
      participantsTableName: json['participants_table_name'],
      calculationTableName: json['calculation_table_name'],
      incentivePayoutColumnName: json['incentive_payout_column_name'],
      kpiDisplayTypeIdFk: json['kpi_display_type_id_fk'],
      frPaymentModeType: json['fr_payment_mode_type'],
      freezeStatus: json['freeze_status'],
      bucketIdFk: json['bucket_id_fk'],
      campignMode: json['campign_mode'],
      caModeIdPk: json['ca_mode_id_pk'],
      owner: json['owner'],
      awardPointLevelIdFk: json['award_point_level_id_fk'],
      claimTypeIdFk: json['claim_type_id_fk'],
      workflowApprovalType: json['workflow_approval_type'],
      claimTypeName: json['claim_type_name'],
    );
  }
}

class ProgramOwner {
  final String? name;
  final String? cmsUserId;
  final String? email;

  ProgramOwner({this.name, this.cmsUserId, this.email});

  factory ProgramOwner.fromJson(Map<String, dynamic> json) {
    return ProgramOwner(
      name: json['name'],
      cmsUserId: json['cms_user_id'],
      email: json['email'],
    );
  }
}

class ProgramReportOwner {
  final String? name;
  final String? cmsUserId;
  final String? email;

  ProgramReportOwner({this.name, this.cmsUserId, this.email});

  factory ProgramReportOwner.fromJson(Map<String, dynamic> json) {
    return ProgramReportOwner(
      name: json['name'],
      cmsUserId: json['cms_user_id'],
      email: json['email'],
    );
  }
}

class AllRank {
  final String? cmsUserIdFk;
  final String? points;
  final String? ranks;

  AllRank({this.cmsUserIdFk, this.points, this.ranks});

  factory AllRank.fromJson(Map<String, dynamic> json) {
    return AllRank(
      cmsUserIdFk: json['cms_user_id_fk'],
      points: json['points'],
      ranks: json['ranks'],
    );
  }
}

class ProgramCoOwner {
  final String? name;
  final String? cmsUserId;
  final String? email;

  ProgramCoOwner({this.name, this.cmsUserId, this.email});

  factory ProgramCoOwner.fromJson(Map<String, dynamic> json) {
    return ProgramCoOwner(
      name: json['name'],
      cmsUserId: json['cms_user_id'],
      email: json['email'],
    );
  }
}
