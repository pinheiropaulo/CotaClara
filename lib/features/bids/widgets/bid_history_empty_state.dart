import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BidHistoryEmptyState extends StatelessWidget {
  const BidHistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: Column(
        children: const [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: AppColors.border,
          ),
          SizedBox(height: 16),
          Text(
            'Nenhum lance ofertado.',
            style: TextStyle(
              color: AppColors.textDisabled,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
