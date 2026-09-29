import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/support/widgets/support_message_card.dart';
import 'package:cota_clara/features/support/widgets/support_security_note.dart';
import 'package:cota_clara/features/support/widgets/support_header.dart';
import 'package:cota_clara/features/support/widgets/support_quota_section.dart';
import 'package:cota_clara/features/support/widgets/support_bottom_actions.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  QuotaOverview? _selectedQuota;

  @override
  void initState() {
    super.initState();
    _selectedQuota = MockApi.instance.currentQuota.value!;
  }

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
                  title: 'Falar com atendimento',
                  onBackPressed: () => context.pop(),
                  onHelpPressed: () => _showComingSoon('Ajuda de atendimento'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                    children: [
                      const SupportHeader(),
                      const SizedBox(height: 32),
                      SupportQuotaSection(selectedQuota: _selectedQuota),
                      const SizedBox(height: 32),
                      SupportMessageCard(
                        message:
                            'Olá! Preciso de atendimento sobre minha cota de ${_selectedQuota?.title.toLowerCase() ?? ''}. Grupo ${_selectedQuota?.group ?? ''}, cota ${_selectedQuota?.number ?? ''}.',
                      ),
                      const SizedBox(height: 24),
                      const SupportSecurityNote(),
                    ],
                  ),
                ),
                const SupportBottomActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
