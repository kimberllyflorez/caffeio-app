import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:flutter/material.dart';

class HomeMethodsList extends StatelessWidget {
  final List<BrewingMethod> methods;

  const HomeMethodsList({
    Key? key,
    required this.methods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: methods.map((method) {
          return _HomeBrewMethodCard(
            callback: () {},
            methodName: method.name,
            image: method.image,
          );
        }).toList(),
      ),
    );
  }
}

class _HomeBrewMethodCard extends StatelessWidget {
  final String methodName;
  final String image;
  final VoidCallback callback;

  const _HomeBrewMethodCard({
    Key? key,
    required this.methodName,
    required this.callback,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Card(
      margin: theme.insets.xxs,
      child: Container(
        width: 120,
        height: 120,
        padding: theme.insets.xxs,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: theme.spacing.xxs),
            Text(
              methodName,
              maxLines: 1,
              style: theme.typo.body.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
