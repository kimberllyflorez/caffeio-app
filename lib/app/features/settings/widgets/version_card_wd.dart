import 'package:caffeio/app/res/strings.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:flutter/material.dart';

class CaffeioBrandCard extends StatelessWidget {
  const CaffeioBrandCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: CaffeioInsets.xs,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            CaffeioStrings.appVersion,
            style: theme.typo.small,
            textAlign: TextAlign.center,
          ),
          Text(
            CaffeioStrings.brandName,
            style: theme.typo.small,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
