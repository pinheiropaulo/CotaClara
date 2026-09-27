import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/data/mock_quotas.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/services/widgets/services_menu_sections.dart';
import 'package:cota_clara/shared/widgets/app_bottom_navigation.dart';
import 'package:cota_clara/shared/widgets/quota_selection_bottom_sheet.dart';
import 'package:cota_clara/shared/widgets/quota_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  QuotaOverview? _selectedQuota;

  @override
  void initState() {
    super.initState();
    _selectedQuota = mockQuotas.first;
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
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: 2,
        onDestinationSelected: (index) {
          if (index == 2) return;
          if (index == 0) {
            context.go(AppRoutes.home);
          } else if (index == 1) {
            context.go(AppRoutes.quotas);
          } else if (index == 3) {
            context.go(AppRoutes.profile);
          }
        },
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                    children: [
                      _buildQuotaSelection(),
                      const SizedBox(height: 32),
                      QuickActionsSection(onShowComingSoon: _showComingSoon),
                      const SizedBox(height: 32),
                      PaymentsSection(onShowComingSoon: _showComingSoon),
                      const SizedBox(height: 32),
                      ReceiptsSection(onShowComingSoon: _showComingSoon),
                      const SizedBox(height: 32),
                      QuotaSection(onShowComingSoon: _showComingSoon),
                      const SizedBox(height: 32),
                      HelpSection(onShowComingSoon: _showComingSoon),
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

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 12, 8),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Serviços',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Autoatendimento e solicitações da sua cota',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.push(AppRoutes.notifications),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary,
            ),
          ),
          IconButton(
            onPressed: () => context.go(AppRoutes.profile),
            icon: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.surfaceElevated,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuotaSelection() {
    return QuotaSelectionCard(
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
        final quota = await QuotaSelectionBottomSheet.show(context);
        if (quota != null) {
          setState(() => _selectedQuota = quota);
        }
      },
    );
  }
}
