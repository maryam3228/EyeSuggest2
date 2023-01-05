// import 'package:camera/camera.dart';
// import 'package:eye_suggest/Screens/home.dart';
// import 'package:eye_suggest/Screens/splash_screen.dart';

import 'dart:async';

import 'package:eye_suggest/Screens/Authentication/signin.dart';
import 'package:eye_suggest/Screens/Authentication/signup.dart';
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
    Map<int, Color> color = {
      50: const Color.fromRGBO(33, 111, 182, .1),
      100: const Color.fromRGBO(33, 111, 182, .2),
      200: const Color.fromRGBO(33, 111, 182, .3),
      300: const Color.fromRGBO(33, 111, 182, .4),
      400: const Color.fromRGBO(33, 111, 182, .5),
      500: const Color.fromRGBO(33, 111, 182, .6),
      600: const Color.fromRGBO(33, 111, 182, .7),
      700: const Color.fromRGBO(33, 111, 182, .8),
      800: const Color.fromRGBO(33, 111, 182, .9),
      900: const Color.fromRGBO(33, 111, 182, 1),
    };
    MaterialColor themeColor = MaterialColor(0xFF216fb6, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eye Suggest',
      theme: ThemeData(
        primarySwatch: themeColor,
        fontFamily: 'ABeeZee',
      ),
      // home: const HomePage(
      //   // cameras: cameras,
      //   title: 'EyeSuggest',
      // ),
      // home: StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, user) {
      //       if (!user.hasData) {
      //         return Authentication();
      //       } else {
      //         return SignIn();
      //       }
      //     }),
      // home: const SplashscreenWidget(),
      home: Authentication(),
    );
  }
}
