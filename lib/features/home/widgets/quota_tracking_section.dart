import 'package:flutter/material.dart';

class QuotaTrackingSection extends StatelessWidget {
  const QuotaTrackingSection({required this.onBidPressed, super.key});

  final VoidCallback onBidPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Acompanhe sua cota',
          style: TextStyle(
            color: Color(0xFFF1F5F8),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: _AssemblyCard()),
              const SizedBox(width: 12),
              Expanded(child: _BidCard(onPressed: onBidPressed)),
            ],
          ),
        ),
      ],
    );
  }
}

class _AssemblyCard extends StatelessWidget {
  const _AssemblyCard();

  @override
  Widget build(BuildContext context) {
    return const _TrackingCard(
      icon: Icons.event_outlined,
      title: 'Próxima\nassembleia',
      description: '25 set. • 19h',
      footer: Row(
        children: [
          Icon(Icons.check_circle_outline, color: Color(0xFF63C79D), size: 16),
          SizedBox(width: 6),
          Text(
            'Agendada',
            style: TextStyle(color: Color(0xFF63C79D), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _BidCard extends StatelessWidget {
  const _BidCard({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _TrackingCard(
      icon: Icons.gavel_outlined,
      title: 'Lance',
      description: 'Nenhum lance ativo',
      footer: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                'Ofertar lance',
                style: TextStyle(
                  color: Color(0xFF4FC6B6),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 2),
              Icon(Icons.chevron_right, color: Color(0xFF4FC6B6), size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrackingCard extends StatelessWidget {
  const _TrackingCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.footer,
  });

  final IconData icon;
  final String title;
  final String description;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 220),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF171E24),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF33414C)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF202932),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF86B7D8), size: 20),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF1F5F8),
              fontSize: 16,
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(color: Color(0xFFAAB7C2), fontSize: 14),
          ),
          const Spacer(),
          footer,
        ],
      ),
    );
  }
}
