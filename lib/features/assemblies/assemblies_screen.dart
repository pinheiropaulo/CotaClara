import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/assemblies/models/assembly_history.dart';
import 'package:cota_clara/features/assemblies/models/next_assembly_data.dart';
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
  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    MockApi.instance.init();
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
                  child: ValueListenableBuilder<QuotaOverview?>(
                    valueListenable: MockApi.instance.currentQuota,
                    builder: (context, currentQuota, child) {
                      if (currentQuota == null) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return FutureBuilder(
                        future: Future.wait([
                          MockApi.instance.getNextAssembly(currentQuota.id),
                          MockApi.instance.getAssemblyHistory(currentQuota.id),
                        ]),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final nextAssembly =
                              snapshot.data![0] as NextAssemblyData;
                          final assemblyHistory =
                              snapshot.data![1] as List<AssemblyHistory>;

                          return ListView(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                            children: [
                              QuotaSelectionCard(
                                title: currentQuota.title,
                                description:
                                    'Grupo ${currentQuota.group} • Cota ${currentQuota.number}',
                                icon:
                                    currentQuota.category ==
                                        QuotaCategory.vehicle
                                    ? Icons.directions_car_outlined
                                    : currentQuota.category ==
                                          QuotaCategory.services
                                    ? Icons.handyman_outlined
                                    : Icons.home_outlined,
                                onPressed: () async {
                                  final quota =
                                      await QuotaSelectionBottomSheet.show(
                                        context,
                                      );
                                  if (quota != null) {
                                    MockApi.instance.selectQuota(quota.id);
                                  }
                                },
                              ),
                              const SizedBox(height: 24),
                              NextAssemblyCard(
                                data: nextAssembly,
                                onDetailsPressed: () =>
                                    context.push(AppRoutes.assemblyDetails),
                              ),
                              const SizedBox(height: 24),
                              AssemblyBidCard(
                                onPressed: () => _showComingSoon(
                                  context,
                                  'Acompanhamento do lance',
                                ),
                              ),
                              const SizedBox(height: 28),
                              AssemblyHistorySection(
                                items: assemblyHistory,
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
                          );
                        },
                      );
                    },
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
