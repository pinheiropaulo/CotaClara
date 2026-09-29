import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BidReviewHeroCard extends StatelessWidget {
  final BidConfig config;

  const BidReviewHeroCard({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: '');
    final formattedValue = formatter.format(config.amount).trim();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.financialCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accentBlue.withAlpha(60),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.gavel,
                    size: 16,
                    color: AppColors.accentBlue,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'VALOR DA OFERTA',
                    style: TextStyle(
                      color: AppColors.accentBlue,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.successContainer,
                  borderRadius: BorderRadius.circular(9999),
                  border: Border.all(
                    color: AppColors.success.withAlpha(50),
                  ),
                ),
                child: Text(
                  '${config.modality} (${config.percentage.toInt()}%)',
                  style: const TextStyle(
                    color: AppColors.success,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Text(
                'R\$ ',
                style: TextStyle(
                  color: AppColors.accentBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                formattedValue,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Icon(
                Icons.home_work_outlined,
                size: 14,
                color: AppColors.accentBlue,
              ),
              SizedBox(width: 4),
              Text(
                'Cota de imóvel vinculada',
                style: TextStyle(
                  color: AppColors.accentBlue,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
