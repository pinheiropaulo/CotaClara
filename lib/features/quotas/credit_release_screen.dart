import 'package:cota_clara/features/quotas/widgets/financial_card.dart';
import 'package:cota_clara/features/quotas/widgets/help_banner.dart';
import 'package:cota_clara/features/quotas/widgets/quota_info_card.dart';
import 'package:cota_clara/features/quotas/widgets/release_status_card.dart';
import 'package:cota_clara/features/quotas/widgets/release_steps.dart';
import 'package:cota_clara/features/quotas/widgets/request_info.dart';
import 'package:cota_clara/features/quotas/widgets/required_documents.dart';
import 'package:cota_clara/features/quotas/widgets/secure_banner.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreditReleaseScreen extends StatefulWidget {
  const CreditReleaseScreen({super.key});

  @override
  State<CreditReleaseScreen> createState() => _CreditReleaseScreenState();
}

class _CreditReleaseScreenState extends State<CreditReleaseScreen> {
  bool _showValues = true;

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
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                AppTaskTopBar(
                  title: 'Liberação de crédito',
                  onBackPressed: () => context.pop(),
                  onHelpPressed: () => _showComingSoon('Ajuda sobre liberação'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                    children: [
                      const QuotaInfoCard(),
                      const SizedBox(height: 24),
                      FinancialCard(
                        showValues: _showValues,
                        onToggleValues: () =>
                            setState(() => _showValues = !_showValues),
                      ),
                      const SizedBox(height: 32),
                      ReleaseStatusCard(
                        onContinue: () =>
                            _showComingSoon('Continuar solicitação'),
                      ),
                      const SizedBox(height: 32),
                      const ReleaseSteps(),
                      const SizedBox(height: 32),
                      RequiredDocuments(
                        onAction: _showComingSoon,
                      ),
                      const SizedBox(height: 32),
                      const RequestInfo(),
                      const SizedBox(height: 24),
                      const SecureBanner(),
                      const SizedBox(height: 24),
                      HelpBanner(
                        onHelp: () => _showComingSoon('Orientações'),
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
