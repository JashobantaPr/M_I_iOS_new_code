class Transaction {
  final String transactionId;
  final String campaignName;
  final DateTime date;
  final DateTime expiryDate;

  Transaction({
    required this.transactionId,
    required this.campaignName,
    required this.date,
    required this.expiryDate,
  });
}
