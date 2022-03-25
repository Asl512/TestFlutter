import 'package:flutter/material.dart';
import 'package:test_test/common/colors.dart';
import 'package:test_test/feature/presentation/widgets/loading_widget.dart';

import '../../../../common/textStyle.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: Text("Chat",style:SFProDisplay(style: Bold,size: 23))
      ),
      body: LoadingWidget(),
    );
  }
}
