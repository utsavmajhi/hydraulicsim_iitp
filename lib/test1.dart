import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class test1 extends StatefulWidget {
  static String id='Attribute_Screen';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<test1> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _togglePlay() {
    setState(() => _controller.isActive = !_controller.isActive);
  }

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard _riveArtboard;
  Artboard _riveArtboard2;
  var instance_t1;
  var instance_t2;
  String toggle_p="Forward";
  RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
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
      body: Center(
        child:Container(
            height: 50,
            child: toggle_p=="Forward"? selectGraphic(1):selectGraphic(2)),
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
  Widget selectGraphic(state) {
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
