import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';

import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class RecommendationState extends Equatable {
  const RecommendationState();

  RecommendationsRoute copyWith({
    String? ratio,
    List<String>? listRatios,
  }) {
    return const RecommendationsRoute();
  }

  @override
  List<Object?> get props => [];
}

class RecommendationViewModel extends ViewModel {
  final _subscription = CompositeSubscription();

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  void init() {}

  void nextPage() {
    _router.add(RouteSpec.push(route: const TimerRoute()));
  }

  @override
  void dispose() {
    _subscription.cancel();
  }
}
