import 'package:cota_clara/features/quotas/models/quota_overview.dart';

class QuotaSummary {
  const QuotaSummary._({
    required this.active,
    required this.underReview,
    required this.blocked,
  });

  factory QuotaSummary.fromQuotas(Iterable<QuotaOverview> quotas) {
    var active = 0;
    var underReview = 0;
    var blocked = 0;

    for (final quota in quotas) {
      switch (quota.status) {
        case QuotaStatus.active:
          active++;
        case QuotaStatus.underReview:
          underReview++;
        case QuotaStatus.blocked:
          blocked++;
      }
    }

    return QuotaSummary._(
      active: active,
      underReview: underReview,
      blocked: blocked,
    );
  }

  final int active;
  final int underReview;
  final int blocked;

  int get total => active + underReview + blocked;

  String get description {
    if (total == 0) return 'Nenhuma cota';

    return [
      if (active > 0) ' ',
      if (underReview > 0) ' em análise',
      if (blocked > 0) ' bloqueada',
    ].join(' • ');
  }
}
