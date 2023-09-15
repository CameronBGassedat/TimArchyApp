import 'package:flutter/material.dart';

Image makeImage(String path, double imgHeight, {Color? imgColor})
{
  return
    Image.asset(
      "images/$path",
      height: imgHeight,
      color: imgColor,
    );
}

Text makeText(String text, Color txtColor, double txtSize, FontStyle txtStyle, FontWeight txtWeight, {TextAlign? txtAlign})
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
      textAlign: txtAlign,
    );
}

Container makeNavBarContainer(double navBarPaddingLeft, double navBarPaddingRight, String navBarText, Color navBarTextColor)
{
  return
    Container(
      alignment: Alignment.center,
      height: 40,
      padding: EdgeInsets.only(left: navBarPaddingLeft, right: navBarPaddingRight),
      child: makeText(navBarText, navBarTextColor, 26, FontStyle.italic, FontWeight.bold)
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

FractionallySizedBox makeFormSizedBox(String txtText, String txtFdHintText)
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

Container makeCustomButton(Color btnColor, double topLeftRadius, double topRightRadius, double bottomLeftRadius, double bottomRightRadius, String btnText, {double? btnWidth})
{
  return
    Container(
      alignment: Alignment.center,
      height: 60,
      width: btnWidth,
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

NavigationDestination makeIndex(String path, double imgHeight, Color imgColor, String indexLabel)
{
  return
    NavigationDestination(
      icon: makeImage(path, imgHeight, imgColor: imgColor),
      label: indexLabel,
    );
}