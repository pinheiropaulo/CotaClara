import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/billing/data/mock_bill.dart';
import 'package:cota_clara/features/billing/widgets/bill_code_card.dart';
import 'package:cota_clara/features/billing/widgets/bill_notices.dart';
import 'package:cota_clara/features/billing/widgets/bill_quota_card.dart';
import 'package:cota_clara/features/billing/widgets/bill_secondary_actions.dart';
import 'package:cota_clara/features/billing/widgets/bill_summary_card.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _copyCode(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: mockBill.copyCode));
    if (!context.mounted) return;
    _showMessage(context, 'Código copiado com sucesso!');
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
                  title: 'Boleto da parcela',
                  onBackPressed: () => context.goBackOr(AppRoutes.installments),
                  onHelpPressed: () => _showMessage(
                    context,
                    'Ajuda do boleto será implementada em uma próxima etapa.',
                  ),
                  helpTooltip: 'Ajuda com boleto',
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
                    children: [
                      const BillQuotaCard(),
                      const SizedBox(height: 16),
                      const BillSummaryCard(bill: mockBill),
                      const SizedBox(height: 16),
                      BillCodeCard(
                        code: mockBill.displayCode,
                        onCopyPressed: () => _copyCode(context),
                      ),
                      const SizedBox(height: 16),
                      BillSecondaryActions(
                        onViewPressed: () => _showMessage(
                          context,
                          'Visualização do boleto será implementada em uma próxima etapa.',
                        ),
                        onSharePressed: () => _showMessage(
                          context,
                          'Compartilhamento será implementado em uma próxima etapa.',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const BillNotices(),
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
