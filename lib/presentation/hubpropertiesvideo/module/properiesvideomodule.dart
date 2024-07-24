class Document {
  final String? docType;
  final String? documentName;
  final String? section;
  final String? subSection;
  final String? uploadedOn;
  final String? uploadedBy;
  final String? documentSize;
  final String? scopes;
  final String? description;
  final String? dependencies;

  Document({
    this.docType,
    this.documentName,
    this.section,
    this.subSection,
    this.uploadedOn,
    this.uploadedBy,
    this.documentSize,
    this.scopes,
    this.description,
    this.dependencies,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      docType: json['doc_type'],
      documentName: json['document_name'],
      section: json['section'],
      subSection: json['sub_section'],
      uploadedOn: json['uploaded_on'],
      uploadedBy: json['uploaded_by'],
      documentSize: json['document_size'],
      scopes: json['scopes'],
      description: json['des'],
      dependencies: json['deps'],
    );
  }
}
