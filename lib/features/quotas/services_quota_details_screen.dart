import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/quotas/widgets/details/assembly_detail_card.dart';
import 'package:cota_clara/features/quotas/widgets/details/bid_detail_card.dart';
import 'package:cota_clara/features/quotas/widgets/details/credit_update_card.dart';
import 'package:cota_clara/features/quotas/widgets/details/credit_update_info_sheet.dart';
import 'package:cota_clara/features/quotas/widgets/details/credit_value_card.dart';
import 'package:cota_clara/features/quotas/widgets/details/detail_installment_card.dart';
import 'package:cota_clara/features/quotas/widgets/details/plan_progress_card.dart';
import 'package:cota_clara/features/quotas/widgets/details/quota_details_top_bar.dart';
import 'package:cota_clara/features/quotas/widgets/details/quota_info_tile.dart';
import 'package:cota_clara/shared/widgets/app_bottom_navigation.dart';
import 'package:cota_clara/shared/widgets/app_quota_identity_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesQuotaDetailsScreen extends StatelessWidget {
  const ServicesQuotaDetailsScreen({super.key});

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  void _onDestinationSelected(BuildContext context, int index) {
    if (index == 0) {
      context.go(AppRoutes.home);
    } else if (index == 1) {
      context.go(AppRoutes.quotas);
    } else if (index == 2) {
      context.go(AppRoutes.services);
    } else if (index == 3) {
      context.go(AppRoutes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final quota = MockApi.instance.currentQuota.value!;
    final details = MockApi.instance.quotaDetailsFor(quota.id);
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: 1,
        onDestinationSelected: (index) =>
            _onDestinationSelected(context, index),
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                QuotaDetailsTopBar(
                  onBackPressed: () => context.goBackOr(AppRoutes.quotas),
                  onMorePressed: () => _showComingSoon(context, 'Mais opções'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                    children: [
                      AppQuotaIdentityCard(quota: quota),
                      const SizedBox(height: 16),
                      CreditValueCard(
                        currentValue: details.currentCreditValue,
                        contractedValue: details.contractedCreditValue,
                        duration: details.duration,
                      ),
                      const SizedBox(height: 16),
                      CreditUpdateCard(
                        onInfoPressed: () => showCreditUpdateInfoSheet(context),
                        growth: details.updatePercentage,
                        contractedValue: details.contractedCreditValue,
                        currentValue: details.currentCreditValue,
                        accumulatedValue: details.accumulatedUpdate,
                        lastUpdate: details.lastUpdate,
                      ),
                      const SizedBox(height: 16),
                      PlanProgressCard(
                        headline: details.progressHeadline,
                        progressLabel: details.progressLabel,
                        progress: details.progress,
                        paidValue: 'Valor pago: ${details.paidAmount}',
                        remaining: details.remainingInstallments,
                      ),
                      const SizedBox(height: 16),
                      DetailInstallmentCard(
                        onPayPressed: () => context.push(AppRoutes.bill),
                        onViewAllPressed: () =>
                            context.push(AppRoutes.installments),
                        value: details.nextInstallmentValue,
                        dueDate: details.nextInstallmentDueDate,
                        status: details.nextInstallmentStatus,
                      ),
                      const SizedBox(height: 16),
                      AssemblyDetailCard(
                        onPressed: () => context.push(AppRoutes.assemblies),
                      ),
                      const SizedBox(height: 16),
                      BidDetailCard(
                        onPressed: () => context.push(AppRoutes.bidOffer),
                      ),
                      const SizedBox(height: 16),
                      QuotaInfoTile(
                        icon: Icons.receipt_long_outlined,
                        title: 'Extrato da cota',
                        subtitle: 'Consulte pagamentos e movimentações',
                        onPressed: () => context.push(AppRoutes.statement),
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
