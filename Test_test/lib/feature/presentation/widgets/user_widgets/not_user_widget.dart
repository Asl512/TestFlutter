import 'package:flutter/material.dart';
import 'package:test_test/common/textStyle.dart';

class NotUserWidget extends StatelessWidget {
  const NotUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 10),
      child: Text("No user data", style: SFProDisplay(color: const Color(0xFF979797), size: 17, style: Bold)),
    );
  }
}
