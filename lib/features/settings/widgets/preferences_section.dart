import 'package:cota_clara/features/settings/widgets/settings_list_items.dart';
import 'package:flutter/material.dart';

class SettingsPreferencesSection extends StatelessWidget {
  const SettingsPreferencesSection({super.key});

  void _showComingSoon(BuildContext context, String feature) {
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
        const SettingsSectionTitle(title: 'Preferências'),
        SettingsDropdownItem(
          icon: Icons.language,
          title: 'Idioma',
          value: 'Português (Brasil)',
          onPressed: () => _showComingSoon(context, 'Idioma'),
        ),
        SettingsDropdownItem(
          icon: Icons.light_mode_outlined,
          title: 'Aparência',
          value: 'Escuro',
          onPressed: () => _showComingSoon(context, 'Aparência'),
        ),
      ],
    );
  }
}
