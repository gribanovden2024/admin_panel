import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
Color? borderColor = Colors.grey[50];

double defaultPadding = 16.0;
const defStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
);

final butStyle = ButtonStyle(
shape: MaterialStatePropertyAll(RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),
side: BorderSide(color: borderColor!))));