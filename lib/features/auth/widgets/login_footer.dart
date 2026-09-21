import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFF18222B),
            borderRadius: BorderRadius.all(Radius.circular(24)),
            border: Border.fromBorderSide(
              BorderSide(color: Color(0xFF25313B)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  color: Color(0xFF8DBDDC),
                  size: 16,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Seus dados são protegidos durante o acesso.',
                    style: TextStyle(
                      color: Color(0xFF9EACB8),
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Termos de uso   •   Política de privacidade',
          style: TextStyle(color: Color(0xFF9EACB8), fontSize: 12),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Versão 1.0.0',
          style: TextStyle(color: Color(0xFF9EACB8), fontSize: 12),
        ),
      ],
    );
  }
}
