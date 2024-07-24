class LeaderBoardResponse {
  final String status;
  final Data data;

  LeaderBoardResponse({required this.status, required this.data});

  factory LeaderBoardResponse.fromJson(Map<String, dynamic> json) {
    return LeaderBoardResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final Map<String, User> users;
  final List<String> userIds;
  final List<ProgramDetails> programDetails;
  final List<ProgramOwner> programOwners;
  final List<ProgramCoOwner> programCoOwners;
  final Map<String, AllRank> allRank;

  Data({
    required this.users,
    required this.userIds,
    required this.programDetails,
    required this.programOwners,
    required this.programCoOwners,
    required this.allRank,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var usersMap = <String, User>{};
    json['users'].forEach((key, value) {
      usersMap[key] = User.fromJson(value);
    });

    List<String> userIdsList = (json['user_ids'] as String).split(',');

    List<ProgramDetails> programDetailsList = [];
    for (var program in json['program_details']) {
      programDetailsList.add(ProgramDetails.fromJson(program));
    }

    List<ProgramOwner> programOwnersList = [];
    for (var owner in json['program_owners']) {
      programOwnersList.add(ProgramOwner.fromJson(owner));
    }

    List<ProgramCoOwner> programCoOwnersList = [];
    for (var coOwner in json['program_co_owners']) {
      programCoOwnersList.add(ProgramCoOwner.fromJson(coOwner));
    }

    var allRankMap = <String, AllRank>{};
    json['allrank'].forEach((key, value) {
      allRankMap[key] = AllRank.fromJson(value);
    });

    return Data(
      users: usersMap,
      userIds: userIdsList,
      programDetails: programDetailsList,
      programOwners: programOwnersList,
      programCoOwners: programCoOwnersList,
      allRank: allRankMap,
    );
  }
}


class User {
  final String firstName;
  final String lastName;
  final String email;
  final String profile;
  final String userId;
  final String? country;
  final String dpname;
  final String dsname;
  final String scope;
  final String? state;
  final String? city;
  final String roleName;
  final String departmentId;
  final String designationId;
  final String scopeId;
  final String dateOfBirth;
  final String rolesId;
  final String countryCode;
  final String phoneNumber;
  final String empoyeeId;
  final String userStatusId;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profile,
    required this.userId,
    this.country,
    required this.dpname,
    required this.dsname,
    required this.scope,
    this.state,
    this.city,
    required this.roleName,
    required this.departmentId,
    required this.designationId,
    required this.scopeId,
    required this.dateOfBirth,
    required this.rolesId,
    required this.countryCode,
    required this.phoneNumber,
    required this.empoyeeId,
    required this.userStatusId,
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
  final String programId;
  final String name;
  final String programCode;
  final String campaignModeIdFk;
  final String description;
  final String programStatusId;
  final String bannerUrl;
  final String cmsCompanyId;
  final String createdBy;
  final String createdAt;
  final String updatedAt;
  final String tentativeBudget;
  final String expiryDate;
  final String startdate;
  final String enddate;
  final String walletTypeId;
  final String frEnabledStatus;
  final String frNotificationDate;
  final String frDate;
  final String leaderboardEnable;
  final String showEarnedPointsLeaderboard;
  final String participantsViewLeaderboard;
  final String ranksLeaderboard;
  final String freqStatusIdFk;
  final String targetMeterEnable;
  final String targetName;
  final String kpiValue;
  final String startDate;
  final String endDate;
  final String updatedBy;
  final String defaultBannerAdded;
  final String? participantsTableName;
  final String? calculationTableName;
  final String? incentivePayoutColumnName;
  final String? kpiDisplayTypeIdFk;
  final String frPaymentModeType;
  final String freezeStatus;
  final String bucketIdFk;
  final String campignMode;
  final String caModeIdPk;
  final String owner;
  final String? awardPointLevelIdFk;
  final String? claimTypeIdFk;
  final String? workflowApprovalType;
  final String? claimTypeName;

  ProgramDetails({
    required this.programId,
    required this.name,
    required this.programCode,
    required this.campaignModeIdFk,
    required this.description,
    required this.programStatusId,
    required this.bannerUrl,
    required this.cmsCompanyId,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.tentativeBudget,
    required this.expiryDate,
    required this.startdate,
    required this.enddate,
    required this.walletTypeId,
    required this.frEnabledStatus,
    required this.frNotificationDate,
    required this.frDate,
    required this.leaderboardEnable,
    required this.showEarnedPointsLeaderboard,
    required this.participantsViewLeaderboard,
    required this.ranksLeaderboard,
    required this.freqStatusIdFk,
    required this.targetMeterEnable,
    required this.targetName,
    required this.kpiValue,
    required this.startDate,
    required this.endDate,
    required this.updatedBy,
    required this.defaultBannerAdded,
    this.participantsTableName,
    this.calculationTableName,
    this.incentivePayoutColumnName,
    this.kpiDisplayTypeIdFk,
    required this.frPaymentModeType,
    required this.freezeStatus,
    required this.bucketIdFk,
    required this.campignMode,
    required this.caModeIdPk,
    required this.owner,
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
  final String name;
  final String cmsUserId;
  final String email;

  ProgramOwner({
    required this.name,
    required this.cmsUserId,
    required this.email,
  });

  factory ProgramOwner.fromJson(Map<String, dynamic> json) {
    return ProgramOwner(
      name: json['name'],
      cmsUserId: json['cms_user_id'],
      email: json['email'],
    );
  }
}

class ProgramCoOwner {
  final String name;
  final String cmsUserId;
  final String email;

  ProgramCoOwner({
    required this.name,
    required this.cmsUserId,
    required this.email,
  });

  factory ProgramCoOwner.fromJson(Map<String, dynamic> json) {
    return ProgramCoOwner(
      name: json['name'],
      cmsUserId: json['cms_user_id'],
      email: json['email'],
    );
  }
}


class AllRank {
  final String cmsUserIdFk;
  final String points;
  final String ranks;

  AllRank({
    required this.cmsUserIdFk,
    required this.points,
    required this.ranks,
  });

  factory AllRank.fromJson(Map<String, dynamic> json) {
    return AllRank(
      cmsUserIdFk: json['cms_user_id_fk'],
      points: json['points'],
      ranks: json['ranks'],
    );
  }
}