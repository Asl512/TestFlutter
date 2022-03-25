import 'package:flutter/material.dart';

import '../../../common/textStyle.dart';

class ItemMenu{
  final String label;
  final Widget icon;
  final List<int> index;

  ItemMenu({required this.label,required this.icon, required this.index});

  Color _getBgColor(List index){
    if(index.first == index.last) return Color(0xFFf5f5f5);
    else return Colors.white;
  }

  BottomNavigationBarItem call(){
    return BottomNavigationBarItem(
        icon: Container(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          color: _getBgColor(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                child: icon,
              ),
              Text(label, style: SFProDisplay(style: Regular)),
            ],
          ),
        ),
        label: ""
    );
  }
}