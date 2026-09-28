import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/installments/models/installment.dart';
import 'package:cota_clara/features/installments/widgets/installment_card.dart';
import 'package:cota_clara/features/installments/widgets/installment_filters.dart';
import 'package:cota_clara/features/installments/widgets/installment_plan_summary.dart';
import 'package:cota_clara/features/installments/widgets/next_installment_highlight.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:cota_clara/shared/widgets/quota_selection_bottom_sheet.dart';
import 'package:cota_clara/shared/widgets/quota_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  InstallmentFilter _selectedFilter = InstallmentFilter.all;

  @override
  void initState() {
    super.initState();
    MockApi.instance.currentQuota.addListener(_onQuotaChanged);
    _loadInstallments();
  }

  @override
  void dispose() {
    MockApi.instance.currentQuota.removeListener(_onQuotaChanged);
    super.dispose();
  }

  void _onQuotaChanged() {
    setState(() {});
    _loadInstallments();
  }

  List<Installment> _installments = [];
  bool _isLoading = true;

  Future<void> _loadInstallments() async {
    setState(() => _isLoading = true);
    final data = await MockApi.instance.getInstallments(
      MockApi.instance.currentQuota.value!.id,
    );
    if (mounted) {
      setState(() {
        _installments = data;
        _isLoading = false;
      });
    }
  }

  List<Installment> get _visibleInstallments =>
      _installments.where(_selectedFilter.accepts).toList(growable: false);

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final installments = _visibleInstallments;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                AppTaskTopBar(
                  title: 'Parcelas',
                  onBackPressed: () => context.goBackOr(AppRoutes.quotaDetails),
                  onHelpPressed: () => _showComingSoon('Ajuda com parcelas'),
                  helpTooltip: 'Ajuda e orientações',
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                    children: [
                      QuotaSelectionCard(
                        title:
                            MockApi.instance.currentQuota.value?.title ??
                            'Cota de imóvel',
                        description: MockApi.instance.currentQuota.value != null
                            ? 'Grupo ${MockApi.instance.currentQuota.value!.group} • Cota ${MockApi.instance.currentQuota.value!.number}'
                            : 'Grupo 012160 • Cota 6503',
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
                      InstallmentPlanSummary(
                        quota: MockApi.instance.currentQuota.value!,
                      ),
                      const SizedBox(height: 24),
                      NextInstallmentHighlight(
                        quota: MockApi.instance.currentQuota.value!,
                        onPayPressed: () => context.push(AppRoutes.bill),
                        onDetailsPressed: () => context.push(AppRoutes.bill),
                      ),
                      const SizedBox(height: 24),
                      InstallmentFilters(
                        selected: _selectedFilter,
                        onSelected: (filter) {
                          setState(() => _selectedFilter = filter);
                        },
                      ),
                      const SizedBox(height: 24),
                      const _ListHeader(),
                      const SizedBox(height: 12),
                      if (_isLoading)
                        const Padding(
                          padding: EdgeInsets.all(24),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      else if (installments.isEmpty)
                        const _EmptyInstallments()
                      else
                        for (
                          var index = 0;
                          index < installments.length;
                          index++
                        ) ...[
                          InstallmentCard(
                            installment: installments[index],
                            onPressed: () {
                              if (installments[index].status ==
                                  InstallmentStatus.pending) {
                                context.push(AppRoutes.bill);
                                return;
                              }
                              _showComingSoon(
                                installments[index].actionLabel,
                              );
                            },
                          ),
                          if (index < installments.length - 1)
                            const SizedBox(height: 12),
                        ],
                      const SizedBox(height: 24),
                      Center(
                        child: OutlinedButton.icon(
                          onPressed: () =>
                              _showComingSoon('Parcelas anteriores'),
                          icon: const Icon(Icons.history, size: 20),
                          label: const Text('Carregar parcelas anteriores'),
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

class _ListHeader extends StatelessWidget {
  const _ListHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Todas as parcelas',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          'Mais recentes primeiro',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}

class _EmptyInstallments extends StatelessWidget {
  const _EmptyInstallments();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Text(
        'Nenhuma parcela encontrada neste filtro.',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      ),
    );
  }
}
