import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AssemblyResultCard extends StatelessWidget {
  const AssemblyResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.financialCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.accentBlue, size: 20),
              SizedBox(width: 10),
              Text(
                'RESULTADO DA SUA COTA',
                style: TextStyle(
                  color: AppColors.accentBlue,
                  fontSize: 12,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Não contemplada',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Sua cota não foi contemplada nesta assembleia.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          SizedBox(height: 16),
          Divider(height: 1, color: Color(0x557BA7C1)),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.verified_user_outlined,
                color: AppColors.accentBlue,
                size: 18,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Você continua participando das próximas assembleias normalmente.',
                  style: TextStyle(
                    color: AppColors.accentBlue,
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AssemblyBidResultCard extends StatelessWidget {
  const AssemblyBidResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Seu lance',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              _BidStatusBadge(),
            ],
          ),
          SizedBox(height: 14),
          Text(
            'Valor ofertado',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
          SizedBox(height: 3),
          Text(
            'R\$ 12.000,00',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          _BidDetails(),
          SizedBox(height: 14),
          Text(
            'A oferta foi válida somente para esta assembleia.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _BidStatusBadge extends StatelessWidget {
  const _BidStatusBadge();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          'Não contemplado',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
        ),
      ),
    );
  }
}

class _BidDetails extends StatelessWidget {
  const _BidDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        '15% da carta de crédito  ·  Lance livre',
        style: TextStyle(color: AppColors.accentBlue, fontSize: 12),
      ),
    );
  }
}
