import 'dart:math';

import 'SimulationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';

class Attribute extends StatefulWidget {
  static String id='Attribute_Screen';
  @override
  _AttributeState createState() => _AttributeState();
}

class _AttributeState extends State<Attribute> {
  double rpm,Powerating,Boredia,stroke,pressure,dispvol;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("Pump Specs",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),),

                        TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            //get the RPM
                            rpm=double.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'RPM Value',
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            prefixIcon: Icon(Icons.rotate_left),
                            labelStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            //get the power rating
                            Powerating=double.parse(value);

                          },
                          decoration: InputDecoration(
                            labelText: 'Power Rating(W)',
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            prefixIcon: Icon(Icons.power),
                            labelStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            //get the power rating
                            dispvol=double.parse(value);

                          },
                          decoration: InputDecoration(
                            labelText: 'Displacement Vol (cm^3)',
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            prefixIcon: Icon(Icons.waves),
                            labelStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("Piston Cylinder Specs",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),),

                        TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            //get the Bore dia
                            Boredia=double.parse(value);

                          },
                          decoration: InputDecoration(
                            labelText: 'Bore Diameter (cm)',
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            prefixIcon: Icon(Icons.radio_button_off_outlined),
                            labelStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            //get the stroke
                            stroke=double.parse(value);

                          },
                          decoration: InputDecoration(
                            labelText: 'Stroke (cm)',
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            prefixIcon: Icon(Icons.height_sharp),
                            labelStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("Relief Valve Specs",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),),

                        TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            //get the Pressure Set
                            pressure=double.parse(value);

                          },
                          decoration: InputDecoration(
                            labelText: 'Pressure Set',
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            prefixIcon: Icon(Icons.stairs_rounded),
                            labelStyle: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              RoundedButtonSmall(title:"Simulate",colour: Colors.deepPurple,onPressed: (){
                    double turningtorq=(Powerating*60)/(2*3.14*rpm);
                    double flowrate=(rpm*dispvol*pow(10, -6)*2*3.14)/60;
                    double pressureout=Powerating/flowrate;
                    double areapiston=(3.14*Boredia*Boredia)/40000;
                    double forceonpiston=(pressureout*areapiston)/1000;
                    double velopiston=flowrate/areapiston*100;
                    print(turningtorq);
                    print(flowrate);
                    print(pressureout);
                    print(areapiston);
                    print(forceonpiston);
                    print(velopiston);
                    Navigator.pushNamed(context, SimulationScreen.id,arguments: Attributepasssc1(rpm:rpm,powerrate: Powerating,displvol: dispvol,boredia:Boredia,stroke: stroke,pressureset: pressure,turningtorq:turningtorq,flowrate:flowrate,pressureout: pressureout,areapiston: areapiston,forceonpiston: forceonpiston,velopiston: velopiston));
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
