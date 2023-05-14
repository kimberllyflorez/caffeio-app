// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:caffeio/app/brew/method_selection_page.dart' as _i3;
import 'package:caffeio/app/brew/ratio_page.dart' as _i4;
import 'package:caffeio/app/brew/recommendations_page.dart' as _i5;
import 'package:caffeio/app/home/home_page.dart' as _i2;
import 'package:caffeio/app/method/method_page.dart' as _i6;
import 'package:caffeio/app/settings/settings_page.dart' as _i1;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    MethodSelectionRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MethodSelectionPage(),
      );
    },
    RatioRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RatioPage(),
      );
    },
    RecommendationsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RecommendationsPage(),
      );
    },
    MethodRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MethodPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MethodSelectionPage]
class MethodSelectionRoute extends _i7.PageRouteInfo<void> {
  const MethodSelectionRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MethodSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MethodSelectionRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RatioPage]
class RatioRoute extends _i7.PageRouteInfo<void> {
  const RatioRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RatioRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatioRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RecommendationsPage]
class RecommendationsRoute extends _i7.PageRouteInfo<void> {
  const RecommendationsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RecommendationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecommendationsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MethodPage]
class MethodRoute extends _i7.PageRouteInfo<void> {
  const MethodRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MethodRoute.name,
          initialChildren: children,
        );

  static const String name = 'MethodRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
