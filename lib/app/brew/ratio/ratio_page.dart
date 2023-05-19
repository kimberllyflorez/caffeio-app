import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/ratio/ratio_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class RatioPage extends StatefulWidget {
  const RatioPage({Key? key}) : super(key: key);

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
            totalWater: state.totalWater.toString(),
            onNextPageCallback: viewModel.nextPage,
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(context.theme.spacing.xl),
          topLeft: Radius.circular(context.theme.spacing.xl),
        ),
        color: context.theme.palette.blueScale.primaryColor,
      ),
      padding: context.theme.insets.xs.toHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                totalWater,
                style: context.theme.typo.title.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                " of water do you need",
                style: context.theme.typo.subtitle,
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: CaffeioButton(
              text: 'Next',
              callback: onNextPageCallback,
            ),
          )
        ],
      ),
    );
  }
}
