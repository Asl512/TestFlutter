import 'package:flutter/material.dart';
import 'package:test_test/common/colors.dart';
import '../../../../common/textStyle.dart';
import '../../widgets/loading_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: Text("Menu",style:SFProDisplay(style: Bold,size: 23))
      ),
      body: LoadingWidget(),
    );
  }
}
