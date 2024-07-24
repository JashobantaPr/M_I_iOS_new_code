class ActiveCampaigns {
  String? programStatusId;
  String? createdAt;
  String? bannerUrl;
  String? description;
  String? owner;
  String? programId;
  String? name;
  String? programCode;
  String? users;
  String? campaignMode;
  String? startDate;
  String? endDate;

  ActiveCampaigns({
    this.programStatusId,
    this.createdAt,
    this.bannerUrl,
    this.description,
    this.owner,
    this.programId,
    this.name,
    this.programCode,
    this.users,
    this.campaignMode,
    this.startDate,
    this.endDate,
  });

  factory ActiveCampaigns.fromJson(Map<String, dynamic>? json) {
    return ActiveCampaigns(
      programStatusId: json?['program_status_id'] ?? '',
      createdAt: json?['created_at'] ?? '',
      bannerUrl: json?['banner_url'] ?? '',
      description: json?['description'] ?? 'No description available',
      owner: json?['owner'] ?? 'Unknown',
      programId: json?['program_id'] ?? '',
      name: json?['name'] ?? 'Unknown',
      programCode: json?['program_code'] ?? '',
      users: json?['users'] ?? 'Unknown',
      campaignMode: json?['campign_mode'] ?? '',
      startDate: json?['start_date'] ?? '',
      endDate: json?['end_date'] ?? '',
    );
  }
}
