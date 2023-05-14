import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MethodSelectionPage extends StatelessWidget {
  const MethodSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Selection Page'),
      ),
      body: const Center(
        child: Text('Method Selection Page'),
      ),
    );
  }
}
