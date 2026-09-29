import 'package:cota_clara/features/settings/widgets/settings_list_items.dart';
import 'package:flutter/material.dart';

class SettingsNotificationsSection extends StatefulWidget {
  const SettingsNotificationsSection({super.key});

  @override
  State<SettingsNotificationsSection> createState() =>
      _SettingsNotificationsSectionState();
}

class _SettingsNotificationsSectionState
    extends State<SettingsNotificationsSection> {
  bool _allowNotifications = true;
  bool _notifInstallments = true;
  bool _notifAssemblies = true;
  bool _notifBids = true;
  bool _notifCredit = true;

  @override
  Widget build(BuildContext context) {
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
}
