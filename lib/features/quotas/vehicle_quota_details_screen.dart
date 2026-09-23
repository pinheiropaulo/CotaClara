import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes/app_navigation.dart';
import '../../app/routes/app_routes.dart';
import '../../shared/widgets/app_bottom_navigation.dart';
import 'widgets/details/assembly_detail_card.dart';
import 'widgets/details/bid_detail_card.dart';
import 'widgets/details/credit_update_card.dart';
import 'widgets/details/credit_update_info_sheet.dart';
import 'widgets/details/credit_value_card.dart';
import 'widgets/details/plan_progress_card.dart';
import 'widgets/details/quota_details_top_bar.dart';
import 'widgets/details/quota_help_sheet.dart';
import 'widgets/details/quota_info_tile.dart';
import 'widgets/details/vehicle/adjusted_installment_notice.dart';
import 'widgets/details/vehicle/contract_documents_card.dart';
import 'widgets/details/vehicle/vehicle_installment_card.dart';
import 'widgets/details/vehicle/vehicle_quota_identity_card.dart';

class VehicleQuotaDetailsScreen extends StatelessWidget {
  const VehicleQuotaDetailsScreen({super.key});

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
                  onHelpPressed: () => showQuotaHelpSheet(
                    context,
                    onOptionSelected: (option) =>
                        _showComingSoon(context, option),
                  ),
                  onMorePressed: () => _showComingSoon(context, 'Mais opções'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                    children: [
                      const VehicleQuotaIdentityCard(),
                      const SizedBox(height: 16),
                      const CreditValueCard(
                        currentValue: 'R\$ 80.000,00',
                        duration: '120 meses',
                      ),
                      const SizedBox(height: 16),
                      CreditUpdateCard(
                        onInfoPressed: () => showCreditUpdateInfoSheet(context),
                        growth: '+0,00%',
                        currentValue: 'R\$ 80.000,00',
                        accumulatedValue: 'R\$ 0,00',
                        lastUpdate: '1 de outubro de 2026',
                      ),
                      const SizedBox(height: 16),
                      const PlanProgressCard(
                        headline: '18ª assembleia de 120',
                        progressLabel: '15% concluído',
                        progress: 0.15,
                        paidValue: 'Valor pago: R\$ 14.320,00',
                        remaining: '103 parcelas restantes',
                      ),
                      const SizedBox(height: 16),
                      AdjustedInstallmentNotice(
                        onPressed: () =>
                            _showComingSoon(context, 'Ajuste da parcela'),
                      ),
                      const SizedBox(height: 16),
                      VehicleInstallmentCard(
                        onPayPressed: () => _showComingSoon(context, 'Boleto'),
                        onViewAllPressed: () =>
                            _showComingSoon(context, 'Parcelas'),
                      ),
                      const SizedBox(height: 16),
                      AssemblyDetailCard(
                        date: '15 de outubro • 19h',
                        onPressed: () => _showComingSoon(
                          context,
                          'Detalhes da assembleia',
                        ),
                      ),
                      const SizedBox(height: 16),
                      BidDetailCard(
                        deadline: 'Prazo até 14 de outubro, às 18h',
                        deadlineOnTrailing: true,
                        onPressed: () =>
                            _showComingSoon(context, 'Oferta de lance'),
                      ),
                      const SizedBox(height: 16),
                      QuotaInfoTile(
                        icon: Icons.account_balance_wallet_outlined,
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
                      const SizedBox(height: 20),
                      ContractDocumentsCard(
                        onContractPressed: () =>
                            _showComingSoon(context, 'Contrato da cota'),
                        onRegulationPressed: () =>
                            _showComingSoon(context, 'Regulamento do grupo'),
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
