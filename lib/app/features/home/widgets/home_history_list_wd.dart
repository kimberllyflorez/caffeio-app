import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/features/home/model/brew_by_date.dart';
import 'package:caffeio/app/res/assets.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/material.dart';

class HomeHistoryList extends StatelessWidget {
  final List<BrewByDate> brews;

  const HomeHistoryList({
    super.key,
    required this.brews,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 112),
      itemCount: brews.length,
      itemBuilder: (_, index) {
        final brew = brews[index];
        return _HistoryByDateSection(
          brewByDate: brew.items,
          date: brew.brewByDate,
          total: brew.total.toInt().toString(),
        );
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
          padding: const EdgeInsets.symmetric(
            horizontal: CaffeioSpacing.xs,
            vertical: CaffeioSpacing.xxs,
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
      margin: const EdgeInsets.symmetric(
        horizontal: CaffeioSpacing.xs,
        vertical: CaffeioSpacing.xxs,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CaffeioSpacing.xs,
          vertical: CaffeioSpacing.xxs,
        ),
        child: Row(
          children: [
            Image.asset(
              _getImage(brew.method.id),
              width: 40,
              height: 40,
            ),
            const SizedBox(width: CaffeioSpacing.xs),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brew.method.name,
                    style: theme.typo.body,
                  ),
                  const SizedBox(width: CaffeioSpacing.xxs),
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
                  style: theme.typo.body
                      .copyWith(color: theme.palette.brownScale.primaryColor, fontWeight: FontWeight.bold),
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
    if (id == 5) return CaffeioAssets.iconV60;
    if (id == 6) return CaffeioAssets.iconFrenchPress;
    if (id == 7) return CaffeioAssets.iconAeropress;
    return CaffeioAssets.iconChemex;
  }
}
