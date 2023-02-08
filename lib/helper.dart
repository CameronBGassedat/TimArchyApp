import 'package:flutter/material.dart';

FractionallySizedBox makeTextFieldSizedBox(String txtText, String txtFdHintText)
{
  return
    FractionallySizedBox(
      widthFactor: 0.8,
      child: Column(
        children: [
          makeText(txtText, Colors.black, 26, FontStyle.normal, FontWeight.bold),
          makeTextField(txtFdHintText),
        ],
      ),
    );
}

Text makeText(String text, Color txtColor, double txtSize, FontStyle txtStyle, FontWeight txtWeight)
{
  return
    Text(
      text,
      style: TextStyle(
        color: txtColor,
        fontSize: txtSize,
        fontStyle: txtStyle,
        fontWeight: txtWeight,
      ),
    );
}

TextField makeTextField(String hintText)
{
  return
    TextField(
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
    );
}

Container makeCustomButton(Color btnColor, double topLeftRadius, double topRightRadius, double bottomLeftRadius, double bottomRightRadius, String btnText) {
  return
    Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius),
            topRight: Radius.circular(topRightRadius),
            bottomLeft: Radius.circular(bottomLeftRadius),
            bottomRight: Radius.circular(bottomRightRadius),
        ),
      ),
      child: makeText(btnText, Colors.white, 24, FontStyle.normal, FontWeight.bold),
    );
}