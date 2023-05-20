import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_method_videos_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_methods_video_uc.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:caffeio/entities/brew/method_video.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class RecommendationState extends Equatable {
  final List<MethodVideo> videos;
  final String urlVideo;

  const RecommendationState({
    this.videos = const [],
    this.urlVideo = "",
  });

  RecommendationState copyWith({
    List<MethodVideo>? videos,
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
  final GetMethodVideosUseCase _getMethodVideosUseCase;
  final FetchMethodVideosUseCase _fetchMethodVideosUseCase;

  RecommendationViewModel(
    this._getMethodVideosUseCase,
    this._fetchMethodVideosUseCase,
  );

  final _state = BehaviorSubject<RecommendationState>.seeded(
    const RecommendationState(),
  );

  Stream<RecommendationState> get state => _state;
  final _subscription = CompositeSubscription();

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  void init() {}

  Future<void> listVideos(BrewingMethod method) async {
    await _fetchMethodVideosUseCase(method.id);
    _subscription.add(_getMethodVideosUseCase().listen((event) {
      _state.add(_state.value.copyWith(videos: event));
    }));
  }

  void onNextPressed(BrewingMethod method) {
    _router.add(RouteSpec.push(route: RatioRoute(brewingMethod: method)));
  }

  @override
  void dispose() {
    _state.close();
    _subscription.cancel();
    //_state.value.controller.dispose();
  }
}
