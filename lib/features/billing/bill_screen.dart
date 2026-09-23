import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/mock_bill.dart';
import 'widgets/bill_code_card.dart';
import 'widgets/bill_notices.dart';
import 'widgets/bill_quota_card.dart';
import 'widgets/bill_secondary_actions.dart';
import 'widgets/bill_summary_card.dart';
import 'widgets/bill_top_bar.dart';

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
                BillTopBar(
                  onBackPressed: () => Navigator.of(context).pop(),
                  onHelpPressed: () => _showMessage(
                    context,
                    'Ajuda do boleto será implementada em uma próxima etapa.',
                  ),
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
