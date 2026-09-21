import 'package:flutter/material.dart';

import 'widgets/login_brand_header.dart';
import 'widgets/login_footer.dart';
import 'widgets/login_form.dart';
import 'widgets/login_introduction.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxHeight < 760;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    isCompact ? 20 : 32,
                    20,
                    24,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 100,
                    ),
                    child: Column(
                      children: [
                        const LoginBrandHeader(),
                        SizedBox(height: isCompact ? 24 : 28),
                        const LoginIntroduction(),
                        const SizedBox(height: 24),
                        const LoginForm(),
                        SizedBox(height: isCompact ? 32 : 48),
                        const LoginFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
