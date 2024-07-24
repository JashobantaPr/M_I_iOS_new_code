class ProgramResponse {
  final bool? status;
  final Msg? msg;

  ProgramResponse({this.status, this.msg});

  factory ProgramResponse.fromJson(Map<String, dynamic> json) {
    return ProgramResponse(
      status: json['status'],
      msg: json['msg'] != null ? Msg.fromJson(json['msg']) : null,
    );
  }
}

class Msg {
  final List<TableColumn> tableColumns;
  final Map<String, dynamic> tableColumns1;

  Msg({
    required this.tableColumns,
    required this.tableColumns1,
  });

  factory Msg.fromJson(Map<String, dynamic> json) {
    List<TableColumn> columns = [];
    if (json['table_columns'] != null) {
      json['table_columns'].forEach((columnJson) {
        columns.add(TableColumn.fromJson(columnJson));
      });
    }
    return Msg(
      tableColumns: columns,
      tableColumns1: json['table_columns1'] ?? {},
    );
  }
}

class TableColumn {
  final String? colDisplayName;
  final String? colDescription;
  final String? isMandatory;
  final String? isUnique;
  final String? colDataType;
  final String? colFormat;
  final String? tableType;
  final String? colSchemaName;
  final String? colType;
  final String? behavior;
  final String? columnSchemaName2;
  final String? table2SchemaName;
  final List<String>? dependentTableName;

  TableColumn({
    this.colDisplayName,
    this.colDescription,
    this.isMandatory,
    this.isUnique,
    this.colDataType,
    this.colFormat,
    this.tableType,
    this.colSchemaName,
    this.colType,
    this.behavior,
    this.columnSchemaName2,
    this.table2SchemaName,
    this.dependentTableName,
  });

  factory TableColumn.fromJson(Map<String, dynamic> json) {
    return TableColumn(
      colDisplayName: json['col_display_name'],
      colDescription: json['col_description'],
      isMandatory: json['is_mandatory'],
      isUnique: json['is_unique'],
      colDataType: json['col_data_type'],
      colFormat: json['col_format'],
      tableType: json['table_type'],
      colSchemaName: json['col_schema_name'],
      colType: json['col_type'],
      behavior: json['behavior'],
      columnSchemaName2: json['columnSchemaName2'],
      table2SchemaName: json['table2_schema_name'],
      dependentTableName: json['dependent_table_name'] != null
          ? List<String>.from(json['dependent_table_name'])
          : null,
    );
  }
}
