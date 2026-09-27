import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/data/mock_quotas.dart';
import 'package:cota_clara/features/quotas/data/mock_statement.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/quotas/widgets/statement_filter_chips.dart';
import 'package:cota_clara/features/quotas/widgets/statement_month_section.dart';
import 'package:cota_clara/features/quotas/widgets/statement_period_header.dart';
import 'package:cota_clara/features/quotas/widgets/statement_period_summary.dart';
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

                      StatementPeriodHeader(
                        onTap: () => _showComingSoon('Filtro de período'),
                      ),
                      const SizedBox(height: 16),

                      StatementPeriodSummary(
                        showValues: _showValues,
                        onToggleValues: () =>
                            setState(() => _showValues = !_showValues),
                      ),
                      const SizedBox(height: 24),

                      StatementFilterChips(
                        selectedFilter: _selectedFilter,
                        onFilterChanged: (filter) {
                          setState(() => _selectedFilter = filter);
                        },
                      ),
                      const SizedBox(height: 24),

                      ...mockStatementGroups.map(
                        (group) => StatementMonthSection(
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
