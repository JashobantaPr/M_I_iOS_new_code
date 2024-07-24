class LeaderData {
  final String count;

  LeaderData({required this.count});

  factory LeaderData.fromJson(Map<String, dynamic> json) {
    return LeaderData(count: json['count']);
  }
}
