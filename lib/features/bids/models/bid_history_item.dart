class BidHistoryItem {
  final String id;
  final String date;
  final String title; // ex: 'Lance Fixo 40%'
  final double amount;
  final String status; // ex: 'Em análise', 'Não contemplado', 'Contemplado'

  const BidHistoryItem({
    required this.id,
    required this.date,
    required this.title,
    required this.amount,
    required this.status,
  });
}
