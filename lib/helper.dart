import 'package:flutter/material.dart';

Text makeText(String text, double size, FontWeight fontWt) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWt,
    ),
  );
}

TextField makeTextField(String hintText, Color onFocusBorderColor)
{
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
      enabledBorder : OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: onFocusBorderColor, width: 2.0),
      ),
    ),
  );
}
