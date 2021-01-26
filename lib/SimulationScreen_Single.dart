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
  Artboard _riveArtboard_piston;
  Artboard _riveArtboard_dcvalve;
  Artboard _riveArtboard_reliefvalve;
  Artboard _riveArtboard_pump;
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF05A28),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:68.0),
            child: Container(
              height:40,
              child: toggle_p=="Forward"?SingleActingPiston(1):SingleActingPiston(2),
            ),
          ),
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
          Positioned(
              top: 106,
              left:118,
              child: Image.asset('ImageAssets/leftlineneu.png')),
          Positioned(
              top: 107,
              left:186,
              child: Image.asset('ImageAssets/rightlineneu.png')),
          Positioned(
              top: 250,
              left:158,
              child: Image.asset('ImageAssets/linetest.png')),
          Positioned(
              top: 250,
              left:165,
              child: Image.asset('ImageAssets/tank.png')),
          Positioned(
            top: 408,
            left: 280,
            child: Container(
                height: 180,
                width: 100,
                child: reliefvalve(3)),
          ),
          Positioned(child: SizedBox(
            height:750,
          )),
          Positioned(
              left: 0,
              top: 460,
              child: Container(
                  height: 90,
                  width: 200,
                  child: pump(1))),
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
}

