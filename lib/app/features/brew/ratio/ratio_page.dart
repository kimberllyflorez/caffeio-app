import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/features/brew/ratio/ratio_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/res/strings.dart';
import 'package:caffeio/design_system/atoms/container/caffeio_bottom_container.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class RatioPage extends StatefulWidget {
  final BrewingMethod brewingMethod;

  const RatioPage({
    super.key,
    required this.brewingMethod,
  });

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
    final theme = context.theme;
    return StreamBuilder<RatioState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        final state = snapshot.data ?? const RatioState();
        return Scaffold(
          appBar: AppBar(
            title: const Text(CaffeioStrings.preparation),
          ),
          body: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Column(
              children: [
                const SizedBox(height: CaffeioSpacing.m),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: CaffeioInsets.xs.toHorizontal,
                        child: Text(
                          CaffeioStrings.preparationDescription,
                          style: theme.typo.title,
                        ),
                      ),
                      const SizedBox(height: CaffeioSpacing.xxs),
                      Padding(
                        padding: CaffeioInsets.xs.toHorizontal,
                        child: TextFormField(
                          onChanged: (grams) => viewModel.saveGramsCoffee(grams),
                          decoration: const InputDecoration(
                            hintText: CaffeioStrings.gramsHint,
                            suffixText: CaffeioStrings.gramsSuffix,
                          ),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.center,
                          inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        ),
                      ),
                      const SizedBox(height: CaffeioSpacing.l),
                      Container(
                        width: double.maxFinite,
                        padding: CaffeioInsets.xs.toHorizontal,
                        child: Text(
                          CaffeioStrings.gramsRatio,
                          style: theme.typo.title,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: CaffeioSpacing.s),
                      Container(
                        width: double.maxFinite,
                        padding: CaffeioInsets.xs.toHorizontal,
                        child: Text(
                          "1:${state.ratioModel.ratio.toString()}",
                          style: theme.typo.body,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Slider(
                        min: 12,
                        max: 20,
                        divisions: 8,
                        value: state.ratio,
                        onChanged: viewModel.onRatioSliderChange,
                        activeColor: Theme.of(context).colorScheme.primary.withOpacity(.12),
                        inactiveColor: Theme.of(context).colorScheme.primary.withOpacity(.12),
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
    required this.onNextPageCallback,
    required this.totalWater,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CaffeioBottomContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: CaffeioSpacing.m),
          Padding(
            padding: CaffeioInsets.xs.toHorizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    CaffeioStrings.waterAmount,
                    style: theme.typo.subtitle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: CaffeioSpacing.xxs),
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
          SafeArea(
            child: Padding(
              padding: CaffeioInsets.xs.toVertical,
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
          ),
        ],
      ),
    );
  }
}
