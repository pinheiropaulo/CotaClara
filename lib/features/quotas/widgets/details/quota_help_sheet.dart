import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import 'quota_help_option.dart';

Future<void> showQuotaHelpSheet(
  BuildContext context, {
  required ValueChanged<String> onOptionSelected,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.65),
    constraints: const BoxConstraints(maxWidth: 430),
    builder: (sheetContext) => SizedBox(
      width: double.infinity,
      child: QuotaHelpSheet(
        onClose: () => Navigator.of(sheetContext).pop(),
        onOptionSelected: (option) {
          Navigator.of(sheetContext).pop();
          onOptionSelected(option);
        },
      ),
    ),
  );
}

class QuotaHelpSheet extends StatelessWidget {
  const QuotaHelpSheet({
    required this.onClose,
    required this.onOptionSelected,
    super.key,
  });

  final VoidCallback onClose;
  final ValueChanged<String> onOptionSelected;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    return Material(
      color: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        side: BorderSide(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 24 + bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textDisabled,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ajuda com esta cota',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Encontre a opção que melhor descreve sua dúvida.',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Fechar',
                  visualDensity: VisualDensity.compact,
                  onPressed: onClose,
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                    size: 21,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            QuotaHelpOption(
              icon: Icons.receipt_long_outlined,
              title: 'Dúvidas sobre parcelas',
              onPressed: () => onOptionSelected('Dúvidas sobre parcelas'),
            ),
            const SizedBox(height: 8),
            QuotaHelpOption(
              icon: Icons.calendar_month_outlined,
              title: 'Dúvidas sobre assembleias',
              onPressed: () => onOptionSelected('Dúvidas sobre assembleias'),
            ),
            const SizedBox(height: 8),
            QuotaHelpOption(
              icon: Icons.build_outlined,
              title: 'Dúvidas sobre lance',
              onPressed: () => onOptionSelected('Dúvidas sobre lance'),
            ),
            const SizedBox(height: 8),
            QuotaHelpOption(
              icon: Icons.chat_bubble_outline,
              title: 'Falar com atendimento',
              subtitle: 'Converse com a nossa Central',
              highlighted: true,
              onPressed: () => onOptionSelected('Atendimento'),
            ),
          ],
        ),
      ),
    );
  }
}
