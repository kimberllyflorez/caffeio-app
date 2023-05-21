import 'package:caffeio/app/brew/ratio/ratio_model.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeHistoryList extends StatelessWidget {
  final List<RatioModelView> brews;

  const HomeHistoryList({
    Key? key,
    required this.brews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 112),
      itemCount: brews.length,
      itemBuilder: (_, index) {
        final brew = brews[index];
        return _HistoryItemCard(brew: brew);
      },
      // separatorBuilder: (_, index) => const Divider(),
    );
  }
}

class _HistoryItemCard extends StatelessWidget {
  final RatioModelView brew;

  const _HistoryItemCard({
    Key? key,
    required this.brew,
  }) : super(key: key);

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
              _getImage(brew.method.id),
              width: 40,
              height: 40,
            ),
            SizedBox(width: theme.spacing.xs),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brew.method.name,
                    style: theme.typo.body,
                  ),
                  SizedBox(width: theme.spacing.xxs),
                  Text(
                    '${brew.gramsCoffee.toInt()}gr',
                    style: theme.typo.title.copyWith(
                      color: theme.palette.brownScale.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('1:${brew.ratio}', style: theme.typo.body),
                Text(
                  '${brew.water}ml',
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

  String _getImage(int id) {
    if (id == 5) return 'assets/images/v60-icon.png';
    if (id == 6) return 'assets/images/french-press-icon.png';
    if (id == 7) return 'assets/images/aeropress-icon.png';
    return 'assets/images/chemex-icon.png';
  }
}
