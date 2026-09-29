import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_history_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BidRecentHistorySection extends StatelessWidget {
  final List<BidHistoryItem> items;
  final VoidCallback? onViewHistoryPressed;

  const BidRecentHistorySection({
    super.key,
    required this.items,
    this.onViewHistoryPressed,
  });

  Color _getStatusTextColor(String status) {
    if (status == 'Em análise') return AppColors.warning;
    if (status == 'Contemplado') return AppColors.success;
    return AppColors.textDisabled; // Não contemplado
  }

  Color _getStatusBgColor(String status) {
    if (status == 'Em análise') return AppColors.warningContainer;
    if (status == 'Contemplado') return AppColors.successContainer;
    return AppColors.surfaceElevated;
  }

  Color _getStatusBorderColor(String status) {
    if (status == 'Em análise') return AppColors.warning.withAlpha(50);
    if (status == 'Contemplado') return AppColors.success.withAlpha(50);
    return AppColors.border;
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Lances recentes',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (onViewHistoryPressed != null)
              InkWell(
                onTap: onViewHistoryPressed,
                borderRadius: BorderRadius.circular(4),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  child: Row(
                    children: [
                      Text(
                        'Ver histórico',
                        style: TextStyle(
                          color: AppColors.accentBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.chevron_right,
                        size: 14,
                        color: AppColors.accentBlue,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item.date,
                            style: const TextStyle(
                              color: AppColors.textDisabled,
                              fontSize: 12,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              '•',
                              style: TextStyle(
                                color: AppColors.border,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Text(
                            item.title,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatter.format(item.amount),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
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
                      color: _getStatusBgColor(item.status),
                      borderRadius: BorderRadius.circular(9999),
                      border: Border.all(
                        color: _getStatusBorderColor(item.status),
                      ),
                    ),
                    child: Text(
                      item.status,
                      style: TextStyle(
                        color: _getStatusTextColor(item.status),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
