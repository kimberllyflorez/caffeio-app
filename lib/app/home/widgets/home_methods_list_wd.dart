import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:flutter/material.dart';

typedef MethodCallback = void Function(BrewingMethod);

class HomeMethodsList extends StatelessWidget {
  final List<BrewingMethod> methods;
  final MethodCallback callback;

  const HomeMethodsList({
    super.key,
    required this.methods,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: methods.map((method) {
          return _HomeBrewMethodCard(
            callback: () => callback(method),
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
    required this.methodName,
    required this.callback,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: callback,
      child: Card(
        margin: theme.insets.xxs,
        child: SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            children: [
              Hero(
                tag: methodName,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  methodName,
                  maxLines: 1,
                  style: theme.typo.body.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
