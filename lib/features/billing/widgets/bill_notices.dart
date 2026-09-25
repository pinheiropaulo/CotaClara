import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BillNotices extends StatelessWidget {
  const BillNotices({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _CompensationNotice(),
        SizedBox(height: 28),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified_user_outlined,
                color: AppColors.accentBlue,
                size: 20,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Confira o beneficiário e o valor antes de concluir o pagamento.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CompensationNotice extends StatelessWidget {
  const _CompensationNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AppColors.accentBlue, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'O pagamento pode levar até 3 dias úteis para aparecer no extrato.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
