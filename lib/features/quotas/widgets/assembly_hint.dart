import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class AssemblyHint extends StatelessWidget {
  const AssemblyHint({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: const Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            children: [
              _AssemblyIcon(),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Próxima assembleia geral',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Lances abertos até 14 de setembro',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.accentBlue,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AssemblyIcon extends StatelessWidget {
  const _AssemblyIcon();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
      ),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Icon(
          Icons.how_to_vote_outlined,
          color: AppColors.accentBlue,
          size: 20,
        ),
      ),
    );
  }
}
