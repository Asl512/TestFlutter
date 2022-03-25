import 'package:flutter/material.dart';

import '../../../common/images.dart';

class LoadingWidget extends StatefulWidget {
  final AlignmentGeometry alignment;
  const LoadingWidget({
    this.alignment = Alignment.center,
    Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>  with SingleTickerProviderStateMixin{

  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: new Duration(milliseconds: 900));
    controller!.repeat();
    //controller!.dispose();
  }

  @override
  dispose() {
    controller!.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height/1.25,
        child: Container(
          alignment: widget.alignment,
          child: RotationTransition(
              turns: controller as AnimationController,
              child: Image.asset(loading)
          ),
        )
    );
  }
}
