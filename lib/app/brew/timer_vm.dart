import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/subjects.dart';

class TimerState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class TimerViewModel extends ViewModel{

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;
  @override
  void dispose() {
    // TODO: implement dispose
  }

  void nextPage() {
    _router.add(RouteSpec.push(route: const HomeRoute()));
  }
  @override
  void init() {
    // TODO: implement init
  }
}