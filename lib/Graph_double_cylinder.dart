import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydraulicsim_iitp/Statistics.dart';
import 'package:hydraulicsim_iitp/models/attributepassc2.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';
import 'package:hydraulicsim_iitp/Attribute.dart';
import 'package:rive/rive.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
class Graph_double_cylinder extends StatefulWidget {
  static String id='Graph_double_cylinder';
  @override
  _Graph_double_cylinderState createState() => _Graph_double_cylinderState();
}

class _Graph_double_cylinderState extends State<Graph_double_cylinder> {
  final List<Feature> features = [
    Feature(
      title: "Piston Speed",
      color: Colors.blue,
      data: [0.2, 0.345, 0.466, 0.777, 0.1],
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: Text(
              "Graphs",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          LineGraph(
            features: features,
            size: Size(320, 300),
            labelX: ['1', '2', '3', '4', '5'],
            labelY: ['1', '2', '3', '4', '5'],
            showDescription: true,
            graphColor: Colors.deepPurple,
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
