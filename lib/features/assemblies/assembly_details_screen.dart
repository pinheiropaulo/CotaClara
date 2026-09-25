import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/assemblies/widgets/assembly_details_header_card.dart';
import 'package:cota_clara/features/assemblies/widgets/assembly_result_card.dart';
import 'package:cota_clara/features/assemblies/widgets/assembly_result_sections.dart';
import 'package:cota_clara/features/assemblies/widgets/next_assembly_notice.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:cota_clara/shared/widgets/quota_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AssemblyDetailsScreen extends StatelessWidget {
  const AssemblyDetailsScreen({super.key});

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
                  title: 'Detalhes da assembleia',
                  helpTooltip: 'Compartilhar',
                  trailingIcon: Icons.share_outlined,
                  onBackPressed: () => context.goBackOr(AppRoutes.assemblies),
                  onHelpPressed: () =>
                      _showComingSoon(context, 'Compartilhar resultado'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                    children: [
                      QuotaSelectionCard(
                        title: 'Cota de imóvel',
                        description: 'Grupo 012160 • Cota 6503',
                        icon: Icons.home_outlined,
                        showSelectionControl: false,
                        onPressed: () =>
                            _showComingSoon(context, 'Detalhes da cota'),
                      ),
                      const SizedBox(height: 16),
                      const AssemblyDetailsHeaderCard(),
                      const SizedBox(height: 16),
                      const AssemblyResultCard(),
                      const SizedBox(height: 16),
                      const AssemblyBidResultCard(),
                      const SizedBox(height: 24),
                      AssemblyResultSummary(
                        onViewContemplatedPressed: () => _showComingSoon(
                          context,
                          'Lista de contemplados',
                        ),
                      ),
                      const SizedBox(height: 24),
                      AssemblyDocumentsCard(
                        onMinutesPressed: () =>
                            _showComingSoon(context, 'Ata da assembleia'),
                        onRulesPressed: () =>
                            _showComingSoon(context, 'Regras do grupo'),
                      ),
                      const SizedBox(height: 16),
                      NextAssemblyNotice(
                        onPressed: () => context.go(AppRoutes.assemblies),
                      ),
                      const SizedBox(height: 16),
                      const NextAssemblyNotification(),
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
