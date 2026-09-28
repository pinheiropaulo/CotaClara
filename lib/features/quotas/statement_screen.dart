import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/quotas/models/statement_entry.dart';
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
  String _selectedFilter = 'Todas';
  bool _showValues = true;

  List<StatementMonthGroup> _statementGroups = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    MockApi.instance.currentQuota.addListener(_onQuotaChanged);
    _loadStatement();
  }

  @override
  void dispose() {
    MockApi.instance.currentQuota.removeListener(_onQuotaChanged);
    super.dispose();
  }

  void _onQuotaChanged() {
    setState(() {});
    _loadStatement();
  }

  Future<void> _loadStatement() async {
    setState(() => _isLoading = true);
    final data = await MockApi.instance.getStatement(
      MockApi.instance.currentQuota.value!.id,
    );
    if (mounted) {
      setState(() {
        _statementGroups = data;
        _isLoading = false;
      });
    }
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
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
                        title: MockApi.instance.currentQuota.value?.title ?? '',
                        description: MockApi.instance.currentQuota.value != null
                            ? 'Grupo ${MockApi.instance.currentQuota.value!.group} • Cota ${MockApi.instance.currentQuota.value!.number}'
                            : '',
                        icon:
                            MockApi.instance.currentQuota.value?.category ==
                                QuotaCategory.vehicle
                            ? Icons.directions_car_outlined
                            : MockApi.instance.currentQuota.value?.category ==
                                  QuotaCategory.services
                            ? Icons.handyman_outlined
                            : Icons.home_outlined,
                        onPressed: () async {
                          final quota = await QuotaSelectionBottomSheet.show(
                            context,
                          );
                          if (quota != null) {
                            MockApi.instance.selectQuota(quota.id);
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

                      if (_isLoading)
                        const Center(child: CircularProgressIndicator())
                      else
                        ..._statementGroups.map(
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
