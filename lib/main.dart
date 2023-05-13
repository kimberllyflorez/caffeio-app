import 'package:caffeio/app/home/home_page.dart';
import 'package:caffeio/app/router/app_router.dart';
import 'package:caffeio/di/di.dart';
import 'package:flutter/material.dart';

void main() {
  final dependency = DependencyInjection();
  dependency.setup();
  runApp(CaffeioApp(appRouter: locator.get<AppRouter>()));
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
