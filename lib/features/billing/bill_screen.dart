import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_navigation.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/billing/models/bill.dart';
import 'package:cota_clara/features/billing/widgets/bill_code_card.dart';
import 'package:cota_clara/features/billing/widgets/bill_notices.dart';
import 'package:cota_clara/features/billing/widgets/bill_quota_card.dart';
import 'package:cota_clara/features/billing/widgets/bill_secondary_actions.dart';
import 'package:cota_clara/features/billing/widgets/bill_summary_card.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  Bill? _bill;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final quota = MockApi.instance.currentQuota.value;
    if (quota == null) return;

    final b = await MockApi.instance.getBill(quota.id);
    if (mounted) {
      setState(() {
        _bill = b;
      });
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: _bill!.copyCode));
    _showMessage(context, 'Código de barras copiado');
  }

  @override
  Widget build(BuildContext context) {
    if (_bill == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
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
                      BillSummaryCard(bill: _bill!),
                      const SizedBox(height: 16),
                      BillCodeCard(
                        code: _bill!.displayCode,
                        onCopyPressed: () => _copyCode(),
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
