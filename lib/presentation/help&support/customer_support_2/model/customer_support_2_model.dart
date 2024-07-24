class TicketCategory {
  final String categoryName;

  TicketCategory({
    required this.categoryName,
  });

  factory TicketCategory.fromJson(Map<String, dynamic> json) {
    return TicketCategory(
      categoryName: json['category_name'],
    );
  }

  static List<TicketCategory> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((category) => TicketCategory.fromJson(category)).toList();
  }
}
