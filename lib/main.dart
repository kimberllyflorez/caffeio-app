import 'package:caffeio/app/di/di.dart';
import 'package:caffeio/app/router/app_router.dart';
import 'package:caffeio/app/router/guards/first_user_brew_guard.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await DependencyInjection.setup();
  final appRouter = AppRouter(locator.get<FirstUserBrewGuard>());
  runApp(CaffeioApp(appRouter: appRouter));
}

class CaffeioApp extends StatelessWidget {
  final AppRouter appRouter;

  const CaffeioApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Caffeio App',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: context.theme.palette.blueScale.primaryColor,
        ),
        useMaterial3: true,
      ),
    );
  }
}
