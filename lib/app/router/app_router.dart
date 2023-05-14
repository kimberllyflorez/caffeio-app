import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', initial: true),
        AutoRoute(page: MethodSelectionRoute.page),
        AutoRoute(page: RatioRoute.page),
        AutoRoute(page: RecommendationsRoute.page),
        AutoRoute(page: MethodRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}
