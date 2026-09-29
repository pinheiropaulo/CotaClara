import 'package:cota_clara/app/data/mock_api.dart';
import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/profile/widgets/profile_header.dart';
import 'package:cota_clara/features/profile/widgets/profile_identity_card.dart';
import 'package:cota_clara/features/profile/widgets/profile_logout_button.dart';
import 'package:cota_clara/features/profile/widgets/profile_menu_sections.dart';
import 'package:cota_clara/features/profile/widgets/profile_version_footer.dart';
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
                const ProfileHeader(),
                Expanded(
                  child: FutureBuilder(
                    future: MockApi.instance.getUserProfile(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final userProfile = snapshot.data!;

                      return ListView(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                        children: [
                          ProfileIdentityCard(
                            user: userProfile,
                            onPressed: () => _showComingSoon('Dados da conta'),
                          ),
                          const SizedBox(height: 32),
                          ProfileMenuSections(
                            onShowComingSoon: _showComingSoon,
                          ),
                          const SizedBox(height: 32),
                          ProfileLogoutButton(onLogout: _logout),
                          const SizedBox(height: 32),
                          const ProfileVersionFooter(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
