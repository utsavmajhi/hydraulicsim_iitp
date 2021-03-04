import 'package:flutter/material.dart';
import 'Attribute.dart';
import 'SimulationScreen.dart';
import 'Statistics.dart';
import 'test1.dart';
import 'SimulationScreen_Single.dart';
import 'SimulationScreen_test1.dart';
import 'package:hydraulicsim_iitp/Graph_double_cylinder.dart';
import 'SimulationScreen_test2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:Attribute.id,
      routes:{
        SimulationScreen.id:(context)=>SimulationScreen(),
        Attribute.id:(context)=>Attribute(),
        Statistics.id:(context)=>Statistics(),
        test1.id:(context)=>test1(),
        simulationscreentest1.id:(context)=>simulationscreentest1(),
        Simulationsingleacting.id:(context)=>Simulationsingleacting(),
        Graph_double_cylinder.id:(context)=>Graph_double_cylinder(),
        simulationScreen_test2.id:(context) =>simulationScreen_test2(),

      },
    );
  }
}

