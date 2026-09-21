import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  bool _showValue = true;

  @override
  Widget build(BuildContext context) {
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
            _showValue ? 'R\$ 80.000,00' : 'R\$ ••••••••',
            style: const TextStyle(
              color: Color(0xFFF1F5F8),
              fontSize: 32,
              height: 1.1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          const Row(
            children: [
              _QuotaStatus(),
              Spacer(),
              Text(
                'Prazo: 180 meses',
                style: TextStyle(color: Color(0xFF86B7D8), fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuotaStatus extends StatelessWidget {
  const _QuotaStatus();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0x337FA9C5),
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFF4FC6B6),
                shape: BoxShape.circle,
              ),
              child: SizedBox(width: 7, height: 7),
            ),
            SizedBox(width: 7),
            Text(
              'Não contemplada',
              style: TextStyle(
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
