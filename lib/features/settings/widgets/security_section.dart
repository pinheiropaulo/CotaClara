import 'package:cota_clara/features/settings/widgets/settings_list_items.dart';
import 'package:flutter/material.dart';

class SettingsSecuritySection extends StatefulWidget {
  const SettingsSecuritySection({super.key});

  @override
  State<SettingsSecuritySection> createState() =>
      _SettingsSecuritySectionState();
}

class _SettingsSecuritySectionState extends State<SettingsSecuritySection> {
  bool _useBiometrics = true;

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
}
