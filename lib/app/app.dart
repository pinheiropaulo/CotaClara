import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'theme/app_theme.dart';

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
