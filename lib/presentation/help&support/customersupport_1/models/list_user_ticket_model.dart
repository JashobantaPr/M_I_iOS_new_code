class UserTicket {
  int srNo;
  String ticketId;
  String subject;
  String ticketNumber;
  String status;
  String assignee;
  String createdDate;
  String action;

  UserTicket({
    required this.srNo,
    required this.ticketId,
    required this.subject,
    required this.ticketNumber,
    required this.status,
    required this.assignee,
    required this.createdDate,
    required this.action,
  });

  factory UserTicket.fromJson(Map<String, dynamic> json) {
    return UserTicket(
      srNo: json['sr_no'],
      ticketId: json['ticket_id'],
      subject: json['subject'],
      ticketNumber: json['ticket_number'],
      status: json['status'],
      assignee: json['assignee'],
      createdDate: json['created_date'],
      action: json['action'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sr_no': srNo,
      'ticket_id': ticketId,
      'subject': subject,
      'ticket_number': ticketNumber,
      'status': status,
      'assignee': assignee,
      'created_date': createdDate,
      'action': action,
    };
  }
}
