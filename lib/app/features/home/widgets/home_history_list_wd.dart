import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/features/home/model/brew_by_date.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeHistoryList extends StatelessWidget {
  final List<BrewByDate> userBrewsByDate;

  const HomeHistoryList({
    super.key,
    required this.userBrewsByDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 112),
      itemCount: userBrewsByDate.length,
      itemBuilder: (_, index) {
        final brews = userBrewsByDate[index];
        return _HistoryByDateSection(
            brewByDate: brews.items,
            date: brews.brewByDate,
            total: brews.total.toInt().toString());
      },
    );
  }
}

class _HistoryByDateSection extends StatelessWidget {
  final String date;
  final String total;
  final List<RatioModelView> brewByDate;

  const _HistoryByDateSection({
    required this.brewByDate,
    required this.date,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacing.xs,
            vertical: theme.spacing.xxs,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                textAlign: TextAlign.start,
                style: context.theme.typo.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$total gr',
                textAlign: TextAlign.start,
                style: context.theme.typo.body.copyWith(
                  color: theme.palette.brownScale.primaryColor,
                ),
              ),
            ],
          ),
        ),
        ...brewByDate.map((e) => _HistoryItemCard(brew: e)),
      ],
    );
  }
}

class _HistoryItemCard extends StatelessWidget {
  final RatioModelView brew;

  const _HistoryItemCard({
    required this.brew,
  });

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
                  Text('1:${brew.ratio}', style: theme.typo.body),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${brew.gramsCoffee.toInt()} gr',
                  style: theme.typo.body.copyWith(
                      color: theme.palette.brownScale.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${brew.water} ml',
                  style: theme.typo.body.copyWith(
                    fontWeight: FontWeight.bold,
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
    if (id == 5) return 'assets/images/v60.png';
    if (id == 6) return 'assets/images/french-press.png';
    if (id == 7) return 'assets/images/aeropress.png';
    return 'assets/images/chemex.png';
  }
}
