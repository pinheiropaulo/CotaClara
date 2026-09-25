enum StatementEntryType { payment, adjustment, refund }

class StatementEntry {
  const StatementEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.amount,
    required this.type,
    required this.isPositive,
  });

  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String amount;
  final StatementEntryType type;
  final bool isPositive;
}

class StatementMonthGroup {
  const StatementMonthGroup({
    required this.monthYear,
    required this.entries,
  });

  final String monthYear;
  final List<StatementEntry> entries;
}
