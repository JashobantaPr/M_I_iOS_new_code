class SectionFile {
  final String fileType;
  final List<File> files;

  SectionFile({
    required this.fileType,
    required this.files,
  });

  factory SectionFile.fromJson(Map<String, dynamic> json) {
    return SectionFile(
      fileType: json['file_type'],
      files: (json['files'] as List).map((fileJson) => File.fromJson(fileJson)).toList(),
    );
  }
}

class File {
  final String fileType;
  final String videoThumbUrl;
  final String videoSrc;
  final bool isDownload;
  final String fileId;
  final String subSectionId;
  final String documentName;
  final String docSize;
  final String createdDate;

  File({
    required this.fileType,
    required this.videoThumbUrl,
    required this.videoSrc,
    required this.isDownload,
    required this.fileId,
    required this.subSectionId,
    required this.documentName,
    required this.docSize,
    required this.createdDate,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      fileType: json['file_type'],
      videoThumbUrl: json['video_thumb_url'],
      videoSrc: json['video_src'],
      isDownload: json['is_download'],
      fileId: json['file_id'],
      subSectionId: json['sub_section_id'],
      documentName: json['document_name'],
      docSize: json['doc_size'],
      createdDate: json['created_date'],
    );
  }
}

class ApiResponse {
  final bool status;
  final List<SectionFile> sectionFiles;

  ApiResponse({
    required this.status,
    required this.sectionFiles,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      sectionFiles: (json['section_files'] as List).map((sectionFileJson) => SectionFile.fromJson(sectionFileJson)).toList(),
    );
  }
}
