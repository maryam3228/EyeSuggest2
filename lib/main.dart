// import 'package:camera/camera.dart';
// import 'package:eye_suggest/Screens/authentication.dart';

import 'package:eye_suggest/Screens/home.dart';
import 'package:flutter/material.dart';

// late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // _cameras = await availableCameras();

  runApp(const MyApp(
      // cameras: _cameras,
      ));
}

class MyApp extends StatelessWidget {
  // final List<CameraDescription>? cameras;
  const MyApp({
    Key? key, //this.cameras
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eye Suggest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(
        // cameras: cameras,
        title: 'EyeSuggest',
      ),
      // home: Authentication(
      //   cameras: cameras,
      // ),
    );
  }
}
