import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/guards/first_user_brew_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  final FirstUserBrewGuard _firstUserBrewGuard;

  AppRouter(this._firstUserBrewGuard);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          guards: [_firstUserBrewGuard],
          initial: true,
        ),
        AutoRoute(page: MethodSelectionRoute.page),
        AutoRoute(page: RatioRoute.page),
        AutoRoute(page: RecommendationsRoute.page),
        AutoRoute(page: MethodRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: TimerRoute.page),
        AutoRoute(page: OnboardingRoute.page),
      ];
}
