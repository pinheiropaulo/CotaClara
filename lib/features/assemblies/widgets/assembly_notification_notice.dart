import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AssemblyNotificationNotice extends StatelessWidget {
  const AssemblyNotificationNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.notifications_none,
            color: AppColors.accentBlue,
            size: 21,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Você será notificado quando o resultado da próxima assembleia estiver disponível.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
