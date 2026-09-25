import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/quotas/data/mock_quotas.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/quotas/models/quota_summary.dart';
import 'package:cota_clara/features/quotas/widgets/assembly_hint.dart';
import 'package:cota_clara/features/quotas/widgets/quota_filters.dart';
import 'package:cota_clara/features/quotas/widgets/quota_overview_card.dart';
import 'package:cota_clara/features/quotas/widgets/quotas_header.dart';
import 'package:cota_clara/shared/widgets/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuotasScreen extends StatefulWidget {
  const QuotasScreen({super.key});

  @override
  State<QuotasScreen> createState() => _QuotasScreenState();
}

class _QuotasScreenState extends State<QuotasScreen> {
  QuotaCategory? _selectedCategory;

  List<QuotaOverview> get _visibleQuotas {
    final category = _selectedCategory;
    if (category == null) return mockQuotas;
    return mockQuotas.where((quota) => quota.category == category).toList();
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  void _onDestinationSelected(int index) {
    if (index == 1) return;
    if (index == 0) {
      context.go(AppRoutes.home);
      return;
    }

    const destinations = ['Início', 'Cotas', 'Serviços', 'Perfil'];
    _showComingSoon(destinations[index]);
  }

  @override
  Widget build(BuildContext context) {
    final quotas = _visibleQuotas;

    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: 1,
        onDestinationSelected: _onDestinationSelected,
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                QuotasHeader(
                  onNotificationsPressed: () => _showComingSoon('Notificações'),
                ),
                QuotaFilters(
                  summary: QuotaSummary.fromQuotas(quotas),
                  selectedCategory: _selectedCategory,
                  onCategorySelected: (category) {
                    setState(() => _selectedCategory = category);
                  },
                  onFilterPressed: () => _showComingSoon('Filtros avançados'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      for (var index = 0; index < quotas.length; index++) ...[
                        QuotaOverviewCard(
                          quota: quotas[index],
                          onPressed: () {
                            if (quotas[index].category ==
                                QuotaCategory.property) {
                              context.push(AppRoutes.quotaDetails);
                              return;
                            }
                            if (quotas[index].category ==
                                QuotaCategory.vehicle) {
                              context.push(AppRoutes.vehicleQuotaDetails);
                              return;
                            }
                            _showComingSoon('Detalhes desta cota');
                          },
                        ),
                        if (index < quotas.length - 1)
                          const SizedBox(height: 16),
                      ],
                      const SizedBox(height: 12),
                      AssemblyHint(
                        onPressed: () => context.push(AppRoutes.assemblies),
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
