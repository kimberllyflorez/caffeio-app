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
      body: StreamBuilder<RecommendationState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state != null) {
              print(state.videos.length);
              return Column(
                children: [
                  const Text('Recommended brewing'),
                  const Text('Technic V60'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.videos.length,
                      itemBuilder: (context, i){
                        return  Container(
                          margin: context.theme.insets.xs,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            children: [
                              const Text("Name of Method"),
                              YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId:
                                  YoutubePlayer.convertUrlToId(state.videos[i])!,
                                  flags: const YoutubePlayerFlags(autoPlay: false),
                                ),
                                showVideoProgressIndicator: true,
                                progressIndicatorColor:
                                context.theme.palette.grayScale.gray,
                              ),
                            ],
                          ),
                        );
                      },

                    ),
                  ),
                ],
              );
            }
            return const LoadingIndicator();
          }),
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
