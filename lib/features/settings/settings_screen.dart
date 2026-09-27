import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/settings/widgets/security_banner.dart';
import 'package:cota_clara/features/settings/widgets/settings_list_items.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _useBiometrics = true;
  bool _allowNotifications = true;
  bool _notifInstallments = true;
  bool _notifAssemblies = true;
  bool _notifBids = true;
  bool _notifCredit = true;
  bool _hideValuesOnStart = false;

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
                  title: 'Configurações',
                  onBackPressed: () => context.pop(),
                  onHelpPressed: () =>
                      _showComingSoon('Ajuda das configurações'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                    children: [
                      _buildSecuritySection(),
                      const SizedBox(height: 32),
                      _buildNotificationsSection(),
                      const SizedBox(height: 32),
                      _buildPrivacySection(),
                      const SizedBox(height: 32),
                      _buildPreferencesSection(),
                      const SizedBox(height: 32),
                      const SecurityBanner(),
                      const SizedBox(height: 32),
                      const Center(
                        child: Text(
                          'CotaClara v2.4.1 (Build 492)',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
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

  Widget _buildSecuritySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: 'Acesso e segurança'),
        SettingsSwitchItem(
          icon: Icons.fingerprint,
          title: 'Acesso com biometria',
          subtitle: 'Use a biometria cadastrada no dispositivo',
          value: _useBiometrics,
          onChanged: (val) => setState(() => _useBiometrics = val),
        ),
        SettingsLinkItem(
          icon: Icons.lock_outline,
          title: 'Alterar senha',
          subtitle: 'Atualize sua senha de acesso',
          onPressed: () => _showComingSoon('Alterar senha'),
        ),
        SettingsLinkItem(
          icon: Icons.smartphone_outlined,
          title: 'Dispositivos conectados',
          subtitle: 'Consulte e encerre outras sessões',
          onPressed: () => _showComingSoon('Dispositivos conectados'),
        ),
      ],
    );
  }

  Widget _buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: 'Notificações'),
        SettingsSwitchItem(
          icon: Icons.notifications_none,
          title: 'Permitir notificações',
          subtitle: 'Receba avisos importantes sobre suas cotas',
          value: _allowNotifications,
          onChanged: (val) {
            setState(() {
              _allowNotifications = val;
              if (!val) {
                _notifInstallments = false;
                _notifAssemblies = false;
                _notifBids = false;
                _notifCredit = false;
              } else {
                _notifInstallments = true;
                _notifAssemblies = true;
                _notifBids = true;
                _notifCredit = true;
              }
            });
          },
        ),
        if (_allowNotifications) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 48),
            child: Column(
              children: [
                SettingsSubCheckbox(
                  title: 'Parcelas e boletos',
                  value: _notifInstallments,
                  onChanged: (val) =>
                      setState(() => _notifInstallments = val ?? false),
                ),
                SettingsSubCheckbox(
                  title: 'Assembleias',
                  value: _notifAssemblies,
                  onChanged: (val) =>
                      setState(() => _notifAssemblies = val ?? false),
                ),
                SettingsSubCheckbox(
                  title: 'Lances',
                  value: _notifBids,
                  onChanged: (val) => setState(() => _notifBids = val ?? false),
                ),
                SettingsSubCheckbox(
                  title: 'Liberação de crédito',
                  value: _notifCredit,
                  onChanged: (val) =>
                      setState(() => _notifCredit = val ?? false),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPrivacySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: 'Privacidade'),
        SettingsSwitchItem(
          icon: Icons.visibility_off_outlined,
          title: 'Ocultar valores ao abrir',
          subtitle: 'Inicie o aplicativo com valores financeiros ocultos',
          value: _hideValuesOnStart,
          onChanged: (val) => setState(() => _hideValuesOnStart = val),
        ),
        SettingsLinkItem(
          icon: Icons.verified_user_outlined,
          title: 'Permissões do aplicativo',
          subtitle: 'Consulte os acessos concedidos',
          onPressed: () => _showComingSoon('Permissões do aplicativo'),
        ),
        SettingsLinkItem(
          icon: Icons.folder_shared_outlined,
          title: 'Privacidade e dados',
          subtitle: 'Gerencie seus dados e sua conta',
          onPressed: () => _showComingSoon('Privacidade e dados'),
        ),
      ],
    );
  }

  Widget _buildPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: 'Preferências'),
        SettingsDropdownItem(
          icon: Icons.language,
          title: 'Idioma',
          value: 'Português (Brasil)',
          onPressed: () => _showComingSoon('Idioma'),
        ),
        SettingsDropdownItem(
          icon: Icons.light_mode_outlined,
          title: 'Aparência',
          value: 'Escuro',
          onPressed: () => _showComingSoon('Aparência'),
        ),
      ],
    );
  }
}
