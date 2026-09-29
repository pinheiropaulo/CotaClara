class BidConfig {
  final String modality; // 'Lance Fixo' ou 'Lance Livre'
  final double percentage; // ex: 40.0
  final double amount; // ex: 32000.00
  final double creditAmount; // ex: 80000.00
  final String quotaIdentifier; // ex: 'Cota 6503   Grupo 012160'
  final String paymentMethod; // 'lance_embutido' ou 'recursos_proprios'
  final double embeddedAmount; // ex: 32000.00
  final double ownResourcesAmount; // ex: 0.00
  final double maxEmbeddedPercentageOfBid;

  const BidConfig({
    this.modality = 'Lance Fixo',
    this.percentage = 40.0,
    this.amount = 32000.0,
    this.creditAmount = 80000.0,
    this.quotaIdentifier = 'Cota 6503   Grupo 012160',
    this.paymentMethod = 'lance_embutido',
    this.embeddedAmount = 32000.0,
    this.ownResourcesAmount = 0.0,
    this.maxEmbeddedPercentageOfBid = 100.0,
  });

  BidConfig copyWith({
    String? modality,
    double? percentage,
    double? amount,
    double? creditAmount,
    String? quotaIdentifier,
    String? paymentMethod,
    double? embeddedAmount,
    double? ownResourcesAmount,
    double? maxEmbeddedPercentageOfBid,
  }) {
    return BidConfig(
      modality: modality ?? this.modality,
      percentage: percentage ?? this.percentage,
      amount: amount ?? this.amount,
      creditAmount: creditAmount ?? this.creditAmount,
      quotaIdentifier: quotaIdentifier ?? this.quotaIdentifier,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      embeddedAmount: embeddedAmount ?? this.embeddedAmount,
      ownResourcesAmount: ownResourcesAmount ?? this.ownResourcesAmount,
      maxEmbeddedPercentageOfBid:
          maxEmbeddedPercentageOfBid ?? this.maxEmbeddedPercentageOfBid,
    );
  }
}
