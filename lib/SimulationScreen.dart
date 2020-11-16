import 'package:flutter/material.dart';
import 'package:hydraulicsim_iitp/Statistics.dart';
import 'package:hydraulicsim_iitp/models/attributepassc2.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:hydraulicsim_iitp/Attribute.dart';
class SimulationScreen extends StatefulWidget {
  static String id='Simulation_Screen';
  @override
  _SimulationState createState() => _SimulationState();
}

class _SimulationState extends State<SimulationScreen> {
  String _animationName = "Untitled";
  String forwardstrokenormal="ImageAssets/hydraulicmediumfront1.flr";
  String forwardstrokefast="ImageAssets/hydraulicfastfront1.flr";
  String backstrokenormal="ImageAssets/hydraulicbacknormal1.flr";
  String backstrokefast="ImageAssets/hydraulicbackmedium1.flr";
  String pistonstroking="ImageAssets/hydraulicbacknormal1.flr";
  final FlareControls _controls = FlareControls();
  //pos of valve
  String animation="Idle";
  double valveshifpos;

  //default values
  int strpos;//0==for,1==mid,2==right
  int valvepos;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //default values
    strpos=1;//0==backstroke,1==stable,2==forward
    valvepos=1;
    valveshifpos=53;
  }
  @override
  Widget build(BuildContext context) {
    Attributepasssc1 attributes=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [

                Positioned(
                  left: 90,
                  top: 18,
                  child: Container(
                    height: 150,
                    width: 200,
                    child: FlareActor(
                      pistonstroking,
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "Idle",
                      controller: _controls,
                    ),
                  ),
                ),
                Positioned(
                    top: 106,
                    left:118,
                    child: Image.asset('ImageAssets/leftlineneu.png')),
                Positioned(
                    top: 107,
                    left:186,
                    child: Image.asset('ImageAssets/rightlineneu.png')),
                Positioned(
                    top: 220,
                    left:valveshifpos,
                    child: Container(
                        height: 55,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                //_controls.play("Untitled");
                                if(valvepos==1){
                                  valvepos--;
                                  setState(() {
                                    print(strpos);
                                    if(valvepos==0 && (strpos==2)){
                                      //backward stroke
                                        pistonstroking=backstrokenormal;
                                      _controls.play("Untitled");
                                      strpos=0;
                                    }
                                    valveshifpos=108;
                                  });
                                }
                                if(valvepos==2){
                                  valvepos--;
                                  setState(() {
                                    valveshifpos=53;
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                            Image.asset('ImageAssets/dcvalvefinal.png'),
                            GestureDetector(
                              onTap: (){
                                print(valvepos);
                                if(valvepos==1){
                                  setState(() {
                                    valvepos++;
                                    if(valvepos==2&&(strpos==0||strpos==1)){
                                      //forward stroke
                                      pistonstroking=forwardstrokenormal;
                                      _controls.play("Untitled");
                                      strpos=2;
                                    }
                                    valveshifpos=0;
                                  });
                                }
                                if(valvepos==0){
                                  setState(() {
                                    valvepos++;

                                    valveshifpos=53;
                                  });
                                }

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ),
                          ],
                        ))),
                Positioned(
                    top: 250,
                    left:158,
                    child: Image.asset('ImageAssets/linetest.png')),
                Positioned(
                    top: 250,
                    left:165,
                    child: Image.asset('ImageAssets/tank.png')),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,top: 328),
                  child: Container(
                    height: 180,
                      child: Image.asset('ImageAssets/reliefvalve.png')),
                ),
                Positioned(
                    left: 138,
                    top: 430,
                    child: Image.asset('ImageAssets/pumpmotr.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0),
              child: RoundedButtonSmall(title:"Statistics",colour:Colors.blue,onPressed: (){
                  //GOTO Stats page
                  Navigator.pushNamed(context, Statistics.id,arguments: Attributepassc2(rpm: attributes.rpm,powerrate: attributes.powerrate,displvol: attributes.displvol,boredia: attributes.boredia,stroke: attributes.stroke,pressureset: attributes.pressureset,turningtorq: attributes.turningtorq,flowrate: attributes.flowrate,pressureout: attributes.pressureout,areapiston: attributes.areapiston,forceonpiston: attributes.forceonpiston,velopiston: attributes.velopiston));
              },),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0),
              child: RoundedButtonSmall(title:"Change Values",colour:Colors.red,onPressed: (){
                //GOTO Stats page
                Navigator.pop(context);
              },),
            )
          ],
      )
    );
  }
}
