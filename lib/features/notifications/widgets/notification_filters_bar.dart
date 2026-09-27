import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationFiltersBar extends StatelessWidget {
  const NotificationFiltersBar({
    required this.selectedFilter,
    required this.onFilterSelected,
    super.key,
  });

  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ['Todas', 'Não lidas'].map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (val) {
                if (val) {
                  onFilterSelected(filter);
                }
              },
              backgroundColor: AppColors.surface,
              selectedColor: AppColors.surfaceElevated,
              labelStyle: TextStyle(
                color: isSelected
                    ? AppColors.accentBlue
                    : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
                side: BorderSide(
                  color: isSelected ? AppColors.accentBlue : AppColors.border,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
