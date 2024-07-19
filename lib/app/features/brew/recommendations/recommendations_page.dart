import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/features/brew/recommendations/recommendations_vm.dart';
import 'package:caffeio/app/features/brew/recommendations/widgets/video_card_wd.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecommendationsPage extends StatefulWidget {
  final BrewingMethod method;

  const RecommendationsPage({
    super.key,
    required this.method,
  });

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState
    extends ViewState<RecommendationsPage, RecommendationViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
    viewModel.listVideos(widget.method);
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
                        child: RecommendationVideoCard(
                          url: state.videos[i].url,
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: context.theme.insets.xs,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => viewModel.onNextPressed(widget.method),
                icon: Icon(
                  Icons.navigate_next_rounded,
                  color: context.theme.palette.blueScale.primaryColor,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
