import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StatementFilterChips extends StatelessWidget {
  const StatementFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            [
              'Todas',
              'Pagamentos',
              'Ajustes',
              'Estornos',
            ].map((filter) {
              final isSelected = selectedFilter == filter;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (val) {
                    if (val) {
                      onFilterChanged(filter);
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
                      color: isSelected
                          ? AppColors.accentBlue
                          : AppColors.border,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
