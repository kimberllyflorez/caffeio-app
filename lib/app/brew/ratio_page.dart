import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RatioPage extends StatelessWidget {
  const RatioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratio Page'),
      ),
      body: const Center(
        child: Text('Ratio Page'),
      ),
    );
  }
}
