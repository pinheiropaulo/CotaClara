import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class BillSecondaryActions extends StatelessWidget {
  const BillSecondaryActions({
    required this.onViewPressed,
    required this.onSharePressed,
    super.key,
  });

  final VoidCallback onViewPressed;
  final VoidCallback onSharePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.description_outlined,
            label: 'Visualizar',
            onPressed: onViewPressed,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.share_outlined,
            label: 'Compartilhar',
            onPressed: onSharePressed,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: FittedBox(child: Text(label)),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accentBlue,
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
