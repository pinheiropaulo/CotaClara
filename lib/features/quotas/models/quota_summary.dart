import 'package:cota_clara/features/quotas/models/quota_overview.dart';

class QuotaSummary {
  const QuotaSummary._({required this.active, required this.underReview});

  factory QuotaSummary.fromQuotas(Iterable<QuotaOverview> quotas) {
    var active = 0;
    var underReview = 0;

    for (final quota in quotas) {
      switch (quota.status) {
        case QuotaStatus.active:
          active++;
        case QuotaStatus.underReview:
          underReview++;
      }
    }

    return QuotaSummary._(active: active, underReview: underReview);
  }

  final int active;
  final int underReview;

  int get total => active + underReview;

  String get description {
    if (total == 0) return 'Nenhuma cota';

    return [
      if (active > 0) '$active ${active == 1 ? 'ativa' : 'ativas'}',
      if (underReview > 0) '$underReview em análise',
    ].join(' · ');
  }
}
