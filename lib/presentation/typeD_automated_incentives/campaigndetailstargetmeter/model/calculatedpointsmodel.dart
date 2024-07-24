class Employee {
  String? id;
  String? userId;
  String? employeeId;
  String? emailId;
  String? countryCode;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? departmentName;
  String? designationName;
  String? cmsUserId;
  String? emailId1;
  int? employeeId1;
  String? phoneNumber1;
  int? totalRevenue1;
  double? quarterIncentives1;
  int? incentivesPayout;
  int? actionVal;
  String? errorMessage;
  String? payoutStatus;

  Employee({
    this.id,
    this.userId,
    this.employeeId,
    this.emailId,
    this.countryCode,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.departmentName,
    this.designationName,
    this.cmsUserId,
    this.emailId1,
    this.employeeId1,
    this.phoneNumber1,
    this.totalRevenue1,
    this.quarterIncentives1,
    this.incentivesPayout,
    this.actionVal,
    this.errorMessage,
    this.payoutStatus,
  });

  factory Employee.fromJson(
      Map<String, dynamic> json, String companyId, String programCode) {
    String prefix = 'sys_${companyId}_${programCode.toLowerCase()}_';
    return Employee(
      id: json['_id'],
      userId: json['${prefix}User_ID_1'],
      employeeId: json['${prefix}employee_id'],
      emailId: json['${prefix}email_id'],
      countryCode: json['${prefix}country_code'],
      phoneNumber: json['${prefix}phone_number'],
      firstName: json['${prefix}first_name'],
      lastName: json['${prefix}last_name'],
      departmentName: json['${prefix}department_name'],
      designationName: json['${prefix}designation_name'],
      cmsUserId: json['${prefix}cms_user_id'],
      emailId1: json['sys_80_email_id_1'],
      employeeId1: json['sys_80_employee_id_1'] is String
          ? int.tryParse(json['sys_80_employee_id_1'])
          : json['sys_80_employee_id_1'],
      phoneNumber1: json['sys_80_phone_number_1'],
      totalRevenue1: json['sys_80_total_revenue_1'] is String
          ? int.tryParse(json['sys_80_total_revenue_1'])
          : json['sys_80_total_revenue_1'],
      quarterIncentives1:
          (json['sys_80_quarter_incentives_1'] as num?)?.toDouble(),
      incentivesPayout: json['${prefix}incentives_payout'] is String
          ? int.tryParse(json['${prefix}incentives_payout'])
          : json['${prefix}incentives_payout'],
      actionVal: json['action_val'] is String
          ? int.tryParse(json['action_val'])
          : json['action_val'],
      errorMessage: json['error_message'],
      payoutStatus: json['payout_status'],
    );
  }
}
