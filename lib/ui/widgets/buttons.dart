import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';

FlatButton buttons(Color c, Color b, String text, Function f) {
  return FlatButton(
      minWidth: 300,
      height: 50,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: bottom),
          borderRadius: BorderRadius.circular(15)),
      color: b,
      onPressed: f,
      child: Text(
        text,
        style: TextStyle(color: c, fontSize: 16),
      ));
}
