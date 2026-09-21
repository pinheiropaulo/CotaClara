import 'package:flutter/material.dart';

class QuotaSelector extends StatelessWidget {
  const QuotaSelector({required this.onPressed, super.key});

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
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              const _QuotaIcon(),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cota de imóvel',
                      style: TextStyle(
                        color: Color(0xFFF1F5F8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Grupo 012160 • Cota 6503',
                      style: TextStyle(
                        color: Color(0xFFAAB7C2),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const _ActiveBadge(),
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
  const _QuotaIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF202932),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.home_outlined, color: Color(0xFF86B7D8)),
    );
  }
}

class _ActiveBadge extends StatelessWidget {
  const _ActiveBadge();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFF18372D),
        borderRadius: BorderRadius.all(Radius.circular(99)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          'Ativa',
          style: TextStyle(color: Color(0xFF63C79D), fontSize: 12),
        ),
      ),
    );
  }
}
