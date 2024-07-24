import 'dart:convert';

TicketDetailsResponse ticketDetailsResponseFromJson(String str) =>
    TicketDetailsResponse.fromJson(json.decode(str));

String ticketDetailsResponseToJson(TicketDetailsResponse data) =>
    json.encode(data.toJson());

class TicketDetailsResponse {
  TicketDetailsResponse({
    required this.status,
    required this.ticketDetails,
  });

  final bool status;
  final TicketDetails? ticketDetails;

  factory TicketDetailsResponse.fromJson(Map<String, dynamic> json) =>
      TicketDetailsResponse(
        status: json["status"] ?? false,
        ticketDetails: json["ticket_details"] != null
            ? TicketDetails.fromJson(json["ticket_details"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "ticket_details": ticketDetails?.toJson(),
      };
}

class TicketDetails {
  TicketDetails({
    required this.contactId,
    required this.ticketId,
    required this.subject,
    required this.requesterName,
    required this.assigneeName,
    required this.status,
    required this.category,
    required this.email,
    required this.priority,
    required this.description,
    required this.attachmentCount,
    required this.phone,
    required this.ticketid,
    required this.dueDate,
    required this.closedDate,
    required this.createdDate,
    required this.attachment,
  });

  final String contactId;
  final String ticketId;
  final String subject;
  final String requesterName;
  final String assigneeName;
  final String status;
  final String category;
  final String email;
  final String priority;
  final String description;
  final String attachmentCount;
  final String phone;
  final String ticketid;
  final String dueDate;
  final String closedDate;
  final String createdDate;
  final List<Attachment> attachment;

  factory TicketDetails.fromJson(Map<String, dynamic> json) => TicketDetails(
        contactId: json["contactId"] ?? '',
        ticketId: json["ticket_id"] ?? '',
        subject: json["subject"] ?? '',
        requesterName: json["requester_name"] ?? '',
        assigneeName: json["assignee_name"] ?? '',
        status: json["status"] ?? '',
        category: json["category"] ?? '',
        email: json["email"] ?? '',
        priority: json["priority"] ?? '',
        description: json["description"] ?? '',
        attachmentCount: json["attachmentCount"] ?? '',
        phone: json["phone"] ?? '',
        ticketid: json["ticketid"] ?? '',
        dueDate: json["due_date"] ?? '',
        closedDate: json["closed_date"] ?? '',
        createdDate: json["created_date"] ?? '',
        attachment: json["attachment"] != null
            ? List<Attachment>.from(
                json["attachment"].map((x) => Attachment.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "contactId": contactId,
        "ticket_id": ticketId,
        "subject": subject,
        "requester_name": requesterName,
        "assignee_name": assigneeName,
        "status": status,
        "category": category,
        "email": email,
        "priority": priority,
        "description": description,
        "attachmentCount": attachmentCount,
        "phone": phone,
        "ticketid": ticketid,
        "due_date": dueDate,
        "closed_date": closedDate,
        "created_date": createdDate,
        "attachment": List<dynamic>.from(attachment.map((x) => x.toJson())),
      };
}

class Attachment {
  Attachment({
    required this.id,
    required this.creatorId,
    required this.name,
    required this.size,
    required this.isPublic,
    required this.createdTime,
    this.previewurl,
    required this.href,
  });

  final String id;
  final String creatorId;
  final String name;
  final String size;
  final bool isPublic;
  final String createdTime;
  final String? previewurl;
  final String href;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"] ?? '',
        creatorId: json["creatorId"] ?? '',
        name: json["name"] ?? '',
        size: json["size"] ?? '',
        isPublic: json["isPublic"] ?? false,
        createdTime: json["createdTime"] ?? '',
        previewurl: json["previewurl"],
        href: json["href"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "creatorId": creatorId,
        "name": name,
        "size": size,
        "isPublic": isPublic,
        "createdTime": createdTime,
        "previewurl": previewurl,
        "href": href,
      };
}
