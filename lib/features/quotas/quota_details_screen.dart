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
import 'package:cota_clara/features/quotas/widgets/details/quota_identity_card.dart';
import 'package:cota_clara/features/quotas/widgets/details/quota_info_tile.dart';
import 'package:cota_clara/shared/widgets/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuotaDetailsScreen extends StatelessWidget {
  const QuotaDetailsScreen({super.key});

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  void _onDestinationSelected(BuildContext context, int index) {
    if (index == 1) {
      context.go(AppRoutes.quotas);
      return;
    }
    if (index == 0) {
      context.go(AppRoutes.home);
      return;
    }

    const destinations = ['Início', 'Cotas', 'Serviços', 'Perfil'];
    _showComingSoon(context, destinations[index]);
  }

  @override
  Widget build(BuildContext context) {
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
                      const QuotaIdentityCard(),
                      const SizedBox(height: 16),
                      const CreditValueCard(),
                      const SizedBox(height: 16),
                      CreditUpdateCard(
                        onInfoPressed: () => showCreditUpdateInfoSheet(context),
                      ),
                      const SizedBox(height: 16),
                      const PlanProgressCard(),
                      const SizedBox(height: 16),
                      DetailInstallmentCard(
                        onPayPressed: () => context.push(AppRoutes.bill),
                        onViewAllPressed: () =>
                            context.push(AppRoutes.installments),
                      ),
                      const SizedBox(height: 16),
                      AssemblyDetailCard(
                        onPressed: () => context.push(AppRoutes.assemblies),
                      ),
                      const SizedBox(height: 16),
                      BidDetailCard(
                        onPressed: () =>
                            _showComingSoon(context, 'Oferta de lance'),
                      ),
                      const SizedBox(height: 16),
                      QuotaInfoTile(
                        icon: Icons.credit_score_outlined,
                        title: 'Liberação de crédito',
                        subtitle: 'Disponível após a contemplação',
                        informationOnly: true,
                        onPressed: () =>
                            _showComingSoon(context, 'Liberação de crédito'),
                      ),
                      const SizedBox(height: 16),
                      QuotaInfoTile(
                        icon: Icons.receipt_long_outlined,
                        title: 'Extrato da cota',
                        subtitle: 'Consulte pagamentos e movimentações',
                        onPressed: () =>
                            _showComingSoon(context, 'Extrato da cota'),
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
