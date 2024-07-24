import 'dart:convert';

// Model for SubSection
class SubSection {
  final String hubSectionIdPk;
  final String sectionName;
  final String sectionSequence;
  final String sectionParentId;
  final int subMenuCnt;

  SubSection({
    required this.hubSectionIdPk,
    required this.sectionName,
    required this.sectionSequence,
    required this.sectionParentId,
    required this.subMenuCnt,
  });

  factory SubSection.fromJson(Map<String, dynamic> json) {
    return SubSection(
      hubSectionIdPk: json['hub_section_id_pk'],
      sectionName: json['section_name'],
      sectionSequence: json['section_sequance'],
      sectionParentId: json['section_parent_id'],
      subMenuCnt: json['sub_menu_cnt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hub_section_id_pk': hubSectionIdPk,
      'section_name': sectionName,
      'section_sequance': sectionSequence,
      'section_parent_id': sectionParentId,
      'sub_menu_cnt': subMenuCnt,
    };
  }
}

// Model for Section
class Section {
  final String hubSectionIdPk;
  final String sectionName;
  final String sectionSequence;
  final String sectionParentId;
  final List<SubSection> subSection;
  final int subMenuCnt;

  Section({
    required this.hubSectionIdPk,
    required this.sectionName,
    required this.sectionSequence,
    required this.sectionParentId,
    required this.subSection,
    required this.subMenuCnt,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    var list = json['sub_section'] as List;
    List<SubSection> subSectionList = list.map((i) => SubSection.fromJson(i)).toList();

    return Section(
      hubSectionIdPk: json['hub_section_id_pk'],
      sectionName: json['section_name'],
      sectionSequence: json['section_sequance'],
      sectionParentId: json['section_parent_id'],
      subSection: subSectionList,
      subMenuCnt: json['sub_menu_cnt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hub_section_id_pk': hubSectionIdPk,
      'section_name': sectionName,
      'section_sequance': sectionSequence,
      'section_parent_id': sectionParentId,
      'sub_section': subSection.map((i) => i.toJson()).toList(),
      'sub_menu_cnt': subMenuCnt,
    };
  }
}

// Model for the entire response
class ApiResponse {
  final bool status;
  final List<Section> section;

  ApiResponse({
    required this.status,
    required this.section,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['section'] as List;
    List<Section> sectionList = list.map((i) => Section.fromJson(i)).toList();

    return ApiResponse(
      status: json['status'],
      section: sectionList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'section': section.map((i) => i.toJson()).toList(),
    };
  }
}

// Example usage

