import 'package:flutter/material.dart';

class HomeBrewMethodCard extends StatelessWidget {
  final String methodName;
  final VoidCallback callback;

  const HomeBrewMethodCard({
    super.key,
    required this.methodName,
    required this.callback,
  });

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
