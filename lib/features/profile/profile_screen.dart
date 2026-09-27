import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:cota_clara/features/profile/widgets/profile_identity_card.dart';
import 'package:cota_clara/features/profile/widgets/profile_menu_item.dart';
import 'package:cota_clara/shared/widgets/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature será implementado em uma próxima etapa.'),
      ),
    );
  }

  void _logout() {
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: 3,
        onDestinationSelected: (index) {
          if (index == 3) return;
          if (index == 0) {
            context.go(AppRoutes.home);
          } else if (index == 1) {
            context.go(AppRoutes.quotas);
          } else if (index == 2) {
            context.go(AppRoutes.services);
          }
        },
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                    children: [
                      ProfileIdentityCard(
                        onPressed: () => _showComingSoon('Dados da conta'),
                      ),
                      const SizedBox(height: 32),

                      const ProfileSectionTitle(title: 'SUA CONTA'),
                      ProfileMenuItem(
                        icon: Icons.person_outline,
                        title: 'Dados pessoais',
                        subtitle: 'Nome, documento e nascimento',
                        onPressed: () => _showComingSoon('Dados pessoais'),
                      ),
                      ProfileMenuItem(
                        icon: Icons.alternate_email,
                        title: 'Dados de contato',
                        subtitle: 'Telefone, e-mail e endereço',
                        onPressed: () => _showComingSoon('Dados de contato'),
                      ),
                      ProfileMenuItem(
                        icon: Icons.shield_outlined,
                        title: 'Segurança',
                        subtitle: 'Senha e acesso ao aplicativo',
                        onPressed: () => _showComingSoon('Segurança'),
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
                        onPressed: () => _showComingSoon('Privacidade e dados'),
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
                        onPressed: () => _showComingSoon('Termos de uso'),
                      ),
                      ProfileSimpleItem(
                        title: 'Política de privacidade',
                        onPressed: () =>
                            _showComingSoon('Política de privacidade'),
                      ),
                      ProfileSimpleItem(
                        title: 'Sobre o CotaClara',
                        onPressed: () => _showComingSoon('Sobre o CotaClara'),
                      ),
                      const SizedBox(height: 32),
                      _buildLogoutButton(),
                      const SizedBox(height: 32),
                      _buildVersionFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 12, 8),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perfil',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Sua conta e preferências',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.push(AppRoutes.notifications),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: _logout,
        icon: const Icon(Icons.logout, size: 20),
        label: const Text('Sair da conta'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.error,
          side: const BorderSide(color: AppColors.error),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildVersionFooter() {
    return const Center(
      child: Column(
        children: [
          Text(
            'CotaClara',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Versão 1.0.0',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
