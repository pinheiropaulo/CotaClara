import 'package:go_router/go_router.dart';

import '../../features/auth/login_screen.dart';
import '../../features/billing/bill_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/installments/installments_screen.dart';
import '../../features/quotas/quota_details_screen.dart';
import '../../features/quotas/quotas_screen.dart';
import '../../features/quotas/vehicle_quota_details_screen.dart';
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.root,
      redirect: (context, state) => AppRoutes.login,
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.quotas,
      builder: (context, state) => const QuotasScreen(),
    ),
    GoRoute(
      path: AppRoutes.quotaDetails,
      builder: (context, state) => const QuotaDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.vehicleQuotaDetails,
      builder: (context, state) => const VehicleQuotaDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.installments,
      builder: (context, state) => const InstallmentsScreen(),
    ),
    GoRoute(
      path: AppRoutes.bill,
      builder: (context, state) => const BillScreen(),
    ),
  ],
);
