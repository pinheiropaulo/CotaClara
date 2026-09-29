import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_config.dart';
import 'package:cota_clara/features/bids/widgets/bid_consent_checkbox.dart';
import 'package:cota_clara/features/bids/widgets/bid_embedded_notice_card.dart';
import 'package:cota_clara/features/bids/widgets/bid_progress_top_bar.dart';
import 'package:cota_clara/features/bids/widgets/bid_proposal_details_card.dart';
import 'package:cota_clara/features/bids/widgets/bid_review_hero_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BidReviewScreen extends StatefulWidget {
  final BidConfig? config;

  const BidReviewScreen({super.key, this.config});

  @override
  State<BidReviewScreen> createState() => _BidReviewScreenState();
}

class _BidReviewScreenState extends State<BidReviewScreen> {
  late BidConfig _config;
  bool _agreementAccepted = false;

  @override
  void initState() {
    super.initState();
    _config = widget.config ?? const BidConfig();
  }

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
                const BidProgressTopBar(
                  title: 'Revisar lance',
                  stepText: 'Etapa 2 de 2',
                  progress: 1.0,
                  helpText: 'Revise todas as informações antes de confirmar a oferta do seu lance.',
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                    children: [
                      BidReviewHeroCard(config: _config),
                      const SizedBox(height: 16),
                      BidProposalDetailsCard(config: _config),
                      if (_config.paymentMethod == 'lance_embutido') ...[
                        const SizedBox(height: 16),
                        BidEmbeddedNoticeCard(
                          netCreditAmount:
                              _config.creditAmount - _config.embeddedAmount,
                        ),
                      ],
                      const SizedBox(height: 24),
                      BidConsentCheckbox(
                        value: _agreementAccepted,
                        onChanged: (val) {
                          setState(() {
                            _agreementAccepted = val ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.navigation,
                    border: Border(
                      top: BorderSide(color: AppColors.border),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _agreementAccepted
                              ? () async {
                                  await MockApi.instance.addBid(
                                    MockApi.instance.currentQuota.value!.id,
                                    _config,
                                  );
                                  if (context.mounted) {
                                    context.push(
                                      AppRoutes.bidSuccess,
                                      extra: _config,
                                    );
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.onPrimary,
                            disabledBackgroundColor: AppColors.surfaceElevated,
                            disabledForegroundColor: AppColors.textDisabled,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Confirmar lance',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: TextButton(
                          onPressed: () => context.pop(),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.accentBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Voltar para configuração',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
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
