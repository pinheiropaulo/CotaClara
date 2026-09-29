import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BidModalityCard extends StatelessWidget {
  final String title;
  final String badgeText;
  final String description;
  final String metricLabel;
  final String metricValue;
  final bool isMetricPrimaryColor;
  final String buttonText;
  final bool isPrimaryButton;
  final VoidCallback onSelect;

  const BidModalityCard({
    super.key,
    required this.title,
    required this.badgeText,
    required this.description,
    required this.metricLabel,
    required this.metricValue,
    this.isMetricPrimaryColor = false,
    required this.buttonText,
    this.isPrimaryButton = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isPrimaryButton
                      ? AppColors.accentBlue.withAlpha(30)
                      : AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isPrimaryButton
                        ? AppColors.accentBlue.withAlpha(50)
                        : AppColors.border,
                  ),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    color: isPrimaryButton
                        ? AppColors.accentBlue
                        : AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  metricLabel,
                  style: const TextStyle(
                    color: AppColors.textDisabled,
                    fontSize: 12,
                  ),
                ),
                Text(
                  metricValue,
                  style: TextStyle(
                    color: isMetricPrimaryColor
                        ? AppColors.primary
                        : AppColors.textPrimary,
                    fontSize: isMetricPrimaryColor ? 20 : 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: onSelect,
              style: ElevatedButton.styleFrom(
                backgroundColor: isPrimaryButton
                    ? AppColors.primary
                    : AppColors.surfaceElevated,
                foregroundColor: isPrimaryButton
                    ? AppColors.onPrimary
                    : AppColors.accentBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: isPrimaryButton
                      ? BorderSide.none
                      : const BorderSide(color: AppColors.border),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isPrimaryButton
                          ? FontWeight.w700
                          : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
