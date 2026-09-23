enum InstallmentStatus { pending, paid, overdue }

enum InstallmentFilter {
  all('Todas'),
  pending('Pendentes'),
  paid('Pagas'),
  overdue('Vencidas');

  const InstallmentFilter(this.label);

  final String label;

  bool accepts(Installment installment) {
    return switch (this) {
      InstallmentFilter.all => true,
      InstallmentFilter.pending =>
        installment.status == InstallmentStatus.pending,
      InstallmentFilter.paid => installment.status == InstallmentStatus.paid,
      InstallmentFilter.overdue =>
        installment.status == InstallmentStatus.overdue,
    };
  }
}

class Installment {
  const Installment({
    required this.month,
    required this.number,
    required this.total,
    required this.status,
    required this.valueLabel,
    required this.value,
    required this.dateLabel,
    required this.actionLabel,
  });

  final String month;
  final int number;
  final int total;
  final InstallmentStatus status;
  final String valueLabel;
  final String value;
  final String dateLabel;
  final String actionLabel;
}
