import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/home/widgets/credit_card.dart';
import 'package:cota_clara/features/home/widgets/home_header.dart';
import 'package:cota_clara/features/home/widgets/next_installment_card.dart';
import 'package:cota_clara/features/home/widgets/quick_access_section.dart';
import 'package:cota_clara/features/home/widgets/quota_selector.dart';
import 'package:cota_clara/features/home/widgets/quota_tracking_section.dart';
import 'package:cota_clara/features/home/widgets/upcoming_due_section.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/app_bottom_navigation.dart';
import 'package:cota_clara/shared/widgets/quota_selection_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuotaOverview? _selectedQuota;

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: 0,
        onDestinationSelected: (index) {
          if (index == 0) return;
          if (index == 1) {
            context.go(AppRoutes.quotas);
            return;
          }
          const destinations = ['Início', 'Cotas', 'Serviços', 'Perfil'];
          _showComingSoon(context, destinations[index]);
        },
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: HomeHeader(
                    onNotificationsPressed: () =>
                        _showComingSoon(context, 'Notificações'),
                    onProfilePressed: () => _showComingSoon(context, 'Perfil'),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      QuotaSelector(
                        quota: _selectedQuota,
                        onPressed: () async {
                          final quota = await QuotaSelectionBottomSheet.show(
                            context,
                          );
                          if (quota != null) {
                            setState(() => _selectedQuota = quota);
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      CreditCard(quota: _selectedQuota),
                      const SizedBox(height: 24),
                      NextInstallmentCard(
                        onPayPressed: () => _showComingSoon(context, 'Boleto'),
                        onViewInstallmentsPressed: () =>
                            _showComingSoon(context, 'Parcelas'),
                      ),
                      const SizedBox(height: 20),
                      UpcomingDueSection(
                        onViewAllPressed: () =>
                            context.push(AppRoutes.installments),
                        onDuePressed: (quotaName) =>
                            _showComingSoon(context, quotaName),
                      ),
                      const SizedBox(height: 30),
                      QuotaTrackingSection(
                        onBidPressed: () => context.push(AppRoutes.bidOffer),
                      ),
                      const SizedBox(height: 30),
                      QuickAccessSection(
                        onItemPressed: (label) {
                          if (label == 'Extrato') {
                            context.push(AppRoutes.statement);
                          } else if (label == 'Liberação de crédito') {
                            context.push(AppRoutes.creditRelease);
                          } else {
                            _showComingSoon(context, label);
                          }
                        },
                      ),
                    ]),
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
