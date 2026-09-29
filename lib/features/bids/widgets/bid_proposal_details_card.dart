import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BidProposalDetailsCard extends StatelessWidget {
  final BidConfig config;

  const BidProposalDetailsCard({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    final formattedAmount = formatter.format(config.amount);
    final formattedCredit = formatter.format(config.creditAmount);
    final formattedEmbedded = formatter.format(config.embeddedAmount);
    final formattedOwnResources = formatter.format(config.ownResourcesAmount);

    final isEmbedded = config.paymentMethod == 'lance_embutido';
    final paymentLabel = isEmbedded
        ? 'Lance embutido (${((config.embeddedAmount / config.amount) * 100).toInt()}%)'
        : 'Recursos próprios';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Detalhes da proposta',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  config.quotaIdentifier,
                  style: const TextStyle(
                    color: AppColors.accentBlue,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.border, height: 1),

          _buildDetailRow(
            'Carta de crédito',
            formattedCredit,
            isBold: true,
          ),
          const Divider(color: AppColors.border, height: 1),

          _buildDetailRow(
            'Modalidade',
            '${config.modality} (${config.percentage.toInt()}%)',
          ),
          const Divider(color: AppColors.border, height: 1),

          _buildDetailRow(
            'Valor do lance',
            formattedAmount,
            valueColor: AppColors.textPrimary,
          ),
          const Divider(color: AppColors.border, height: 1),

          _buildDetailRow(
            'Forma de pagamento',
            paymentLabel,
            valueColor: isEmbedded ? AppColors.primary : AppColors.textPrimary,
          ),

          if (isEmbedded) ...[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.border.withAlpha(150),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Lance embutido',
                        style: TextStyle(
                          color: AppColors.textDisabled,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        formattedEmbedded,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recursos próprios',
                        style: TextStyle(
                          color: AppColors.textDisabled,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        formattedOwnResources,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          const Divider(color: AppColors.border, height: 1),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Assembleia',
                  style: TextStyle(
                    color: AppColors.textDisabled,
                    fontSize: 13,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '25 de set. de 2026',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'às 19:00h',
                      style: TextStyle(
                        color: AppColors.accentBlue,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textDisabled,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? AppColors.textPrimary,
              fontSize: 13,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
