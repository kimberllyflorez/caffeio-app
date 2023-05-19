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
    final theme = context.theme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacing.xs),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: methods.map((e) {
            return _HomeBrewMethodCard(
              callback: () {},
              methodName: e.name,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _HomeBrewMethodCard extends StatelessWidget {
  final String methodName;
  final VoidCallback callback;

  const _HomeBrewMethodCard({
    Key? key,
    required this.methodName,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Icon(Icons.add),
          Text(methodName),
        ],
      ),
    );
  }
}
