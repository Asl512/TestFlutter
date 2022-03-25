import 'package:flutter/material.dart';
import 'package:test_test/common/colors.dart';
import 'package:test_test/common/textStyle.dart';
import 'package:test_test/feature/domin/entities/user/user_entity.dart';

class UserWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final UserEntity? user;
  const UserWidget({this.margin,required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width*0.06,
            backgroundColor: secondaryLightColor,
            child: Text((user?.initials)??"NN",style: SFProDisplay(color: mainColor, size: 18, style: Bold)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text((user?.name)??"None", style: SFProDisplay(color: const Color(0xFF979797), size: 17, style: Bold)),
                Text('@'+ ((user?.username)??"None"), style: SFProDisplay(color: const Color(0xFF979797), size: 17, style: Bold)),
              ],
            ),
          )
        ],
      )
    );
  }
}
