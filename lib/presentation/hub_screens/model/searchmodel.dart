class SearchContent {
  final String fileType;
  final List<File> files;

  SearchContent({
    required this.fileType,
    required this.files,
  });

  factory SearchContent.fromJson(Map<String, dynamic> json) {
    return SearchContent(
      fileType: json['file_type'],
      files:
          (json['files'] as List).map((file) => File.fromJson(file)).toList(),
    );
  }
}

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
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      fileType: json['file_type'],
      pdfFileName: json['pdf_file_name'],
      pdfIcon: json['pdf_icon'],
      isDownload: json['is_download'],
      fileId: json['file_id'],
      subSectionId: json['sub_section_id'],
      documentName: json['document_name'],
      docSize: json['doc_size'],
      createdDate: json['created_date'],
    );
  }
}
