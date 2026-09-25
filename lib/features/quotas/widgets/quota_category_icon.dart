import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class QuotaCategoryIcon extends StatelessWidget {
  const QuotaCategoryIcon({required this.category, super.key});

  final QuotaCategory category;

  IconData get _icon => switch (category) {
    QuotaCategory.property => Icons.apartment,
    QuotaCategory.vehicle => Icons.directions_car_outlined,
    QuotaCategory.services => Icons.business_center_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Icon(_icon, color: AppColors.accentBlue, size: 22),
    );
  }
}
