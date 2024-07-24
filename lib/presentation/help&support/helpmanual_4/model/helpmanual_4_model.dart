

// Define the model classes

class ApiResponse {
  final Manual manual;
  final List<Module> modules;
  final bool status;
  final List<SearchContent> searchContent;

  ApiResponse({
    required this.manual,
    required this.modules,
    required this.status,
    required this.searchContent,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      manual: Manual.fromJson(json['manual']),
      modules: (json['modules'] as List).map((i) => Module.fromJson(i)).toList(),
      status: json['status'],
      searchContent: (json['search_content'] as List).map((i) => SearchContent.fromJson(i)).toList(),
    );
  }
}

class Manual {
  final String manualIdPk;
  final String manualTitle;
  final String? manualVersion;
  final String productIdFk;

  Manual({
    required this.manualIdPk,
    required this.manualTitle,
    this.manualVersion,
    required this.productIdFk,
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
  final String moduleName;
  final String moduleIdPk;
  final String topicCnt;
  final String topicId;
  final String accessCode;
  final String activityCode;
  final String manualIdFk;
  final String moduleSequeance;

  Module({
    required this.moduleName,
    required this.moduleIdPk,
    required this.topicCnt,
    required this.topicId,
    required this.accessCode,
    required this.activityCode,
    required this.manualIdFk,
    required this.moduleSequeance,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      moduleName: json['module_name'],
      moduleIdPk: json['module_id_pk'],
      topicCnt: json['topic_cnt'],
      topicId: json['topic_id'],
      accessCode: json['access_code'],
      activityCode: json['activity_code'],
      manualIdFk: json['manual_id_fk'],
      moduleSequeance: json['module_sequeance'],
    );
  }
}

class SearchContent {
  final String moduleName;
  final String moduleIdPk;
  final Map<String, Topic> modulesTopic;

  SearchContent({
    required this.moduleName,
    required this.moduleIdPk,
    required this.modulesTopic,
  });

  factory SearchContent.fromJson(Map<String, dynamic> json) {
    return SearchContent(
      moduleName: json['module_name'],
      moduleIdPk: json['module_id_pk'],
      modulesTopic: (json['modules_topic'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Topic.fromJson(value)),
      ),
    );
  }
}

class Topic {
  final String moduleName;
  final String moduleIdPk;
  final String topicIdPk;
  final String tags;
  final String topicName;
  final String topicContent;
  final String moduleSequeance;

  Topic({
    required this.moduleName,
    required this.moduleIdPk,
    required this.topicIdPk,
    required this.tags,
    required this.topicName,
    required this.topicContent,
    required this.moduleSequeance,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      moduleName: json['module_name'],
      moduleIdPk: json['module_id_pk'],
      topicIdPk: json['topic_id_pk'],
      tags: json['tags'],
      topicName: json['topic_name'],
      topicContent: json['topic_content'],
      moduleSequeance: json['module_sequeance'],
    );
  }
}
