import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class RecommendationState extends Equatable {
  final List<String> videos;
  final String urlVideo;

  const RecommendationState({
    this.videos = const [],
    this.urlVideo = "",
  });

  RecommendationState copyWith({
    List<String>? videos,
    String? urlVideo,
  }) {
    return RecommendationState(
      videos: videos ?? this.videos,
      urlVideo: urlVideo ?? this.urlVideo,
    );
  }

  @override
  List<Object?> get props => [videos];
}

class RecommendationViewModel extends ViewModel {
  final _state = BehaviorSubject<RecommendationState>.seeded(
    const RecommendationState(),
  );

  Stream<RecommendationState> get state => _state;
  final _subscription = CompositeSubscription();

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  void init() {
    listVideos();
  }

  void listVideos() {
    final List<String> list = [
      "https://www.youtube.com/watch?v=1oB1oDrDkHM&t=3s",
      "https://www.youtube.com/watch?v=K_r5kpXPRYo",
      "https://www.youtube.com/watch?v=K_r5kpXPRYo",
    ];
    _state.add(RecommendationState(videos: list));
  }

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
