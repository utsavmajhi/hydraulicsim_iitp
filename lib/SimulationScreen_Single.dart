import 'dart:math';

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
  RiveAnimationController _controller_piston;
  RiveAnimationController _controller_dcvalve;
  RiveAnimationController _controller_reliefvalve;
  RiveAnimationController _controller_pump;
  RiveAnimationController _controller_pipe1;
  RiveAnimationController _controller_pipe2;
  RiveAnimationController _controller_pipe3;
  RiveAnimationController _controller_pipe4;
  RiveAnimationController _controller_pipet_shape;
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
  Artboard _riveArtboard_pipet_shape;
  Artboard _riveArtboard_reservoir;
  Artboard _riveArtboard_piston_double;
  String toggle_p="Forward";
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
          artboard.addController(_controller_piston = SimpleAnimation('idle'));
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
          artboard.addController(_controller_dcvalve = SimpleAnimation('Neut-Fwd'));
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
          artboard.addController(_controller_pipe1 = SimpleAnimation('idle'));
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
          artboard.addController(_controller_pipe2 = SimpleAnimation('idle'));
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
          artboard.addController(_controller_pipe3 = SimpleAnimation('idle'));
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
          artboard.addController(_controller_pipe4 = SimpleAnimation('idle'));
          setState(() => _riveArtboard_pipe4 = artboard);
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
          artboard.addController(_controller_piston_double = SimpleAnimation('idle'));
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF05A28),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:68.0,left:70),
            child: Container(
              height:50,
              child: toggle_p=="Forward"?piston_double(1):piston_double(2),
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
                    child: pipe1(1)),
              )),
          Positioned(
              top: 148,
              left:110,
              child: Transform.rotate(
                angle: (5*pi)/3,
                child: Container(
                    height: 90,
                    width: 180,
                    child: pipe2(2)),
              )),
          Positioned(
            top: 158,
            left: 66,
            child: Container(
              color: Colors.transparent,
              height: 170,
              width: 230,
              child: dcvalve4_3(6),
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
                    child: pipe3(1)),
              )),
          Positioned(
            top: 485,
            left: 120,
            child: Container(
                height: 180,
                width: 100,
                child: reliefvalve(3)),
          ),
          Positioned(
              top: 648,
              left:129,
              child: Transform.rotate(
                angle: (pi)/2,
                child: Container(
                    height: 10,
                    width: 80,
                    child: pipe4(1)),
              )),
          Positioned(child: SizedBox(
            height:750,
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
                    child: pipe1(1)),
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
                    child: pipet_shape(1)),
              )),
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(toggle_p=="Forward"){
              toggle_p="Backward";
            }else{
              toggle_p="Forward";
            }
          });
        },
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
          _riveArtboard_reliefvalve.artboard..addController(SimpleAnimation('idle'));
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
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('idle'));
          break;
        case 2:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('High-pres'));
          break;
        default:
          _riveArtboard_pipe1.artboard..addController(SimpleAnimation('High-pres'));
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
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 2:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('High-pres'));
          break;
        default:
          _riveArtboard_pipe2.artboard..addController(SimpleAnimation('High-pres'));
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
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 2:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('High-pres'));
          break;
        default:
          _riveArtboard_pipe3.artboard..addController(SimpleAnimation('High-pres'));
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
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('Low-pres'));
          break;
        case 2:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('High-pres'));
          break;
        default:
          _riveArtboard_pipe4.artboard..addController(SimpleAnimation('High-pres'));
      }
      return Rive(
        artboard: _riveArtboard_pipe4,
        fit: BoxFit.fitHeight,
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
  Widget piston_double(state) {
    if (_riveArtboard_piston_double != null) {
      switch (state) {
        case 1:
          _riveArtboard_piston_double.artboard..addController(SimpleAnimation('Forward'));
          break;
        default:
          _riveArtboard_piston_double.artboard..addController(SimpleAnimation('Backward'));
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

