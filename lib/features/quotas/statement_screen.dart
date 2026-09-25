import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/data/mock_quotas.dart';
import 'package:cota_clara/features/quotas/data/mock_statement.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/quotas/models/statement_entry.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:cota_clara/shared/widgets/quota_selection_bottom_sheet.dart';
import 'package:cota_clara/shared/widgets/quota_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({super.key});

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  QuotaOverview? _selectedQuota;
  String _selectedFilter = 'Todas';
  bool _showValues = true;

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedQuota = mockQuotas.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                AppTaskTopBar(
                  title: 'Extrato da cota',
                  onBackPressed: () => context.pop(),
                  onHelpPressed: () => _showComingSoon('Download do extrato'),
                  helpTooltip: 'Baixar',
                  trailingIcon: Icons.file_download_outlined,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                    children: [
                      QuotaSelectionCard(
                        title: _selectedQuota?.title ?? '',
                        description: _selectedQuota != null
                            ? 'Grupo ${_selectedQuota!.group} • Cota ${_selectedQuota!.number}'
                            : '',
                        icon: _selectedQuota?.category == QuotaCategory.vehicle
                            ? Icons.directions_car_outlined
                            : _selectedQuota?.category == QuotaCategory.services
                            ? Icons.handyman_outlined
                            : Icons.home_outlined,
                        onPressed: () async {
                          final quota = await QuotaSelectionBottomSheet.show(
                            context,
                          );
                          if (quota != null) {
                            setState(() => _selectedQuota = quota);
                          }
                        },
                      ),
                      const SizedBox(height: 24),

                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Período',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => _showComingSoon('Filtro de período'),
                            borderRadius: BorderRadius.circular(8),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 16,
                                    color: AppColors.accentBlue,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Últimos 6 meses',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: AppColors.textSecondary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.financialCard,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Pagamentos no período',
                                    style: TextStyle(
                                      color: AppColors.accentBlue,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon: Icon(
                                    _showValues
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.accentBlue,
                                    size: 20,
                                  ),
                                  onPressed: () => setState(
                                    () => _showValues = !_showValues,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _showValues ? 'R\$ 4.176,70' : 'R\$ ••••••••',
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '5 pagamentos confirmados',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              [
                                'Todas',
                                'Pagamentos',
                                'Ajustes',
                                'Estornos',
                              ].map((filter) {
                                final isSelected = _selectedFilter == filter;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ChoiceChip(
                                    label: Text(filter),
                                    selected: isSelected,
                                    onSelected: (val) {
                                      if (val) {
                                        setState(
                                          () => _selectedFilter = filter,
                                        );
                                      }
                                    },
                                    backgroundColor: AppColors.surface,
                                    selectedColor: AppColors.surfaceElevated,
                                    labelStyle: TextStyle(
                                      color: isSelected
                                          ? AppColors.accentBlue
                                          : AppColors.textSecondary,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w400,
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
                      ),
                      const SizedBox(height: 24),

                      ...mockStatementGroups.map(
                        (group) => _StatementMonthSection(
                          group: group,
                          showValues: _showValues,
                          filter: _selectedFilter,
                          onEntryPressed: () =>
                              _showComingSoon('Detalhes da movimentação'),
                        ),
                      ),

                      const SizedBox(height: 16),
                      Center(
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              _showComingSoon('Movimentações anteriores'),
                          icon: const Icon(Icons.history, size: 20),
                          label: const Text(
                            'Carregar movimentações anteriores',
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.accentBlue,
                            backgroundColor: AppColors.surface,
                            side: const BorderSide(color: AppColors.border),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatementMonthSection extends StatelessWidget {
  const _StatementMonthSection({
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
          (entry) => _StatementEntryCard(
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

class _StatementEntryCard extends StatelessWidget {
  const _StatementEntryCard({
    required this.entry,
    required this.showValues,
    required this.onPressed,
  });

  final StatementEntry entry;
  final bool showValues;
  final VoidCallback onPressed;

  IconData _getIcon() {
    switch (entry.type) {
      case StatementEntryType.payment:
        return Icons.receipt_long_outlined;
      case StatementEntryType.adjustment:
        return Icons.add_circle_outline;
      case StatementEntryType.refund:
        return Icons.remove_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = entry.type == StatementEntryType.payment
        ? AppColors.success
        : AppColors.warning;
    final statusBgColor = entry.type == StatementEntryType.payment
        ? AppColors.successContainer
        : AppColors.warningContainer;
    final statusText = entry.type == StatementEntryType.payment
        ? 'Confirmado'
        : 'Ajuste';

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                shape: BoxShape.circle,
              ),
              child: Icon(_getIcon(), color: AppColors.accentBlue, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    entry.description,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  showValues ? entry.amount : 'R\$ •••••',
                  style: TextStyle(
                    color: entry.isPositive
                        ? AppColors.success
                        : AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
