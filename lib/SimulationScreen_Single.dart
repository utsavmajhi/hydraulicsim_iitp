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

class Simulationsingleacting extends StatefulWidget  {
  static String id='Simulation_Screen_SingleActing';

  @override
  _SimulationsingleactingState createState() => _SimulationsingleactingState();
}

class _SimulationsingleactingState extends State<Simulationsingleacting> with TickerProviderStateMixin {

  //Logic

  int toggling_dcvalve=0;
  var logicList = List.generate(4, (i) => List(10), growable: false);
  RiveAnimationController _controller_piston;
  RiveAnimationController _controller_dcvalve;
  RiveAnimationController _controller_reliefvalve;
  RiveAnimationController _controller_pump;
  RiveAnimationController _controller_pipe1;
  RiveAnimationController _controller_pipe2;
  RiveAnimationController _controller_pipe3;
  RiveAnimationController _controller_pipe4;
  RiveAnimationController _controller_pipe5;
  RiveAnimationController _controller_pipe6;
  RiveAnimationController _controller_pipe7;
  RiveAnimationController _controller_pipet_shape;
  RiveAnimationController _controller_pipel_shape1;
  RiveAnimationController _controller_pipel_shape2;
  RiveAnimationController _controller_reservoir;
  RiveAnimationController _controller_piston_double;
  Artboard _riveArtboard_piston;
  Artboard _riveArtboard_dcvalve;
  Artboard _riveArtboard_reliefvalve;
  Artboard _riveArtboard_pump;
  Artboard _riveArtboard_pipe1;
  Artboard _riveArtboard_pipe2;
  Artboard _riveArtboard_pipe3;
  Artboard _riveArtboard_pipe4;
  Artboard _riveArtboard_pipe5;
  Artboard _riveArtboard_pipe6;
  Artboard _riveArtboard_pipe7;
  Artboard _riveArtboard_pipet_shape;
  Artboard _riveArtboard_pipel_shape1;
  Artboard _riveArtboard_pipel_shape2;
  Artboard _riveArtboard_reservoir;
  Artboard _riveArtboard_piston_double;
  String toggle_p="Forward";
  List<List<int>> LogicArr = [
    [1,1,1,3,1,6,5,1,1,1,4,5],
    [6,5,3,1,3,6,6,1,3,1,1,1],
    [1,1,1,3,1,6,6,1,1,1,3,2],
    [3,4,3,1,3,6,6,1,3,1,2,4],
    [1,1,1,3,1,6,6,1,1,1,4,3]
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //For single acting piston Animation
    rootBundle.load('ImageAssets/single-acting.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_piston = SimpleAnimation('Backward-static'));
          setState(() => _riveArtboard_piston = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/dc_valve_4_3.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_dcvalve = SimpleAnimation('idle'));
          setState(() => _riveArtboard_dcvalve = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/relief-valve.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_reliefvalve = SimpleAnimation('idle'));
          setState(() => _riveArtboard_reliefvalve = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/pump.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pump = SimpleAnimation('Running'));
          setState(() => _riveArtboard_pump = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/straight-pipe.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipe1 = SimpleAnimation('Low-Static'));
          setState(() => _riveArtboard_pipe1 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/straight-pipe.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipe2 = SimpleAnimation('Low-Static'));
          setState(() => _riveArtboard_pipe2 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/straight-pipe.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipe3 = SimpleAnimation('Low-Static'));
          setState(() => _riveArtboard_pipe3 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/straight-pipe.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipe4 = SimpleAnimation('Low-Static'));
          setState(() => _riveArtboard_pipe4 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/straight-pipe.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipe5 = SimpleAnimation('Low-static'));
          setState(() => _riveArtboard_pipe5 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/straight-pipe.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipe6 = SimpleAnimation('Low-static'));
          setState(() => _riveArtboard_pipe6 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/straight-pipe.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipe7 = SimpleAnimation('Low-static'));
          setState(() => _riveArtboard_pipe7 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/t-section.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipet_shape = SimpleAnimation('idle'));
          setState(() => _riveArtboard_pipet_shape = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/double-acting.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_piston_double = SimpleAnimation('Backward-static'));
          setState(() => _riveArtboard_piston_double = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/reservoir.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_reservoir = SimpleAnimation('idle'));
          setState(() => _riveArtboard_reservoir = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/l-section.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipel_shape1 = SimpleAnimation('Low-static'));
          setState(() => _riveArtboard_pipel_shape1 = artboard);
        }
      },
    );
    rootBundle.load('ImageAssets/l-section.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipel_shape2 = SimpleAnimation('Low-static'));
          setState(() => _riveArtboard_pipel_shape2 = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Attributepasssc1 attributes=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF3A3938),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:68.0,left:70),
            child: Container(
              height:50,
              child: piston_double(LogicArr[toggling_dcvalve][10]),
            ),
          ),
          Positioned(
              top: 148,
              left:64,
              child:Transform.rotate(
                angle: pi/2.9,
                child: Container(
                    height: 90,
                    width: 180,
                    child: pipe1(LogicArr[toggling_dcvalve][0])),
              )),
          Positioned(
              top: 148,
              left:110,
              child: Transform.rotate(
                angle: (5*pi)/3,
                child: Container(
                    height: 90,
                    width: 180,
                    child: pipe2(LogicArr[toggling_dcvalve][1])),
              )),
          Positioned(
            top: 158,
            left: 66,
            child: Container(
              color: Colors.transparent,
              height: 170,
              width: 230,
              child: dcvalve4_3(LogicArr[toggling_dcvalve][11]),
            ),
          ),
          //for tank pipe
          Positioned(
              top: 378,
              left:69,
              child: Transform.rotate(
                angle: (pi)/2,
                child: Container(
                    height: 10,
                    width: 250,
                    child: pipe3(LogicArr[toggling_dcvalve][2])),
              )),
          Positioned(
            top: 485,
            left: 120,
            child: Container(
                height: 180,
                width: 100,
                child: reliefvalve(LogicArr[toggling_dcvalve][9])),
          ),
          Positioned(
              top: 648,
              left:129,
              child: Transform.rotate(
                angle: (pi)/2,
                child: Container(
                    height: 10,
                    width: 80,
                    child: pipe4(LogicArr[toggling_dcvalve][3])),
              )),
          Positioned(child: SizedBox(
            height:900,
          )),
          Positioned(
              left: -19,
              top: 470,
              child: Container(
                  height: 90,
                  width: 200,
                  child: pump(1))),
          Positioned(
              left: 70,
              top: 328,
              child: Transform.rotate(
                angle: pi/2,
                child: Container(
                    height: 90,
                    width: 200,
                    child: pipe7(LogicArr[toggling_dcvalve][6])),
              )),
          Positioned(
              left: -40,
              top: 600,
              child: Container(
                  height: 120,
                  width: 500,
                  child: reservoir1(1))),
          Positioned(
              left: 93,
              top: 470,
              child: Transform.rotate(
                angle: -pi/2,
                child: Container(
                    height: 90,
                    width: 100,
                    child: pipet_shape(LogicArr[toggling_dcvalve][7])),
              )),
          Positioned(
              left: 188,
              top: 490,
              child: Transform.rotate(
                angle: -pi/2,
                child: Container(
                    height: 50,
                    width: 50,
                    child: l_shapepipe1(LogicArr[toggling_dcvalve][8])),
              )),

          Positioned(
              top: 594,
              left:165,
              child: Transform.rotate(
                angle: (pi)/2,
                child: Container(
                    height: 10,
                    width: 140,
                    child: pipe5(LogicArr[toggling_dcvalve][4])),
              )),
          Positioned(
              top: 587,
              left:-30,
              child: Transform.rotate(
                angle: (pi)/2,
                child: Container(
                    height: 10,
                    width: 160,
                    child: pipe6(LogicArr[toggling_dcvalve][5])),
              )),
          Positioned(
            top:250,
            left:66,
            child: GestureDetector(
              onTap: (){

                setState(() {
                  if(toggling_dcvalve==4){
                    toggling_dcvalve=0;
                  }else{
                    toggling_dcvalve=toggling_dcvalve+1;
                  }
                });
              },
              child: Container(
                height: 25,
                width: 40,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top:690,
            left:140,
            child: Center(
              child: RoundedButtonSmall(title:"Parameters",colour:Colors.blue,onPressed: (){
                //GOTO Stats page
                Navigator.pushNamed(context, Statistics.id,arguments: Attributepassc2(rpm: attributes.rpm,powerrate: attributes.powerrate,displvol: attributes.displvol,boredia: attributes.boredia,stroke: attributes.stroke,pressureset: attributes.pressureset,turningtorq: attributes.turningtorq,flowrate: attributes.flowrate,pressureout: attributes.pressureout,areapiston: attributes.areapiston,forceonpiston: attributes.forceonpiston,velopiston: attributes.velopiston));
              },),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
          child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        }


      ),

    );
  }
  Widget SingleActingPiston(state) {
    if (_riveArtboard_piston != null) {
      switch (state) {
        case 1:
          _riveArtboard_piston.artboard..addController(SimpleAnimation('Forward'));
          break;
        case 2:
          _riveArtboard_piston.artboard..addController(SimpleAnimation('Backward'));
          break;
        case 3:
          _riveArtboard_piston.artboard..addController(SimpleAnimation('Forward-static'));
          break;
        case 4:
          _riveArtboard_piston.artboard..addController(SimpleAnimation('Backward-static'));
          break;
      }
      return Rive(
        artboard: _riveArtboard_piston,
        fit: BoxFit.cover,
      );
    } else {
      return Container();
    }
  }
  Widget dcvalve4_3(state) {
    if (_riveArtboard_dcvalve != null) {
      switch (state) {
        case 1:
          _riveArtboard_dcvalve.artboard..addController(SimpleAnimation('Neut-Fwd'));
          break;
        case 2:
          _riveArtboard_dcvalve.artboard..addController(SimpleAnimation('Fwd-Neut'));
          break;
        case 3:
          _riveArtboard_dcvalve.artboard..addController(SimpleAnimation('Bwd-Neut'));
          break;
        case 4:
          _riveArtboard_dcvalve.artboard..addController(SimpleAnimation('Neut-Bwd'));
          break;
        default:
          _riveArtboard_dcvalve.artboard..addController(SimpleAnimation('idle'));
      }
      return Rive(
        artboard: _riveArtboard_dcvalve,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget reliefvalve(state) {
    if (_riveArtboard_reliefvalve != null) {
      switch (state) {
        case 1:
          _riveArtboard_reliefvalve.artboard..addController(SimpleAnimation('Open'));
          break;
        case 2:
          _riveArtboard_reliefvalve.artboard..addController(SimpleAnimation('Close'));
          break;
        default:
          _riveArtboard_reliefvalve.artboard..addController(SimpleAnimation('Close'));
      }
      return Rive(
        artboard: _riveArtboard_reliefvalve,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget pump(state) {
    if (_riveArtboard_pump != null) {
      switch (state) {
        case 1:
          _riveArtboard_pump.artboard..addController(SimpleAnimation('Running'));
          break;
        default:
          _riveArtboard_pump.artboard..addController(SimpleAnimation('Running'));
      }
      return Rive(
        artboard: _riveArtboard_pump,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget pipe1(state) {
    if (_riveArtboard_pipe1 != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('Low-static'));
          break;
        case 2:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('High-static'));
          break;
        case 3:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 4:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('High-pres'));
          break;
        case 5:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('Low-rev'));
          break;
        case 6:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('High-rev'));
          break;
        default:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('Low-static'));
      }
      return Rive(
        artboard: _riveArtboard_pipe1,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget pipe2(state) {
    if (_riveArtboard_pipe2 != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('Low-static'));
          break;
        case 2:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('High-static'));
          break;
        case 3:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 4:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('High-pres'));
          break;
        case 5:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('Low-rev'));
          break;
        case 6:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('High-rev'));
          break;
        default:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('Low-static'));
      }
      return Rive(
        artboard: _riveArtboard_pipe2,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget pipe3(state) {
    if (_riveArtboard_pipe3 != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('Low-static'));
          break;
        case 2:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('High-static'));
          break;
        case 3:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 4:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('High-pres'));
          break;
        case 5:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('Low-rev'));
          break;
        case 6:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('High-rev'));
          break;
        default:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('Low-static'));
      }
      return Rive(
        artboard: _riveArtboard_pipe3,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container();
    }
  }
  Widget pipe4(state) {
    if (_riveArtboard_pipe4 != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('Low-static'));
          break;
        case 2:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('High-static'));
          break;
        case 3:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 4:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('High-pres'));
          break;
        case 5:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('Low-rev'));
          break;
        case 6:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('High-rev'));
          break;
        default:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('Low-static'));
      }
      return Rive(
        artboard: _riveArtboard_pipe4,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container();
    }
  }
  Widget pipe5(state) {
    if (_riveArtboard_pipe5 != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipe5.artboard..addController(SimpleAnimation('Low-static'));
          break;
        case 2:
          _riveArtboard_pipe5.artboard..addController(SimpleAnimation('High-static'));
          break;
        case 3:
          _riveArtboard_pipe5.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 4:
          _riveArtboard_pipe5.artboard..addController(SimpleAnimation('High-pres'));
          break;
        case 5:
          _riveArtboard_pipe5.artboard..addController(SimpleAnimation('Low-rev'));
          break;
        case 6:
          _riveArtboard_pipe5.artboard..addController(SimpleAnimation('High-rev'));
          break;
        default:
          _riveArtboard_pipe5.artboard..addController(SimpleAnimation('Low-static'));
      }
      return Rive(
        artboard: _riveArtboard_pipe5,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container();
    }
  }
  Widget pipe6(state) {
    if (_riveArtboard_pipe6 != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipe6.artboard..addController(SimpleAnimation('Low-static'));
          break;
        case 2:
          _riveArtboard_pipe6.artboard..addController(SimpleAnimation('High-static'));
          break;
        case 3:
          _riveArtboard_pipe6.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 4:
          _riveArtboard_pipe6.artboard..addController(SimpleAnimation('High-pres'));
          break;
        case 5:
          _riveArtboard_pipe6.artboard..addController(SimpleAnimation('Low-rev'));
          break;
        case 6:
          _riveArtboard_pipe6.artboard..addController(SimpleAnimation('High-rev'));
          break;
        default:
          _riveArtboard_pipe6.artboard..addController(SimpleAnimation('Low-static'));
      }
      return Rive(
        artboard: _riveArtboard_pipe6,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container();
    }
  }
  Widget pipe7(state) {
    if (_riveArtboard_pipe7 != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipe7.artboard..addController(SimpleAnimation('Low-static'));
          break;
        case 2:
          _riveArtboard_pipe7.artboard..addController(SimpleAnimation('High-static'));
          break;
        case 3:
          _riveArtboard_pipe7.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 4:
          _riveArtboard_pipe7.artboard..addController(SimpleAnimation('High-pres'));
          break;
        case 5:
          _riveArtboard_pipe7.artboard..addController(SimpleAnimation('Low-rev'));
          break;
        case 6:
          _riveArtboard_pipe7.artboard..addController(SimpleAnimation('High-rev'));
          break;
        default:
          _riveArtboard_pipe7.artboard..addController(SimpleAnimation('Low-static'));
      }
      return Rive(
        artboard: _riveArtboard_pipe7,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget pipet_shape(state) {
    if (_riveArtboard_pipet_shape != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipet_shape.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 2:
          _riveArtboard_pipet_shape.artboard..addController(SimpleAnimation('High-pres'));
          break;
        default:
          _riveArtboard_pipet_shape.artboard..addController(SimpleAnimation('High-pres'));
      }
      return Rive(
        artboard: _riveArtboard_pipet_shape,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget reservoir1(state) {
    if (_riveArtboard_reservoir!= null) {
      switch (state) {
        case 1:
          _riveArtboard_reservoir.artboard..addController(SimpleAnimation('Filling'));
          break;
        default:
          _riveArtboard_reservoir.artboard..addController(SimpleAnimation('Filling'));
      }
      return Rive(
        artboard: _riveArtboard_reservoir,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
  Widget l_shapepipe1(state) {
    if (_riveArtboard_pipel_shape1!= null) {
      switch (state) {
        case 1:
          _riveArtboard_pipel_shape1.artboard..addController(SimpleAnimation('Low-Static'));
          break;
        case 2:
          _riveArtboard_pipel_shape1.artboard..addController(SimpleAnimation('High-Static'));
          break;
        case 3:
          _riveArtboard_pipel_shape1.artboard..addController(SimpleAnimation('Low-Down'));
          break;
        case 4:
          _riveArtboard_pipel_shape1.artboard..addController(SimpleAnimation('High-Static'));
          break;
        default:
          _riveArtboard_pipel_shape1.artboard..addController(SimpleAnimation('Low-Static'));
      }
      return Rive(
        artboard: _riveArtboard_pipel_shape1,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container();
    }
  }
  Widget l_shapepipe2(state) {
    if (_riveArtboard_pipel_shape2!= null) {
      switch (state) {
        case 1:
          _riveArtboard_pipel_shape2.artboard..addController(SimpleAnimation('Low-Static'));
          break;
        case 2:
          _riveArtboard_pipel_shape2.artboard..addController(SimpleAnimation('High-Static'));
          break;
        case 3:
          _riveArtboard_pipel_shape2.artboard..addController(SimpleAnimation('Low-Down'));
          break;
        case 4:
          _riveArtboard_pipel_shape2.artboard..addController(SimpleAnimation('High-Static'));
          break;
        default:
          _riveArtboard_pipel_shape2.artboard..addController(SimpleAnimation('Low-Static'));
      }
      return Rive(
        artboard: _riveArtboard_pipel_shape2,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container();
    }
  }
  Widget piston_double(state) {
    if (_riveArtboard_piston_double != null) {
      switch (state) {
        case 1:
          _riveArtboard_piston_double.artboard..addController(SimpleAnimation('Forward'));
          break;
        case 2:
          _riveArtboard_piston_double.artboard..addController(SimpleAnimation('Backward'));
          break;
        case 3:
          _riveArtboard_piston_double.artboard..addController(SimpleAnimation('Forward-static'));
          break;
        case 4:
          _riveArtboard_piston_double.artboard..addController(SimpleAnimation('Backward-static'));
          break;
        default:
          _riveArtboard_piston_double.artboard..addController(SimpleAnimation('Backward-static'));
      }
      return Rive(
        artboard: _riveArtboard_piston_double,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
}

