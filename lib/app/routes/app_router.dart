import 'package:cota_clara/app/routes/app_routes.dart';
import 'package:cota_clara/features/assemblies/assemblies_screen.dart';
import 'package:cota_clara/features/assemblies/assembly_details_screen.dart';
import 'package:cota_clara/features/auth/login_screen.dart';
import 'package:cota_clara/features/bids/bid_offer_screen.dart';
import 'package:cota_clara/features/bids/bid_review_screen.dart';
import 'package:cota_clara/features/bids/bid_success_screen.dart';
import 'package:cota_clara/features/billing/bill_screen.dart';
import 'package:cota_clara/features/home/home_screen.dart';
import 'package:cota_clara/features/installments/installments_screen.dart';
import 'package:cota_clara/features/quotas/credit_release_screen.dart';
import 'package:cota_clara/features/quotas/quota_details_screen.dart';
import 'package:cota_clara/features/quotas/quotas_screen.dart';
import 'package:cota_clara/features/quotas/statement_screen.dart';
import 'package:cota_clara/features/quotas/vehicle_quota_details_screen.dart';
import 'package:go_router/go_router.dart';

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
      path: AppRoutes.statement,
      builder: (context, state) => const StatementScreen(),
    ),
    GoRoute(
      path: AppRoutes.creditRelease,
      builder: (context, state) => const CreditReleaseScreen(),
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
    GoRoute(
      path: AppRoutes.assemblies,
      builder: (context, state) => const AssembliesScreen(),
    ),
    GoRoute(
      path: AppRoutes.assemblyDetails,
      builder: (context, state) => const AssemblyDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.bidOffer,
      builder: (context, state) => const BidOfferScreen(),
    ),
    GoRoute(
      path: AppRoutes.bidReview,
      builder: (context, state) => const BidReviewScreen(),
    ),
    GoRoute(
      path: AppRoutes.bidSuccess,
      builder: (context, state) => const BidSuccessScreen(),
    ),
  ],
);
