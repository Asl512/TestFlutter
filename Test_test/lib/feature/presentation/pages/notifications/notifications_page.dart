import 'package:flutter/material.dart';
import 'package:test_test/common/colors.dart';

import '../../../../common/textStyle.dart';
import '../../widgets/loading_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
            leadingWidth:MediaQuery.of(context).size.width*0.07,
            iconTheme:IconThemeData(color: secondaryColor),
            elevation: 0,
            backgroundColor: mainColor,
            title: Text("Notifications",style:SFProDisplay(style: Bold,size: 23))
        ),
      body: LoadingWidget(),
    );
  }
}
