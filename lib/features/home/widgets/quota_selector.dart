import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class QuotaSelector extends StatelessWidget {
  const QuotaSelector({
    required this.onPressed,
    this.quota,
    super.key,
  });

  final VoidCallback onPressed;
  final QuotaOverview? quota;

  @override
  Widget build(BuildContext context) {
    final title = quota?.title ?? 'Cota de imóvel';
    final subtitle = quota != null
        ? 'Grupo ${quota!.group} • Cota ${quota!.number}'
        : 'Grupo 012160 • Cota 6503';
    final category = quota?.category ?? QuotaCategory.property;
    final status = quota?.status == QuotaStatus.underReview
        ? 'Em análise'
        : 'Ativa';

    return Material(
      color: const Color(0xFF171E24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF33414C)),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              _QuotaIcon(category: category),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFFF1F5F8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFFAAB7C2),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              _ActiveBadge(label: status),
              const SizedBox(width: 6),
              const Icon(Icons.expand_more, color: Color(0xFFAAB7C2)),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuotaIcon extends StatelessWidget {
  const _QuotaIcon({required this.category});

  final QuotaCategory category;

  IconData get icon {
    switch (category) {
      case QuotaCategory.property:
        return Icons.home_work_outlined;
      case QuotaCategory.vehicle:
        return Icons.directions_car_outlined;
      case QuotaCategory.services:
        return Icons.handyman_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF202932),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFF86B7D8)),
    );
  }
}

class _ActiveBadge extends StatelessWidget {
  const _ActiveBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final bool isWarning = label == 'Em análise';
    final color = isWarning ? const Color(0xFFF3B75C) : const Color(0xFF63C79D);
    final bgColor = isWarning
        ? const Color(0xFF302516)
        : const Color(0xFF18372D);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          label,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ),
    );
  }
}
