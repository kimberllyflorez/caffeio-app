import 'package:flutter/material.dart';

class HomeBrewMethodCard extends StatelessWidget {
  final String methodName;
  final VoidCallback callback;

  const HomeBrewMethodCard({
    Key? key,
    required this.methodName,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Icon(Icons.add),
          Text(methodName),
        ],
      ),
    );
  }
}
