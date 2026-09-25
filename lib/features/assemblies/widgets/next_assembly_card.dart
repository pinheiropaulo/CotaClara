import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NextAssemblyCard extends StatelessWidget {
  const NextAssemblyCard({required this.onDetailsPressed, super.key});

  final VoidCallback onDetailsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.financialCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          const Positioned(
            right: -48,
            top: -48,
            child: _BackgroundCircle(size: 190),
          ),
          const Positioned(
            right: -12,
            top: -12,
            child: _BackgroundCircle(size: 130),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.event_outlined,
                      color: AppColors.accentBlue,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'PRÓXIMA ASSEMBLEIA',
                        style: TextStyle(
                          color: AppColors.accentBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                    _ScheduledBadge(),
                  ],
                ),
                const SizedBox(height: 24),
                const Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Text(
                      '25 de setembro',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        '• 19h',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: AppColors.warning,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Ofertas de lance até 24 de setembro, às 18h',
                          style: TextStyle(
                            color: AppColors.warning,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: onDetailsPressed,
                    child: const Text('Ver detalhes'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduledBadge extends StatelessWidget {
  const _ScheduledBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: const Text(
        'Agendada',
        style: TextStyle(color: AppColors.textPrimary, fontSize: 12),
      ),
    );
  }
}

class _BackgroundCircle extends StatelessWidget {
  const _BackgroundCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
    );
  }
}
