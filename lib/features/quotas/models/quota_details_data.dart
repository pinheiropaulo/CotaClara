class QuotaDetailsData {
  const QuotaDetailsData({
    required this.quotaId,
    required this.contractedCreditValue,
    required this.currentCreditValue,
    required this.duration,
    required this.updatePercentage,
    required this.accumulatedUpdate,
    required this.lastUpdate,
    required this.completedInstallments,
    required this.totalInstallments,
    required this.paidAmount,
    required this.nextInstallmentValue,
    required this.nextInstallmentDueDate,
    required this.nextInstallmentStatus,
  });

  final String quotaId;
  final String contractedCreditValue;
  final String currentCreditValue;
  final String duration;
  final String updatePercentage;
  final String accumulatedUpdate;
  final String lastUpdate;
  final int completedInstallments;
  final int totalInstallments;
  final String paidAmount;
  final String nextInstallmentValue;
  final String nextInstallmentDueDate;
  final String nextInstallmentStatus;

  double get progress => completedInstallments / totalInstallments;

  String get progressLabel => '${(progress * 100).round()}% concluído';

  String get progressHeadline =>
      '$completedInstallments de $totalInstallments parcelas';

  String get remainingInstallments =>
      'Restam ${totalInstallments - completedInstallments} parcelas';
}
