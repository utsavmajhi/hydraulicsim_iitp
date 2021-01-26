import 'package:flutter/material.dart';
import 'Attribute.dart';
import 'SimulationScreen.dart';
import 'Statistics.dart';
import 'test1.dart';
import 'SimulationScreen_Single.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:Simulationsingleacting.id,
      routes:{
        SimulationScreen.id:(context)=>SimulationScreen(),
        Attribute.id:(context)=>Attribute(),
        Statistics.id:(context)=>Statistics(),
        test1.id:(context)=>test1(),
        Simulationsingleacting.id:(context)=>Simulationsingleacting(),

      },
    );
  }
}

