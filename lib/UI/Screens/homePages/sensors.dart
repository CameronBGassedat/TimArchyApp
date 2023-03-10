import 'package:flutter/material.dart';
import '../../../BusinessLogic/AirluxBloc.dart';
import '../../../Data/Models/SensorModel.dart';

Widget sensorsContainer(AirluxBloc airluxBloc) {
  return
    airluxBloc.buildSensorsListView();
}