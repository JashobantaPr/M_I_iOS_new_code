class HelpUserManualResponse {
  Manual? manual;
  List<Module>? modules;
  bool? status;
  List<ManualDetails>? manualDetails;

  HelpUserManualResponse({
    this.manual,
    this.modules,
    this.status,
    this.manualDetails,
  });

  factory HelpUserManualResponse.fromJson(Map<String, dynamic> json) {
    return HelpUserManualResponse(
      manual: json['manual'] != null ? Manual.fromJson(json['manual']) : null,
      modules: json['modules'] != null
          ? List<Module>.from(json['modules'].map((x) => Module.fromJson(x)))
          : [],
      status: json['status'],
      manualDetails: json['manualDetails'] != null
          ? List<ManualDetails>.from(
              json['manualDetails'].map((x) => ManualDetails.fromJson(x)))
          : [],
    );
  }
}

class Manual {
  String? manualIdPk;
  String? manualTitle;
  dynamic manualVersion;
  String? productIdFk;

  Manual({
    this.manualIdPk,
    this.manualTitle,
    this.manualVersion,
    this.productIdFk,
  });

  factory Manual.fromJson(Map<String, dynamic> json) {
    return Manual(
      manualIdPk: json['manual_id_pk'],
      manualTitle: json['manual_title'],
      manualVersion: json['manual_version'],
      productIdFk: json['product_id_fk'],
    );
  }
}

class Module {
  String? moduleName;
  String? moduleIdPk;
  String? topicCnt;
  List<String>? topicIds; // Changed to List<String> to hold multiple topic_ids
  String? accessCode;
  String? activityCode;
  String? manualIdFk;
  String? moduleSequence;

  Module({
    this.moduleName,
    this.moduleIdPk,
    this.topicCnt,
    this.topicIds,
    this.accessCode,
    this.activityCode,
    this.manualIdFk,
    this.moduleSequence,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      moduleName: json['module_name'],
      moduleIdPk: json['module_id_pk'],
      topicCnt: json['topic_cnt'],
      topicIds: json['topic_id'].split(','), // Splitting comma-separated ids
      accessCode: json['access_code'],
      activityCode: json['activity_code'],
      manualIdFk: json['manual_id_fk'],
      moduleSequence: json['module_sequeance'], // Corrected spelling
    );
  }
}

class ManualDetails {
  String? moduleName;
  int? topicCount;
  List<ModuleTopic>? moduleTopics;

  ManualDetails({
    this.moduleName,
    this.topicCount,
    this.moduleTopics,
  });

  factory ManualDetails.fromJson(Map<String, dynamic> json) {
    return ManualDetails(
      moduleName: json['module_name'],
      topicCount: json['topic_count'],
      moduleTopics: json['module_topics'] != null
          ? List<ModuleTopic>.from(
              json['module_topics'].map((x) => ModuleTopic.fromJson(x)))
          : [],
    );
  }
}

class ModuleTopic {
  String? topicIdEnc;
  String? topicId;
  String? topicName;
  String? tags;
  String? moduleIdFk;
  String? isVideo;

  ModuleTopic({
    this.topicIdEnc,
    this.topicId,
    this.topicName,
    this.tags,
    this.moduleIdFk,
    this.isVideo,
  });

  factory ModuleTopic.fromJson(Map<String, dynamic> json) {
    return ModuleTopic(
      topicIdEnc: json['topic_id_enc'],
      topicId: json['topic_id'],
      topicName: json['topic_name'],
      tags: json['tags'],
      moduleIdFk: json['module_id_fk'],
      isVideo: json['is_video'],
    );
  }
}
