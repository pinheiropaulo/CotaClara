import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/bids/models/bid_config.dart';
import 'package:cota_clara/features/bids/widgets/bid_definition_hero_card.dart';
import 'package:cota_clara/features/bids/widgets/bid_payment_method_selector.dart';
import 'package:cota_clara/features/bids/widgets/bid_progress_top_bar.dart';
import 'package:cota_clara/features/bids/widgets/bid_summary_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BidConfigureScreen extends StatefulWidget {
  final BidConfig? initialConfig;

  const BidConfigureScreen({super.key, this.initialConfig});

  @override
  State<BidConfigureScreen> createState() => _BidConfigureScreenState();
}

class _BidConfigureScreenState extends State<BidConfigureScreen> {
  late BidConfig _config;
  late TextEditingController _percentageController;

  @override
  void initState() {
    super.initState();
    _config = widget.initialConfig ?? const BidConfig();
    _percentageController = TextEditingController(
      text: _config.percentage.toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _percentageController.dispose();
    super.dispose();
  }

  void _recalculateDistributions(double amount, String method) {
    double embedded = 0.0;
    double own = 0.0;

    if (method == 'lance_embutido') {
      final maxAllowed = amount * (_config.maxEmbeddedPercentageOfBid / 100);
      embedded = amount > maxAllowed ? maxAllowed : amount;
      own = amount - embedded;
    } else {
      own = amount;
    }

    setState(() {
      _config = _config.copyWith(
        amount: amount,
        paymentMethod: method,
        embeddedAmount: embedded,
        ownResourcesAmount: own,
      );
    });
  }

  void _onPaymentMethodChanged(String method) {
    _recalculateDistributions(_config.amount, method);
  }

  void _updateFreePercentage(String text) {
    final parsed = double.tryParse(text);
    if (parsed != null && parsed >= 10 && parsed <= 100) {
      final newAmount = _config.creditAmount * (parsed / 100);
      setState(() {
        _config = _config.copyWith(percentage: parsed);
      });
      _recalculateDistributions(newAmount, _config.paymentMethod);
    }
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
                  title: 'Configurar lance',
                  stepText: 'Etapa 1 de 2',
                  progress: 0.5,
                  helpText: 'Você pode escolher entre pagar com recursos próprios ou abater o lance do crédito (lance embutido).',
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                    children: [
                      BidSummaryHeader(config: _config),
                      const SizedBox(height: 16),
                      BidDefinitionHeroCard(
                        config: _config,
                        percentageController: _percentageController,
                        onPercentageChanged: _updateFreePercentage,
                      ),
                      const SizedBox(height: 20),
                      BidPaymentMethodSelector(
                        selectedMethod: _config.paymentMethod,
                        amount: _config.amount,
                        embeddedAmount: _config.embeddedAmount,
                        ownResourcesAmount: _config.ownResourcesAmount,
                        maxEmbeddedPercentage:
                            _config.maxEmbeddedPercentageOfBid,
                        onChanged: _onPaymentMethodChanged,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: AppColors.textDisabled,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'A contemplação não é garantida. O abatimento no crédito ocorre apenas em caso de contemplação.',
                              style: TextStyle(
                                color: AppColors.textDisabled,
                                fontSize: 12,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.navigation,
                    border: Border(
                      top: BorderSide(color: AppColors.border),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(AppRoutes.bidReview, extra: _config);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Continuar para revisão',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
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
