import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.onNotificationsPressed,
    required this.onProfilePressed,
    super.key,
  });

  final VoidCallback onNotificationsPressed;
  final VoidCallback onProfilePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 14),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá, Paulo',
                  style: TextStyle(
                    color: Color(0xFFF1F5F8),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Acompanhe seu consórcio',
                  style: TextStyle(color: Color(0xFFAAB7C2), fontSize: 14),
                ),
              ],
            ),
          ),
          _NotificationButton(onPressed: onNotificationsPressed),
          const SizedBox(width: 12),
          _ProfileButton(onPressed: onProfilePressed),
        ],
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          tooltip: 'Notificações',
          onPressed: onPressed,
          style: IconButton.styleFrom(
            fixedSize: const Size(40, 40),
            backgroundColor: const Color(0xFF171E24),
            side: const BorderSide(color: Color(0xFF33414C)),
          ),
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF86B7D8),
          ),
        ),
        const Positioned(
          top: 9,
          right: 9,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFF4FC6B6),
              shape: BoxShape.circle,
            ),
            child: SizedBox(width: 8, height: 8),
          ),
        ),
      ],
    );
  }
}

class _ProfileButton extends StatelessWidget {
  const _ProfileButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Perfil',
      onPressed: onPressed,
      style: IconButton.styleFrom(
        fixedSize: const Size(40, 40),
        backgroundColor: const Color(0xFF202932),
        side: const BorderSide(color: Color(0xFF33414C)),
      ),
      icon: const Icon(Icons.person, color: Color(0xFF86B7D8)),
    );
  }
}
