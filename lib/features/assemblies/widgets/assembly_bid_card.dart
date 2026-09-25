import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AssemblyBidCard extends StatelessWidget {
  const AssemblyBidCard({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              _BidIcon(),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Seu lance',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _WaitingBadge(),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'R\$ 12.000,00',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '15% da carta de crédito',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onPressed,
            child: const SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Acompanhar lance',
                      style: TextStyle(
                        color: AppColors.accentBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.accentBlue,
                    size: 21,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BidIcon extends StatelessWidget {
  const _BidIcon();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: SizedBox(
        width: 34,
        height: 34,
        child: Icon(
          Icons.gavel_outlined,
          color: AppColors.accentBlue,
          size: 19,
        ),
      ),
    );
  }
}

class _WaitingBadge extends StatelessWidget {
  const _WaitingBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.border),
      ),
      child: const Text(
        'Aguardando assembleia',
        style: TextStyle(color: AppColors.accentBlue, fontSize: 11),
      ),
    );
  }
}
