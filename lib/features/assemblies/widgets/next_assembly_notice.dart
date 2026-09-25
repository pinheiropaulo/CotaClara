import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NextAssemblyNotice extends StatelessWidget {
  const NextAssemblyNotice({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.event_repeat_outlined,
                color: AppColors.accentBlue,
                size: 24,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Próxima assembleia',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '25 de outubro de 2026, às 19h',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              border: Border.all(color: const Color(0xFF5C4219)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.schedule_outlined,
                  color: AppColors.warning,
                  size: 18,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Ofertas de lance até 24 de outubro, às 18h',
                    style: TextStyle(color: AppColors.warning, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: onPressed,
              child: const Text('Ver próxima assembleia'),
            ),
          ),
        ],
      ),
    );
  }
}

class NextAssemblyNotification extends StatelessWidget {
  const NextAssemblyNotification({super.key});

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
          Icon(Icons.notifications_none, color: AppColors.accentBlue, size: 22),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Você receberá uma notificação quando uma nova oferta de lance estiver disponível.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
