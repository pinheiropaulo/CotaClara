import 'package:flutter/material.dart';

import '../../app/routes/app_routes.dart';
import '../../shared/widgets/app_bottom_navigation.dart';
import 'widgets/credit_card.dart';
import 'widgets/home_header.dart';
import 'widgets/next_installment_card.dart';
import 'widgets/quick_access_section.dart';
import 'widgets/quota_selector.dart';
import 'widgets/quota_tracking_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Navigator.of(context).pushReplacementNamed(AppRoutes.quotas);
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
                        onPressed: () =>
                            _showComingSoon(context, 'Seleção de cota'),
                      ),
                      const SizedBox(height: 16),
                      const CreditCard(),
                      const SizedBox(height: 24),
                      NextInstallmentCard(
                        onPayPressed: () => _showComingSoon(context, 'Boleto'),
                        onViewInstallmentsPressed: () =>
                            _showComingSoon(context, 'Parcelas'),
                      ),
                      const SizedBox(height: 30),
                      QuotaTrackingSection(
                        onBidPressed: () =>
                            _showComingSoon(context, 'Oferta de lance'),
                      ),
                      const SizedBox(height: 30),
                      QuickAccessSection(
                        onItemPressed: (label) =>
                            _showComingSoon(context, label),
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
