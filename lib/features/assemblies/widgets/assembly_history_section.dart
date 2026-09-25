import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/assemblies/models/assembly_history.dart';
import 'package:flutter/material.dart';

class AssemblyHistorySection extends StatelessWidget {
  const AssemblyHistorySection({
    required this.items,
    required this.onItemPressed,
    required this.onViewAllPressed,
    super.key,
  });

  final List<AssemblyHistory> items;
  final ValueChanged<AssemblyHistory> onItemPressed;
  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Histórico de assembleias',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (var index = 0; index < items.length; index++) ...[
                _HistoryTile(
                  item: items[index],
                  onPressed: () => onItemPressed(items[index]),
                ),
                if (index < items.length - 1)
                  const Divider(height: 1, color: AppColors.border),
              ],
            ],
          ),
        ),
        const SizedBox(height: 14),
        Center(
          child: TextButton.icon(
            onPressed: onViewAllPressed,
            icon: const Icon(Icons.history, size: 19),
            label: const Text('Ver histórico completo'),
          ),
        ),
      ],
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.item, required this.onPressed});

  final AssemblyHistory item;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 5,
                    children: [
                      Text(
                        item.date,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const _ResultBadge(),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Assembleia mensal  •  ${item.result}',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              color: AppColors.accentBlue,
              size: 21,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultBadge extends StatelessWidget {
  const _ResultBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.successContainer,
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          'Resultado disponível',
          style: TextStyle(color: AppColors.success, fontSize: 11),
        ),
      ),
    );
  }
}
