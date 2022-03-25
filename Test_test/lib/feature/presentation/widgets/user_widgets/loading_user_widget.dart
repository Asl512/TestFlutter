import 'package:flutter/material.dart';
import 'package:test_test/feature/presentation/widgets/loading_widget.dart';

class LoadingUserWidget extends StatelessWidget {
  const LoadingUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      child: const LoadingWidget(alignment: Alignment.topLeft),
    );
  }
}
