import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/app_action_button.dart';
import '../../../shared/widgets/app_text_form_field.dart';
import '../../../app/routes/app_routes.dart';
import '../formatters/document_input_formatter.dart';
import '../validation/login_validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _document = TextEditingController();
  final _password = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _document.dispose();
    _password.dispose();
    super.dispose();
  }

  void _login() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    context.replace(AppRoutes.home);
  }

  void _simulateBiometrics() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Biometria simulada no protótipo.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: _document,
            label: 'CPF ou CNPJ',
            hint: 'Digite seu documento',
            icon: Icons.badge_outlined,
            keyboardType: TextInputType.number,
            inputFormatters: const [DocumentInputFormatter()],
            validator: LoginValidators.document,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: _password,
            label: 'Senha',
            hint: 'Digite sua senha',
            icon: Icons.lock_outline,
            obscureText: _hidePassword,
            validator: LoginValidators.password,
            suffix: IconButton(
              tooltip: _hidePassword ? 'Exibir senha' : 'Ocultar senha',
              onPressed: () {
                setState(() => _hidePassword = !_hidePassword);
              },
              icon: Icon(
                _hidePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Esqueci minha senha'),
            ),
          ),
          const SizedBox(height: 4),
          AppActionButton.primary(label: 'Entrar', onPressed: _login),
          const SizedBox(height: 12),
          AppActionButton.secondary(
            label: 'Entrar com biometria',
            icon: Icons.fingerprint,
            onPressed: _simulateBiometrics,
          ),
        ],
      ),
    );
  }
}
