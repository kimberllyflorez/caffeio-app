import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:rxdart/rxdart.dart';

class SettingsViewModel extends ViewModel {
  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  void init() {}

  void onLoginPressed() {
    _router.add(RouteSpec.push(route: const LoginRoute()));
  }

  @override
  void dispose() {}
}
