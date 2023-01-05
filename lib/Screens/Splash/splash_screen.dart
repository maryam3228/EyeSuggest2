import 'package:flutter/material.dart';

class SplashscreenWidget extends StatelessWidget {
  const SplashscreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator SplashscreenWidget - FRAME
    return Container(
      width: 375,
      height: 812,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          // Figma Flutter Generator Group13Widget - GROUP
          SizedBox(
            width: 286,
            height: 84,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                    width: 286,
                    height: 84,
                    child: Stack(
                      children: <Widget>[
                        const Positioned(
                          top: 32,
                          left: 66,
                          child: Text(
                            'EyeSuggest',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(34, 111, 184, 1),
                              fontSize: 32,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 88,
                            height: 74,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/app-bar.png',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 695,
            left: 38,
            child: Container(
              width: 308,
              height: 58,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(33, 111, 182, 1),
              ),
            ),
          ),
          const Positioned(
            top: 711,
            left: 133,
            child: Text(
              'Get Started',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 20,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 463,
            left: 49,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'Consult Specialist Doctors Securely And Privately',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
          Positioned(
            top: 554,
            left: 65,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Text(
                """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Malesuada vulputate facilisi eget neque, nunc suspendisse massa augue. Congue sit augue volutpat vel. Dictum dignissim ac pharetra.""",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 15,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 7,
            child: Container(
              width: 361,
              height: 264,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_screen.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
