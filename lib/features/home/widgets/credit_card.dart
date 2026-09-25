import 'package:cota_clara/features/quotas/models/quota_overview.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({this.quota, super.key});

  final QuotaOverview? quota;

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  bool _showValue = true;

  @override
  Widget build(BuildContext context) {
    final creditValue = widget.quota?.creditValue ?? 'R\$ 80.000,00';
    final duration = widget.quota?.duration ?? '180 meses';
    final isContemplated = widget.quota?.isContemplated ?? false;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF244A64),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x6633414C)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Carta de crédito',
                  style: TextStyle(color: Color(0xFF86B7D8), fontSize: 14),
                ),
              ),
              IconButton(
                tooltip: _showValue ? 'Ocultar valor' : 'Exibir valor',
                onPressed: () => setState(() => _showValue = !_showValue),
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  _showValue
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFF86B7D8),
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            _showValue ? creditValue : 'R\$ ••••••••',
            style: const TextStyle(
              color: Color(0xFFF1F5F8),
              fontSize: 32,
              height: 1.1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              _QuotaStatus(isContemplated: isContemplated),
              const Spacer(),
              Text(
                'Prazo: $duration',
                style: const TextStyle(color: Color(0xFF86B7D8), fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuotaStatus extends StatelessWidget {
  const _QuotaStatus({required this.isContemplated});

  final bool isContemplated;

  @override
  Widget build(BuildContext context) {
    final color = isContemplated
        ? const Color(0xFF4FC6B6)
        : const Color(0xFFF3B75C);
    final bgColor = isContemplated
        ? const Color(0x334FC6B6)
        : const Color(0x33F3B75C);
    final text = isContemplated ? 'Contemplada' : 'Não contemplada';

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: const SizedBox(width: 7, height: 7),
            ),
            const SizedBox(width: 7),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFF1F5F8),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
