import 'package:flutter/material.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton.primary({
    required this.label,
    required this.onPressed,
    super.key,
  }) : icon = null,
       isPrimary = true;

  const AppActionButton.secondary({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  }) : isPrimary = false;

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: isPrimary
          ? FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF4FC6B6),
                foregroundColor: const Color(0xFF062B26),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: Text(label),
            )
          : OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, size: 28),
              label: Text(label),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF8DBDDC),
                side: const BorderSide(
                  color: Color(0xFF25313B),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}
