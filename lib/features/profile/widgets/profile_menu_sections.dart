import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/profile/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMenuSections extends StatelessWidget {
  final void Function(String) onShowComingSoon;

  const ProfileMenuSections({super.key, required this.onShowComingSoon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ProfileSectionTitle(title: 'SUA CONTA'),
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: 'Dados pessoais',
          subtitle: 'Nome, documento e nascimento',
          onPressed: () => onShowComingSoon('Dados pessoais'),
        ),
        ProfileMenuItem(
          icon: Icons.alternate_email,
          title: 'Dados de contato',
          subtitle: 'Telefone, e-mail e endereço',
          onPressed: () => onShowComingSoon('Dados de contato'),
        ),
        ProfileMenuItem(
          icon: Icons.shield_outlined,
          title: 'Segurança',
          subtitle: 'Senha e acesso ao aplicativo',
          onPressed: () => onShowComingSoon('Segurança'),
        ),
        const SizedBox(height: 24),

        const ProfileSectionTitle(title: 'PREFERÊNCIAS'),
        ProfileMenuItem(
          icon: Icons.settings_outlined,
          title: 'Configurações',
          subtitle: 'Biometria, notificações e aparência',
          onPressed: () => context.push(AppRoutes.settings),
        ),
        ProfileMenuItem(
          icon: Icons.security_outlined,
          title: 'Privacidade e dados',
          subtitle: 'Permissões e gerenciamento da conta',
          onPressed: () => onShowComingSoon('Privacidade e dados'),
        ),
        const SizedBox(height: 24),

        const ProfileSectionTitle(title: 'SUPORTE'),
        ProfileMenuItem(
          icon: Icons.help_outline,
          title: 'Central de ajuda',
          subtitle: 'Encontre respostas para suas dúvidas',
          onPressed: () => context.push(AppRoutes.support),
        ),
        ProfileMenuItem(
          icon: Icons.headset_mic_outlined,
          title: 'Fale conosco',
          subtitle: 'Consulte os canais de atendimento',
          onPressed: () => context.push(AppRoutes.support),
        ),
        const SizedBox(height: 24),

        const ProfileSectionTitle(title: 'SOBRE'),
        ProfileSimpleItem(
          title: 'Termos de uso',
          onPressed: () => onShowComingSoon('Termos de uso'),
        ),
        ProfileSimpleItem(
          title: 'Política de privacidade',
          onPressed: () => onShowComingSoon('Política de privacidade'),
        ),
        ProfileSimpleItem(
          title: 'Sobre o CotaClara',
          onPressed: () => onShowComingSoon('Sobre o CotaClara'),
        ),
      ],
    );
  }
}
