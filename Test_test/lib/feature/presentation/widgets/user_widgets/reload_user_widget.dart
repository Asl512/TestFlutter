import 'package:flutter/material.dart';
import 'package:test_test/common/colors.dart';

class UserReloadWidget extends StatelessWidget {
  const UserReloadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        height:  50,
        child: IconButton(
            onPressed: ()=>Navigator.pushReplacementNamed(context, '/post_details'),
            icon: const Icon(
              Icons.replay,
              color: secondaryColor,
            )
        )
    );
  }
}
