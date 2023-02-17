import 'package:flutter/material.dart';

ListView sensorsContainer() {
  return
    ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Card(
          child: Text("Rain"),
        ),
      ],
    );
}