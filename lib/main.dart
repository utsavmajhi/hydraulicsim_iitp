import 'package:flutter/material.dart';
import 'Attribute.dart';
import 'SimulationScreen.dart';
import 'Statistics.dart';
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
      },
    );
  }
}

