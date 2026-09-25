enum QuotaCategory {
  property('Imóvel'),
  vehicle('Veículo'),
  services('Serviços');

  const QuotaCategory(this.label);

  final String label;
}

enum QuotaStatus { active, underReview }

class QuotaOverview {
  const QuotaOverview({
    required this.category,
    required this.title,
    required this.group,
    required this.number,
    required this.creditValue,
    required this.dueDate,
    required this.status,
    this.duration = '180 meses',
    this.isContemplated = false,
  });

  final QuotaCategory category;
  final String title;
  final String group;
  final String number;
  final String creditValue;
  final String dueDate;
  final QuotaStatus status;
  final String duration;
  final bool isContemplated;
}
