import 'package:flutter/material.dart';
import 'package:test_test/common/colors.dart';
import 'package:test_test/common/textStyle.dart';
import 'package:test_test/feature/presentation/widgets/shadow_container_widget.dart';

class PageReloadWidget extends StatelessWidget {
  final String errorText;
  const PageReloadWidget(this.errorText,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:  MediaQuery.of(context).size.height/1.25,
        child: Center(
          child: ShadowContainer(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(errorText, style: SFProDisplay(size: 23,style: Bold)),
                  IconButton(
                      onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context, '/body', (_) => false),
                      icon: const Icon(
                        Icons.replay,
                        color: secondaryColor,
                      )
                  )
                ],
              ),
          ),
        )
    );
  }
}
