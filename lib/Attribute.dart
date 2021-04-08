import 'dart:math';

import 'package:hydraulicsim_iitp/SimulationScreen_Single.dart';

import 'SimulationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';
import 'SimulationScreen_test1.dart';

class Attribute extends StatefulWidget {
  static String id='Attribute_Screen';
  @override
  _AttributeState createState() => _AttributeState();
}

class _AttributeState extends State<Attribute> {
  double rpm,Powerating,Boredia,stroke,pressure,dispvol,springconstant=10,piston_mass,piston_rod_dia,fluid_density,pipe_length,pipe_dia,fluid_viscosity,pipe_roughness;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
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
                                  //get the Bore dia
                                  piston_rod_dia=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Rod Diameter (cm)',
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
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
                              Text("Piston & Fluid Specs",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),

                              TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.start,
                                onChanged: (value) {
                                  //get the Pressure Set
                                  springconstant=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Spring Constant(Optional)',
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  prefixIcon: Icon(Icons.wrap_text_sharp),
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
                                  //get the Pressure Set
                                  piston_mass=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Mass of Piston',
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  prefixIcon: Icon(Icons.line_weight),
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
                                  //get the Pressure Set
                                  fluid_viscosity=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Viscosity',
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  prefixIcon: Icon(Icons.add_road_outlined),
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
                                  //get the Pressure Set
                                  fluid_density=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Density',
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  prefixIcon: Icon(Icons.add_road_outlined),
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
                                  //get the Pressure Set
                                  pipe_length=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Total Pipe Length (m)',
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  prefixIcon: Icon(Icons.add_road_outlined),
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
                                  //get the Pressure Set
                                  pipe_dia=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Pipe Diameter (cm)',
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  prefixIcon: Icon(Icons.add_road_outlined),
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
                                  //get the Pressure Set
                                  pipe_roughness=double.parse(value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Pipe Roughness',
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  prefixIcon: Icon(Icons.add_road_outlined),
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
                  ),
                ),
                RoundedButtonSmall(title:"Simulate",colour: Colors.deepPurple,onPressed: (){
                      double turningtorq=(Powerating*60)/(2*3.14*rpm);
                      double flowrate=(rpm*dispvol*pow(10, -6)*2*3.14)/60;
                      double pressureout=Powerating/flowrate;
                      double areapiston=(3.14*Boredia*Boredia)/40000;
                      double forceonpiston=(pressureout*areapiston)/1000;
                      double velopiston=flowrate/areapiston*100;
                      double velocity_fluid=(flowrate*4)/(3.14*pow(pipe_dia,2));
                      double reynold_num=((fluid_density*velocity_fluid*pipe_dia)/fluid_viscosity);
                      double friction_factor=64/reynold_num;
                      double area_rod=3.14*piston_rod_dia*piston_rod_dia/40000;
                      double headloss=(friction_factor*pipe_length*pow(velocity_fluid,2))/(2*9.81*pipe_dia);
                      double pressure_diff=((pressureout-headloss)*areapiston)-((areapiston-area_rod)*pow(10,5));


                      print(turningtorq);
                      print(flowrate);
                      print(pressureout);
                      print(areapiston);
                      print(forceonpiston);
                      print(velopiston);
                      Navigator.pushNamed(context, simulationscreentest1.id,arguments: Attributepasssc1(rpm:rpm,powerrate: Powerating,displvol: dispvol,boredia:Boredia,stroke: stroke,pressureset: pressure,turningtorq:turningtorq,flowrate:flowrate,pressureout: pressureout,areapiston: areapiston,forceonpiston: forceonpiston,velopiston: velopiston,springconstant:springconstant,viscosity:fluid_viscosity,piston_mass: piston_mass,pressure_diff:pressure_diff));
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
