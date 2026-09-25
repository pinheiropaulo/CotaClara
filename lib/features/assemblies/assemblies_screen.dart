import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/assemblies/data/mock_assemblies.dart';
import 'package:cota_clara/features/assemblies/widgets/assembly_bid_card.dart';
import 'package:cota_clara/features/assemblies/widgets/assembly_history_section.dart';
import 'package:cota_clara/features/assemblies/widgets/assembly_notification_notice.dart';
import 'package:cota_clara/features/assemblies/widgets/next_assembly_card.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:cota_clara/shared/widgets/quota_selection_bottom_sheet.dart';
import 'package:cota_clara/shared/widgets/quota_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AssembliesScreen extends StatefulWidget {
  const AssembliesScreen({super.key});

  @override
  State<AssembliesScreen> createState() => _AssembliesScreenState();
}

class _AssembliesScreenState extends State<AssembliesScreen> {
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
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                AppTaskTopBar(
                  title: 'Assembleias',
                  onBackPressed: () => context.goBackOr(AppRoutes.quotaDetails),
                  onHelpPressed: () =>
                      _showComingSoon(context, 'Ajuda sobre assembleias'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                    children: [
                      QuotaSelectionCard(
                        title: _selectedQuota?.title ?? 'Cota de imóvel',
                        description: _selectedQuota != null
                            ? 'Grupo ${_selectedQuota!.group} • Cota ${_selectedQuota!.number}'
                            : 'Grupo 012160 • Cota 6503',
                        icon: _selectedQuota?.category == QuotaCategory.vehicle
                            ? Icons.directions_car_outlined
                            : _selectedQuota?.category == QuotaCategory.services
                            ? Icons.handyman_outlined
                            : Icons.home_outlined,
                        onPressed: () async {
                          final quota = await QuotaSelectionBottomSheet.show(
                            context,
                          );
                          if (quota != null) {
                            setState(() => _selectedQuota = quota);
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      NextAssemblyCard(
                        onDetailsPressed: () =>
                            context.push(AppRoutes.assemblyDetails),
                      ),
                      const SizedBox(height: 24),
                      AssemblyBidCard(
                        onPressed: () =>
                            _showComingSoon(context, 'Acompanhamento do lance'),
                      ),
                      const SizedBox(height: 28),
                      AssemblyHistorySection(
                        items: mockAssemblyHistory,
                        onItemPressed: (assembly) => _showComingSoon(
                          context,
                          'Resultado de ${assembly.date}',
                        ),
                        onViewAllPressed: () => _showComingSoon(
                          context,
                          'Histórico completo de assembleias',
                        ),
                      ),
                      const SizedBox(height: 24),
                      const AssemblyNotificationNotice(),
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
