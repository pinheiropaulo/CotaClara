import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_history_item.dart';
import 'package:cota_clara/features/bids/widgets/bid_history_empty_state.dart';
import 'package:cota_clara/features/bids/widgets/bid_recent_history_section.dart';
import 'package:cota_clara/features/home/widgets/quota_selector.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/app_quota_summary_card.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:cota_clara/shared/widgets/quota_selection_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BidHistoryScreen extends StatelessWidget {
  const BidHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvas,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                AppTaskTopBar(
                  title: 'Histórico de lances',
                  onBackPressed: () => context.pop(),
                  onHelpPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Consulte os lances já ofertados em cada cota.',
                        ),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Consulte os lances realizados nesta cota.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ValueListenableBuilder<QuotaOverview?>(
                    valueListenable: MockApi.instance.currentQuota,
                    builder: (context, currentQuota, child) {
                      if (currentQuota == null) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ListView(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                        children: [
                          QuotaSelector(
                            quota: currentQuota,
                            onPressed: () async {
                              final quota =
                                  await QuotaSelectionBottomSheet.show(context);
                              if (quota != null) {
                                MockApi.instance.selectQuota(quota.id);
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          AppQuotaSummaryCard(
                            quota: currentQuota,
                            titlePrefix: 'Cota selecionada',
                            customSegmentText:
                                'Segmento: ${currentQuota.title}',
                          ),
                          const SizedBox(height: 24),
                          FutureBuilder<List<BidHistoryItem>>(
                            future: MockApi.instance.getBidHistory(
                              currentQuota.id,
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              final items = snapshot.data!;
                              if (items.isEmpty) {
                                return const BidHistoryEmptyState();
                              }

                              return BidRecentHistorySection(
                                items: items,
                                onViewHistoryPressed: null,
                              );
                            },
                          ),
                        ],
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
