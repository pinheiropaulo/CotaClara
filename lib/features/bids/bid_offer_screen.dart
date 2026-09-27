import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/widgets/bid_input_form.dart';
import 'package:cota_clara/features/bids/widgets/bid_offer_summary_card.dart';
import 'package:cota_clara/features/bids/widgets/bid_quota_summary.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BidOfferScreen extends StatefulWidget {
  const BidOfferScreen({super.key});

  @override
  State<BidOfferScreen> createState() => _BidOfferScreenState();
}

class _BidOfferScreenState extends State<BidOfferScreen> {
  final _amountController = TextEditingController();
  String _bidType = 'Lance livre';
  bool _useOwnResources = true;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
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
                  title: 'Oferta de lance',
                  onBackPressed: () => context.pop(),
                  onHelpPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Ajuda sobre lances será implementada na próxima etapa.',
                        ),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    children: [
                      const BidQuotaSummary(),
                      const SizedBox(height: 32),
                      BidInputForm(
                        amountController: _amountController,
                        bidType: _bidType,
                        onBidTypeChanged: (val) {
                          if (val != null) {
                            setState(() => _bidType = val);
                          }
                        },
                        useOwnResources: _useOwnResources,
                        onUseOwnResourcesChanged: (val) {
                          setState(() => _useOwnResources = val);
                        },
                      ),
                      const SizedBox(height: 32),
                      const BidOfferSummaryCard(),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => context.push(AppRoutes.bidReview),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
