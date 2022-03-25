import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const ShadowContainer({required this.child,this.padding,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2)
        )],
      ),
      child: child,
    );
  }
}
