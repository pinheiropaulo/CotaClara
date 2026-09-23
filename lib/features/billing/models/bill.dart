class Bill {
  const Bill({
    required this.month,
    required this.value,
    required this.dueDate,
    required this.installment,
    required this.displayCode,
    required this.copyCode,
  });

  final String month;
  final String value;
  final String dueDate;
  final String installment;
  final String displayCode;
  final String copyCode;
}
