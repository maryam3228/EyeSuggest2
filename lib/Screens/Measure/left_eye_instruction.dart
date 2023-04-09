import 'package:eye_suggest/Screens/Measure/measure_acuity_right_eye.dart';
import 'package:flutter/material.dart';

class LeftEyeInstruction extends StatefulWidget {
  final int leftEyeScore;
  const LeftEyeInstruction({
    Key? key,
    required this.leftEyeScore,
  }) : super(key: key);

  @override
  State<LeftEyeInstruction> createState() => _LeftEyeInstructionState();
}

class _LeftEyeInstructionState extends State<LeftEyeInstruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Please cover your left eye.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'assets/images/Lefteye.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text(
                "Once done, press 'Ready'",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return MeasureAcuityRightEye(
                          leftEyeScore: widget.leftEyeScore,
                        );
                      },
                    ),
                  );
                },
                child: const Text(
                  'Ready',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
