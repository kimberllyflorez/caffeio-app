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
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 112),
      itemCount: 200,
      itemBuilder: (_, index) => const _HistoryItemCard(),
      // separatorBuilder: (_, index) => const Divider(),
    );
  }
}

class _HistoryItemCard extends StatelessWidget {
  const _HistoryItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: theme.spacing.xs,
        vertical: theme.spacing.xxs,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacing.xs,
          vertical: theme.spacing.xxs,
        ),
        child: Row(
          children: [
            Image.asset(
              // 'assets/images/aeropress-icon.png',
              // 'assets/images/chemex-icon.png',
              'assets/images/v60-icon.png',
              // 'assets/images/french-press-icon.png',
              width: 60,
              height: 60,
            ),
            SizedBox(width: theme.spacing.xxs),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'V60',
                    style: theme.typo.title.copyWith(
                      color: theme.palette.brownScale.primaryColor,
                    ),
                  ),
                  SizedBox(width: theme.spacing.xxs),
                  Text('20 gr', style: theme.typo.body),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('1:16', style: theme.typo.body),
                Text(
                  '200 ml',
                  style: theme.typo.title.copyWith(
                    color: theme.palette.blueScale.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
