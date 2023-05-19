import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/recommendations/recommendations_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class RecommendationsPage extends StatefulWidget {
  final int id;

  const RecommendationsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState
    extends ViewState<RecommendationsPage, RecommendationViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
    viewModel.listVideos(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended brew'),
      ),
      body: StreamBuilder<RecommendationState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state != null) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.videos.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.all(context.theme.spacing.xs),
                        child: Card(
                          elevation: context.theme.spacing.xxs,
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  state.videos[i].url)!,
                              flags: const YoutubePlayerFlags(autoPlay: false),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor:
                                context.theme.palette.grayScale.gray,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CaffeioButton(
          text: 'Next',
          callback: viewModel.onNextPressed,
        ),
      ),
    );
  }
}
