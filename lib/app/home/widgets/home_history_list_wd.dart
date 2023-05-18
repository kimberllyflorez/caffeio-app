import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeHistoryList extends StatelessWidget {
  final List<dynamic> history;

  const HomeHistoryList({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 112),
        itemCount: 200,
        itemBuilder: (_, index) => const _HistoryItemCard(),
        separatorBuilder: (_, index) => const Divider(),
      ),
    );
  }
}

class _HistoryItemCard extends StatelessWidget {
  const _HistoryItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.xs,
        vertical: theme.spacing.xxs,
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('V60'),
              Text('16:1'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('20 gr'),
              Text('200 ml'),
            ],
          )
        ],
      ),
    );
  }
}
