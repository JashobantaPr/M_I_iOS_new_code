/// This class defines the variables used in the [iphone_13_mini_ten_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationModel {
  String notiHistoryIdPk;
  String cmsCompanyIdFk;
  String cmsUserIdFk;
  String title;
  String message;
  String status;
  String userSeen;
  String createdAt;

  NotificationModel({
    required this.notiHistoryIdPk,
    required this.cmsCompanyIdFk,
    required this.cmsUserIdFk,
    required this.title,
    required this.message,
    required this.status,
    required this.userSeen,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notiHistoryIdPk: json['noti_history_id_pk'],
      cmsCompanyIdFk: json['cms_company_id_fk'],
      cmsUserIdFk: json['cms_user_id_fk'],
      title: json['title'],
      message: json['message'],
      status: json['status'],
      userSeen: json['user_seen'],
      createdAt: json['created_at'],
    );
  }

  @override
  String toString() {
    return 'Noti History ID: $notiHistoryIdPk, Company ID: $cmsCompanyIdFk, User ID: $cmsUserIdFk, Title: $title, Message: $message, Status: $status, Seen: $userSeen, Created At: $createdAt';
  }
}

