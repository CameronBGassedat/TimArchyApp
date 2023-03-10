import 'package:flutter/material.dart';
import '../../../BusinessLogic/AirluxBloc.dart';

Widget sensorsContainer(AirluxBloc airluxBloc) {
  return
    airluxBloc.buildSensorsListView();
}