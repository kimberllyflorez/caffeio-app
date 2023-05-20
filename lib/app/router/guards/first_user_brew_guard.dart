import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_user_brew_uc.dart';

class FirstUserBrewGuard extends AutoRouteGuard {
  final GetUserBrewUseCase _getUserBrewUseCase;

  FirstUserBrewGuard(this._getUserBrewUseCase);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final userBrew = _getUserBrewUseCase();
    if (userBrew != null) {
      resolver.next(true);
    } else {
      router.replaceAll([const OnboardingRoute()]);
    }
  }
}
