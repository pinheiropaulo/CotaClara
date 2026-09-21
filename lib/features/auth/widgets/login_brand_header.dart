import 'package:flutter/material.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _BrandMark(),
        SizedBox(height: 12),
        _BrandName(),
        SizedBox(height: 8),
        Text(
          'Seu consórcio, sem complicação.',
          style: TextStyle(color: Color(0xFF9EACB8), fontSize: 13),
        ),
      ],
    );
  }
}

class _BrandName extends StatelessWidget {
  const _BrandName();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        children: [
          TextSpan(
            text: 'Cota',
            style: TextStyle(color: Color(0xFF8DBDDC)),
          ),
          TextSpan(
            text: 'Clara',
            style: TextStyle(color: Color(0xFF4FC6B6)),
          ),
        ],
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF18222B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF25313B)),
      ),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: const [
          _MarkPiece(Color(0xFF8DBDDC)),
          _MarkPiece(Color(0xFF4FC6B6)),
          _MarkPiece(Color(0xFF286360)),
          _MarkPiece(Color(0xFF8DBDDC), circle: true),
        ],
      ),
    );
  }
}

class _MarkPiece extends StatelessWidget {
  const _MarkPiece(this.color, {this.circle = false});

  final Color color;
  final bool circle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circle ? 99 : 4),
      ),
    );
  }
}
