import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_config.dart';
import 'package:cota_clara/features/bids/widgets/bid_offer_list.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BidOfferScreen extends StatelessWidget {
  const BidOfferScreen({super.key});

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
                  title: 'Lances',
                  onBackPressed: () => context.pop(),
                  onHelpPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'O lance é a antecipação de parcelas para tentar ser contemplado na assembleia mensal.',
                        ),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: ValueListenableBuilder<QuotaOverview?>(
                    valueListenable: MockApi.instance.currentQuota,
                    builder: (context, currentQuota, child) {
                      if (currentQuota == null) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return FutureBuilder<BidConfig>(
                        future: MockApi.instance.getInitialBidConfig(
                          currentQuota.id,
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return BidOfferList(
                            currentQuota: currentQuota,
                            bidConfig: snapshot.data!,
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
