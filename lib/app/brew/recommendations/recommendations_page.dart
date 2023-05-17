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
  const RecommendationsPage({Key? key}) : super(key: key);

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState
    extends ViewState<RecommendationsPage, RecommendationViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: StreamBuilder<RecommendationState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state != null) {
                return Column(
                  children: [
                    const Text('Recommended brewing'),
                    const Text('Technic V60'),
                    Container(
                      margin: context.theme.insets.xs,
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId:
                              YoutubePlayer.convertUrlToId(state.urlVideo)!,
                          flags: const YoutubePlayerFlags(autoPlay: false),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor:
                            context.theme.palette.grayScale.gray,
                      ),
                    ),
                    const Text('4:5'),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 160,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.cyan),
                    ),
                    const Text('Others'),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.cyan),
                    ),
                  ],
                );
              }
              return const LoadingIndicator();
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CaffeioButton(
          text: 'Next',
          callback: viewModel.nextPage,
        ),
      ),
    );
  }
}
