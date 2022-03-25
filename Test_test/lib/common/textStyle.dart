import 'package:flutter/material.dart';



TextStyle SFProDisplay({
  FontWeight style = Medium,
  Color color = const Color(0xFF161616),
  double? size,
  double? height
}) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'SFProDisplay',
      fontWeight: style,
      height: height,
      decoration:TextDecoration.none
  );
}

const FontWeight Black = FontWeight.w900;
const FontWeight Heavy = FontWeight.w800;
const FontWeight Bold = FontWeight.w700;
const FontWeight SemiBold = FontWeight.w600;
const FontWeight Medium = FontWeight.w500;
const FontWeight Regular = FontWeight.w400;
const FontWeight Light = FontWeight.w300;
const FontWeight Thin = FontWeight.w200;
const FontWeight Ultralight = FontWeight.w100;