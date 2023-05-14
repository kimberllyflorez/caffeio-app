import 'package:caffeio/app/router/app_router.dart';
import 'package:caffeio/app/di/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await DependencyInjection.setup();
  runApp(CaffeioApp());
}

class CaffeioApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  CaffeioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
