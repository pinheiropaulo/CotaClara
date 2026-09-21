import 'package:flutter/material.dart';

import '../features/auth/login_screen.dart';
import '../features/home/home_screen.dart';
import '../features/quotas/quotas_screen.dart';
import '../features/quotas/quota_details_screen.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class CotaClaraApp extends StatelessWidget {
  const CotaClaraApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'CotaClara',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.dark,
    initialRoute: AppRoutes.login,
    routes: {
      AppRoutes.login: (_) => const LoginScreen(),
      AppRoutes.home: (_) => const HomeScreen(),
      AppRoutes.quotas: (_) => const QuotasScreen(),
      AppRoutes.quotaDetails: (_) => const QuotaDetailsScreen(),
    },
  );
}
