import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/ratio/ratio_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coffee Ratio',
          style: context.theme.typo.title,
        ),
      ),
      body: StreamBuilder<RatioState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: context.theme.insets.xs.toHorizontal,
                    child: Text(
                        'How many grams of coffee do you want to prepared?',
                        style: context.theme.typo.subtitle),
                  ),
                  SizedBox(height: context.theme.spacing.m),
                  Padding(
                    padding: context.theme.insets.xs.toHorizontal,
                    child: TextFormField(
                      onChanged: (grams) => viewModel.saveGramsCoffee(grams),
                      decoration: const InputDecoration(
                          hintText: "20", suffixText: "gr"),
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    ),
                  ),
                  SizedBox(height: context.theme.spacing.m),
                  Padding(
                    padding: context.theme.insets.xs.toHorizontal,
                    child: Text(
                      "Ratio:  1: ${data.ratioModel.ratio.toString()}",
                      style: context.theme.typo.subtitle,
                    ),
                  ),
                  SizedBox(height: context.theme.spacing.m),
                  Slider(
                    divisions: 10,
                    min: 10,
                    max: 25,
                    label: "1:${data.ratioModel.ratio.toString()}",
                    value: data.ratio,
                    onChanged: (value) => viewModel.saveRatio(value),
                  ),
                  Padding(
                    padding: context.theme.insets.xs.toHorizontal,
                    child: Row(
                      children: [
                        Text(
                          viewModel.totalWater(),
                          style: context.theme.typo.title.copyWith(
                            color: context.theme.palette.blueScale.primaryColor,
                          ),
                        ),
                        Text(" of water do you need",
                            style: context.theme.typo.subtitle),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const LoadingIndicator();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CaffeioButton(
          text: 'Next',
          callback: viewModel.nextPage,
        ),
      ),
    );
  }
}
