import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../models/installment.dart';

class InstallmentFilters extends StatelessWidget {
  const InstallmentFilters({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final InstallmentFilter selected;
  final ValueChanged<InstallmentFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (
            var index = 0;
            index < InstallmentFilter.values.length;
            index++
          ) ...[
            if (index > 0) const SizedBox(width: 8),
            _FilterButton(
              filter: InstallmentFilter.values[index],
              selected: selected == InstallmentFilter.values[index],
              onPressed: () => onSelected(InstallmentFilter.values[index]),
            ),
          ],
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.filter,
    required this.selected,
    required this.onPressed,
  });

  final InstallmentFilter filter;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 40),
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
      ),
      child: Text(filter.label),
    );
  }
}
