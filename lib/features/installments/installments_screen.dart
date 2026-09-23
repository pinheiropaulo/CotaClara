import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes/app_navigation.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import 'data/mock_installments.dart';
import 'models/installment.dart';
import 'widgets/installment_card.dart';
import 'widgets/installment_filters.dart';
import 'widgets/installment_plan_summary.dart';
import 'widgets/installment_quota_card.dart';
import 'widgets/installments_top_bar.dart';
import 'widgets/next_installment_highlight.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  InstallmentFilter _selectedFilter = InstallmentFilter.all;

  List<Installment> get _visibleInstallments =>
      mockInstallments.where(_selectedFilter.accepts).toList(growable: false);

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
                InstallmentsTopBar(
                  onBackPressed: () => context.goBackOr(AppRoutes.quotaDetails),
                  onHelpPressed: () => _showComingSoon('Ajuda com parcelas'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                    children: [
                      InstallmentQuotaCard(
                        onPressed: () => _showComingSoon('Seleção de cota'),
                      ),
                      const SizedBox(height: 24),
                      const InstallmentPlanSummary(),
                      const SizedBox(height: 24),
                      NextInstallmentHighlight(
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
                      if (installments.isEmpty)
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
