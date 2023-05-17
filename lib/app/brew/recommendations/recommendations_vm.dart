import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class RecommendationState extends Equatable {
  final String urlVideo;

  const RecommendationState({
    this.urlVideo = "",
  });

  RecommendationState copyWith({
    String? urlVideo,
  }) {
    return RecommendationState(
      urlVideo: urlVideo ?? this.urlVideo,
    );
  }

  @override
  List<Object?> get props => [];
}

class RecommendationViewModel extends ViewModel {
  final _state = BehaviorSubject<RecommendationState>.seeded(
    const RecommendationState(
        urlVideo: "https://www.youtube.com/watch?v=1oB1oDrDkHM&t=3s"),
  );

  Stream<RecommendationState> get state => _state;
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
    _state.close();
    _subscription.cancel();
    //_state.value.controller.dispose();
  }
}
