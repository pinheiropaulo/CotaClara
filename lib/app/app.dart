import 'package:cota_clara/app/routes/app_router.dart';
import 'package:cota_clara/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CotaClaraApp extends StatelessWidget {
  const CotaClaraApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'CotaClara',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.dark,
    routerConfig: appRouter,
  );
}
