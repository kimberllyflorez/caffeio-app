import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecommendationVideoCard extends StatefulWidget {
  final String url;

  const RecommendationVideoCard({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<RecommendationVideoCard> createState() =>
      _RecommendationVideoCardState();
}

class _RecommendationVideoCardState extends State<RecommendationVideoCard> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: context.theme.spacing.xxs,
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: context.theme.palette.grayScale.gray,
          bottomActions: const [],
        ),
        builder: (_, player) {
          return player;
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
