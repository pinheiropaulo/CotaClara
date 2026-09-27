import 'package:flutter/material.dart';

class QuickAccessSection extends StatelessWidget {
  const QuickAccessSection({required this.onItemPressed, super.key});

  final ValueChanged<String> onItemPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Acesso rápido',
          style: TextStyle(
            color: Color(0xFFAAB7C2),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _QuickAccessItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Extrato',
                  onPressed: () => onItemPressed('Extrato'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickAccessItem(
                  icon: Icons.format_list_bulleted_rounded,
                  label: 'Parcelas',
                  onPressed: () => onItemPressed('Parcelas'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickAccessItem(
                  icon: Icons.credit_score_outlined,
                  label: 'Liberação\nde crédito',
                  onPressed: () => onItemPressed('Liberação de crédito'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF202932),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF86B7D8), size: 20),
              ),
              const SizedBox(height: 14),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFF1F5F8),
                  fontSize: 13,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
