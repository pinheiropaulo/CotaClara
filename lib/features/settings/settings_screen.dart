import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/settings/widgets/notifications_section.dart';
import 'package:cota_clara/features/settings/widgets/preferences_section.dart';
import 'package:cota_clara/features/settings/widgets/privacy_section.dart';
import 'package:cota_clara/features/settings/widgets/security_banner.dart';
import 'package:cota_clara/features/settings/widgets/security_section.dart';
import 'package:cota_clara/shared/widgets/app_task_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showComingSoon(BuildContext context, String feature) {
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
                      _showComingSoon(context, 'Ajuda das configurações'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                    children: const [
                      SettingsSecuritySection(),
                      SizedBox(height: 32),
                      SettingsNotificationsSection(),
                      SizedBox(height: 32),
                      SettingsPrivacySection(),
                      SizedBox(height: 32),
                      SettingsPreferencesSection(),
                      SizedBox(height: 32),
                      SecurityBanner(),
                      SizedBox(height: 32),
                      Center(
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
}
