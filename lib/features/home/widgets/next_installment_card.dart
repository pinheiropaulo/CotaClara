import 'package:flutter/material.dart';

class NextInstallmentCard extends StatelessWidget {
  const NextInstallmentCard({
    required this.onPayPressed,
    required this.onViewInstallmentsPressed,
    super.key,
  });

  final VoidCallback onPayPressed;
  final VoidCallback onViewInstallmentsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF171E24),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF33414C)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Próxima parcela',
                  style: TextStyle(
                    color: Color(0xFFAAB7C2),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _PendingBadge(),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'R\$ 842,50',
            style: TextStyle(
              color: Color(0xFFF1F5F8),
              fontSize: 32,
              height: 1.1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: Color(0xFFAAB7C2),
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Vence em 15 de setembro',
                style: TextStyle(color: Color(0xFFAAB7C2), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton.icon(
              onPressed: onPayPressed,
              icon: const Icon(Icons.qr_code_2, size: 22),
              label: const Text('Pagar boleto'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF4FC6B6),
                foregroundColor: const Color(0xFF082E29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: onViewInstallmentsPressed,
              child: const Text('Ver parcelas'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingBadge extends StatelessWidget {
  const _PendingBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFF3C301D),
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          'Pendente',
          style: TextStyle(color: Color(0xFFF3B75C), fontSize: 12),
        ),
      ),
    );
  }
}
