import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../models/quota_overview.dart';

class QuotaFilters extends StatelessWidget {
  const QuotaFilters({
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onFilterPressed,
    super.key,
  });

  final QuotaCategory? selectedCategory;
  final ValueChanged<QuotaCategory?> onCategorySelected;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(color: AppColors.accentBlue, fontSize: 12),
                ),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  '3 cotas ativas',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Filtrar cotas',
                onPressed: onFilterPressed,
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.tune,
                  color: AppColors.accentBlue,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _FilterChip(
                  label: 'Todas',
                  selected: selectedCategory == null,
                  onPressed: () => onCategorySelected(null),
                ),
                for (final category in QuotaCategory.values) ...[
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: category.label,
                    selected: selectedCategory == category,
                    onPressed: () => onCategorySelected(category),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 38),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        foregroundColor: selected
            ? AppColors.textPrimary
            : AppColors.textSecondary,
        backgroundColor: selected
            ? AppColors.surfaceElevated
            : AppColors.surface,
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
        ),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      child: Text(label),
    );
  }
}
