class TicketSummary {
  int? total;
  int? open;
  int? closed;
  int? onhold;

  TicketSummary({
    this.total,
    this.open,
    this.closed,
    this.onhold,
  });

  factory TicketSummary.fromJson(Map<String, dynamic> json) {
    return TicketSummary(
      total: json['total'] != null ? int.parse(json['total'].toString()) : 0,
      open: json['open'] != null ? int.parse(json['open'].toString()) : 0,
      closed: json['closed'] != null ? int.parse(json['closed'].toString()) : 0,
      onhold: json['onhold'] != null ? int.parse(json['onhold'].toString()) : 0,
    );
  }
}
