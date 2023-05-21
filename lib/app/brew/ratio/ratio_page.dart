import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/ratio/ratio_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/container/caffeio_bottom_container.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class RatioPage extends StatefulWidget {
  final BrewingMethod brewingMethod;

  const RatioPage({
    Key? key,
    required this.brewingMethod,
  }) : super(key: key);

  @override
  State<RatioPage> createState() => _RatioPageState();
}

class _RatioPageState extends ViewState<RatioPage, RatioViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RatioState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        final state = snapshot.data ?? const RatioState();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Preparation'),
          ),
          body: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: context.theme.insets.xs.toHorizontal,
                        child: Text(
                          'How many grams of coffee do you want to brew?',
                          style: context.theme.typo.title,
                        ),
                      ),
                      SizedBox(height: context.theme.spacing.xxs),
                      Padding(
                        padding: context.theme.insets.xs.toHorizontal,
                        child: TextFormField(
                          onChanged: (grams) =>
                              viewModel.saveGramsCoffee(grams),
                          decoration: const InputDecoration(
                            hintText: "20",
                            suffixText: "gr",
                          ),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                        ),
                      ),
                      SizedBox(height: context.theme.spacing.l),
                      Container(
                        width: double.maxFinite,
                        padding: context.theme.insets.xs.toHorizontal,
                        child: Text(
                          "Which ratio do you want to use?",
                          style: context.theme.typo.title,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: context.theme.spacing.s),
                      Container(
                        width: double.maxFinite,
                        padding: context.theme.insets.xs.toHorizontal,
                        child: Text(
                          "1:${state.ratioModel.ratio.toString()}",
                          style: context.theme.typo.body,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Slider(
                        min: 12,
                        max: 20,
                        divisions: 8,
                        value: state.ratio,
                        onChanged: viewModel.onRatioSliderChange,
                        activeColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.12),
                        inactiveColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.12),
                        thumbColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _BottomSection(
            totalWater: state.ratioModel.water.toString(),
            onNextPageCallback: () => viewModel.nextPage(widget.brewingMethod),
          ),
        );
      },
    );
  }
}

class _BottomSection extends StatelessWidget {
  final VoidCallback onNextPageCallback;
  final String totalWater;

  const _BottomSection({
    Key? key,
    required this.onNextPageCallback,
    required this.totalWater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CaffeioBottomContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: theme.spacing.m),
          Padding(
            padding: theme.insets.xs.toHorizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Required amount of water (ml) for this brew is:",
                    style: theme.typo.subtitle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  totalWater,
                  style: theme.typo.title.copyWith(
                    color: Colors.cyanAccent,
                    fontSize: 54.0,
                    height: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: theme.insets.xs.toVertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onNextPageCallback,
                  icon: const Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
