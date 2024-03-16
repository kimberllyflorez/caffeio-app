import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class VersionCard extends StatelessWidget {
  const VersionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: theme.insets.xs,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/caffeio-icon.png',
            width: 36,
            height: 36,
          ),
          SizedBox(width: theme.spacing.xs),
          Column(
            children: [
              Text(
                'v0.0.1',
                style: theme.typo.small,
                textAlign: TextAlign.center,
              ),
              Text(
                'Bimbly Studios',
                style: theme.typo.small,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
