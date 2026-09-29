import 'package:cota_clara/features/settings/widgets/settings_list_items.dart';
import 'package:flutter/material.dart';

class SettingsPrivacySection extends StatefulWidget {
  const SettingsPrivacySection({super.key});

  @override
  State<SettingsPrivacySection> createState() => _SettingsPrivacySectionState();
}

class _SettingsPrivacySectionState extends State<SettingsPrivacySection> {
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
}
