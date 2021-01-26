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
  RiveAnimationController _controller;
  Artboard _riveArtboard;

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
          artboard.addController(_controller = SimpleAnimation('idle'));
          setState(() => _riveArtboard = artboard);
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
    if (_riveArtboard != null) {
      switch (state) {
        case 1:
          _riveArtboard.artboard..addController(SimpleAnimation('Forward'));
          break;
        case 2:
          _riveArtboard.artboard..addController(SimpleAnimation('Backward'));
          break;
      }
      return Rive(
        artboard: _riveArtboard,
        fit: BoxFit.cover,
      );
    } else {
      return Container();
    }
  }
}

