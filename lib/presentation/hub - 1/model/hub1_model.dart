import 'dart:convert';

// Model for File
class File {
  final String fileType;
  final String pdfFileName;
  final String pdfIcon;
  final bool isDownload;
  final String fileId;
  final String subSectionId;
  final String documentName;
  final String docSize;
  final String createdDate;
  final String videoThumbUrl;
  final String videoSrc;

  File({
    required this.fileType,
    required this.pdfFileName,
    required this.pdfIcon,
    required this.isDownload,
    required this.fileId,
    required this.subSectionId,
    required this.documentName,
    required this.docSize,
    required this.createdDate,
    required this.videoThumbUrl,
    required this.videoSrc,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      fileType: json['file_type'],
      pdfFileName: json['pdf_file_name'] ?? '',
      pdfIcon: json['pdf_icon'] ?? '',
      isDownload: json['is_download'],
      fileId: json['file_id'],
      subSectionId: json['sub_section_id'],
      documentName: json['document_name'],
      docSize: json['doc_size'],
      createdDate: json['created_date'],
      videoThumbUrl: json['video_thumb_url'] ?? '',
      videoSrc: json['video_src'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file_type': fileType,
      'pdf_file_name': pdfFileName,
      'pdf_icon': pdfIcon,
      'is_download': isDownload,
      'file_id': fileId,
      'sub_section_id': subSectionId,
      'document_name': documentName,
      'doc_size': docSize,
      'created_date': createdDate,
      'video_thumb_url': videoThumbUrl,
      'video_src': videoSrc,
    };
  }
}

// Model for SectionDetail
class SectionDetail {
  final String hubSectionIdPk;
  final String sectionName;
  final String sectionSequence;
  final String sectionParentId;

  SectionDetail({
    required this.hubSectionIdPk,
    required this.sectionName,
    required this.sectionSequence,
    required this.sectionParentId,
  });

  factory SectionDetail.fromJson(Map<String, dynamic> json) {
    return SectionDetail(
      hubSectionIdPk: json['hub_section_id_pk'],
      sectionName: json['section_name'],
      sectionSequence: json['section_sequance'],
      sectionParentId: json['section_parent_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hub_section_id_pk': hubSectionIdPk,
      'section_name': sectionName,
      'section_sequance': sectionSequence,
      'section_parent_id': sectionParentId,
    };
  }
}

// Model for ApiResponse
class ApiResponse {
  final bool status;
  final SectionDetail sectionDetail;
  final List<Map<String, dynamic>> sectionFiles;
  final List<String> years;

  ApiResponse({
    required this.status,
    required this.sectionDetail,
    required this.sectionFiles,
    required this.years,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> filesJson = [];
    if (json['section_files'] != null) {
      filesJson = List<Map<String, dynamic>>.from(json['section_files']);
    }

    List<String> years = [];
    if (json['years'] != null) {
      years = List<String>.from(json['years']);
    }

    return ApiResponse(
      status: json['status'],
      sectionDetail: SectionDetail.fromJson(json['section_detail']),
      sectionFiles: filesJson,
      years: years,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'section_detail': sectionDetail.toJson(),
      'section_files': sectionFiles,
      'years': years,
    };
  }
}

// Usage example

