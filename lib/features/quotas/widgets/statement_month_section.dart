import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/statement_entry.dart';
import 'package:cota_clara/features/quotas/widgets/statement_entry_card.dart';
import 'package:flutter/material.dart';

class StatementMonthSection extends StatelessWidget {
  const StatementMonthSection({
    super.key,
    required this.group,
    required this.showValues,
    required this.filter,
    required this.onEntryPressed,
  });

  final StatementMonthGroup group;
  final bool showValues;
  final String filter;
  final VoidCallback onEntryPressed;

  bool _matchesFilter(StatementEntry entry) {
    if (filter == 'Todas') {
      return true;
    }
    if (filter == 'Pagamentos' && entry.type == StatementEntryType.payment) {
      return true;
    }
    if (filter == 'Ajustes' && entry.type == StatementEntryType.adjustment) {
      return true;
    }
    if (filter == 'Estornos' && entry.type == StatementEntryType.refund) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final filteredEntries = group.entries.where(_matchesFilter).toList();
    if (filteredEntries.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            group.monthYear,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...filteredEntries.map(
          (entry) => StatementEntryCard(
            entry: entry,
            showValues: showValues,
            onPressed: onEntryPressed,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
