import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/ratio_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
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
        title: const Text(''),
      ),
      body: StreamBuilder<RatioState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data !=null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('coffee amount'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "20",
                      ),
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    ),
                  ),
                ),
                const Text("Ratio"),
                Column(
                  children: [
                    Text(data.ratioLabel),
                    Slider(
                      min: 0,
                      max: 10,
                      label: data.ratioLabel,
                      value: data.ratio,
                      onChanged: (value) => viewModel.saveRatio(value),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Ratio"),
                      Text("200"),
                    ],
                  ),
                )
              ],
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
