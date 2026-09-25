import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NextInstallmentHighlight extends StatelessWidget {
  const NextInstallmentHighlight({
    required this.onPayPressed,
    required this.onDetailsPressed,
    super.key,
  });

  final VoidCallback onPayPressed;
  final VoidCallback onDetailsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.border, AppColors.primary],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'PRÓXIMA PARCELA',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      _PendingBadge(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'R\$ 842,50',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Vencimento em 15 de setembro de 2026',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: onPayPressed,
                      icon: const Icon(Icons.receipt_long_outlined, size: 20),
                      label: const Text('Pagar boleto'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: TextButton(
                      onPressed: onDetailsPressed,
                      child: const Text('Ver detalhes'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PendingBadge extends StatelessWidget {
  const _PendingBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.warningContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.schedule, color: AppColors.warning, size: 14),
            SizedBox(width: 4),
            Text(
              'Pendente',
              style: TextStyle(color: AppColors.warning, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
