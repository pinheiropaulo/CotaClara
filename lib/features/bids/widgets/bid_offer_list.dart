import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_config.dart';
import 'package:cota_clara/features/bids/models/bid_history_item.dart';
import 'package:cota_clara/features/bids/widgets/bid_modality_card.dart';
import 'package:cota_clara/features/bids/widgets/bid_recent_history_section.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/app_quota_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BidOfferList extends StatelessWidget {
  final QuotaOverview currentQuota;
  final BidConfig bidConfig;

  const BidOfferList({
    super.key,
    required this.currentQuota,
    required this.bidConfig,
  });

  @override
  Widget build(BuildContext context) {
    final valueStr = currentQuota.creditValue
        .replaceAll('R\$ ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');
    final creditValueAsDouble = double.tryParse(valueStr) ?? 80000.0;

    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );

    // Lógica do Lance Livre
    final maxEmbeddedFree = currentQuota.category == QuotaCategory.property
        ? 50.0
        : 25.0;
    final freeAmount = creditValueAsDouble * 0.2;
    final freeEmbeddedAmount = freeAmount > (freeAmount * maxEmbeddedFree / 100)
        ? (freeAmount * maxEmbeddedFree / 100)
        : freeAmount;
    final freeOwnResourcesAmount = freeAmount - freeEmbeddedAmount;

    final formattedFixedAmount = formatter.format(bidConfig.amount);
    final formattedFreeAmount = formatter.format(freeAmount);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
      children: [
        const Text(
          'Selecione a modalidade de lance para sua cota.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        AppQuotaSummaryCard(
          quota: currentQuota,
          showIcon: true,
          showStatusBadge: true,
          showCreditValue: true,
        ),
        const SizedBox(height: 32),
        const Text(
          'Escolha o tipo de lance',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        BidModalityCard(
          title: 'Lance Fixo',
          badgeText: '${bidConfig.percentage.toInt()}% da cota',
          description: 'Percentual definido conforme as regras do grupo.',
          metricLabel: 'Valor correspondente',
          metricValue: formattedFixedAmount,
          isMetricPrimaryColor: true,
          buttonText: 'Selecionar Lance Fixo',
          isPrimaryButton: true,
          onSelect: () {
            context.push(
              AppRoutes.bidConfigure,
              extra: bidConfig,
            );
          },
        ),
        const SizedBox(height: 16),
        BidModalityCard(
          title: 'Lance Livre',
          badgeText: 'Personalizável',
          description: 'Você define o percentual ou valor que deseja ofertar.',
          metricLabel: 'Faixa de oferta',
          metricValue: 'A partir de $formattedFreeAmount',
          isMetricPrimaryColor: false,
          buttonText: 'Selecionar Lance Livre',
          isPrimaryButton: false,
          onSelect: () {
            context.push(
              AppRoutes.bidConfigure,
              extra: bidConfig.copyWith(
                modality: 'Lance Livre',
                percentage: 20.0,
                amount: freeAmount,
                embeddedAmount: freeEmbeddedAmount,
                ownResourcesAmount: freeOwnResourcesAmount,
                maxEmbeddedPercentageOfBid: maxEmbeddedFree,
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        FutureBuilder<List<BidHistoryItem>>(
          future: MockApi.instance.getBidHistory(currentQuota.id),
          builder: (context, snapshotHistory) {
            if (!snapshotHistory.hasData || snapshotHistory.data!.isEmpty) {
              return const SizedBox.shrink();
            }
            return BidRecentHistorySection(
              items: snapshotHistory.data!,
              onViewHistoryPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Histórico detalhado de assembleias anteriores.',
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
