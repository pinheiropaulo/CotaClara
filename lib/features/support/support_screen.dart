import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:cota_clara/features/support/widgets/support_message_card.dart';
import 'package:cota_clara/features/support/widgets/support_security_note.dart';
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
                      _buildHeader(),
                      const SizedBox(height: 32),
                      _buildQuotaSection(),
                      const SizedBox(height: 32),
                      SupportMessageCard(
                        message:
                            'Olá! Preciso de atendimento sobre minha cota de ${_selectedQuota?.title.toLowerCase()}. Grupo ${_selectedQuota?.group}, cota ${_selectedQuota?.number}.',
                      ),
                      const SizedBox(height: 24),
                      const SupportSecurityNote(),
                    ],
                  ),
                ),
                _buildBottomActions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.forum_outlined, color: AppColors.accentBlue, size: 48),
        SizedBox(height: 16),
        Text(
          'Como podemos ajudar?',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Você será direcionado para a Central de Atendimento pelo WhatsApp.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildQuotaSection() {
    if (_selectedQuota == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SOBRE A SUA COTA',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceElevated,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _selectedQuota?.category == QuotaCategory.vehicle
                      ? Icons.directions_car_outlined
                      : _selectedQuota?.category == QuotaCategory.services
                      ? Icons.handyman_outlined
                      : Icons.home_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedQuota!.title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Grupo ${_selectedQuota!.group}   Cota ${_selectedQuota!.number}',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showComingSoon('Abrir WhatsApp'),
              icon: const Icon(Icons.chat),
              label: const Text('Continuar no WhatsApp'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancelar'),
            ),
          ),
        ],
      ),
    );
  }
}
