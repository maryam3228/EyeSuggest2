import 'dart:async';
import 'dart:math';
import 'package:eye_suggest/Screens/Measure/left_eye_instruction.dart';
import 'package:eye_suggest/SnellenChart/snellen_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MeasureAcuity extends StatefulWidget {
  const MeasureAcuity({Key? key}) : super(key: key);

  @override
  State<MeasureAcuity> createState() => _MeasureAcuityState();
}

class _MeasureAcuityState extends State<MeasureAcuity> {
  // state variables
  var _text = '', _isSpeechActive = false, _snellenLetter = '';
  int _correctRead = 0, _incorrectRead = 0, _rowCount = 0, _sizeOfChart = 70;
  var _isTryAgain = false;

  // speech-to-text identifier
  final _speech = SpeechToText();

  // activate speech-to-text module
  void _activateSpeechToText() async {
    // generate the letter to display
    setState(() {
      _snellenLetter = getSnellenLetter(1);
    });

    // initialize speech to text function
    var isSpeechActive = await _speech.initialize(
      onError: (_) {
        // prompt the user to try again
        // tryAgain();
        alternateTryAgain();
      },
    );

    // set the state variable to true
    setState(() {
      _isSpeechActive = isSpeechActive;
    });

    // call the listen function
    _convertSpeechToText();
  }

  void _convertSpeechToText() async {
    if (_isSpeechActive) {
      // prompt the user to speak
      // -----------------

      // start listening
      await _speech.listen(
        onResult: (result) {
          _onResult(result);
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Speech Recognition Inactive'),
            content: const Text(
              'Speech recognition is currently inactive, please enable it to use voice commands.',
            ),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  // to pop the dialog box
                  Navigator.of(context).pop();

                  // to return to the home screen
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  void _onResult(SpeechRecognitionResult result) async {
    if (result.finalResult) {
      // get the result and update the state variable
      var recognizedText = result.recognizedWords;
      setState(() {
        _text = recognizedText;
      });

      // convert the string to upper case
      _text = _text.toUpperCase();

      // regular expression
      var requiredExpression = RegExp(r'^THE LETTER [A-Z]$');

      // check if speech-to-text is as required by us
      if (_text.contains(requiredExpression)) {
        // split the string to get the letter
        var recognizedString = _text.split(' ');

        // check for the required letter
        if (recognizedString.contains(_snellenLetter)) {
          _correctRead += 1;
        } else {
          _incorrectRead += 1;
        }

        // increase the row count after every letter displayed
        _rowCount += 1;

        // show 3 letters in each row
        if (_rowCount < 3) {
          // listen for 3 times in a row
          _activateSpeechToText();
        } else {
          // change the size of the chart
          // check the correct inputs
          if (_incorrectRead <= _correctRead) {
            // decrease the size
            // reset the state variables
            setState(() {
              _isSpeechActive = false;
              _snellenLetter = '';
              _correctRead = 0;
              _incorrectRead = 0;
              _rowCount = 0;

              // reset accordingly the sizeo of chart
              if (_sizeOfChart == 70) {
                _sizeOfChart = 60;
              } else if (_sizeOfChart == 60) {
                _sizeOfChart = 50;
              } else if (_sizeOfChart == 50) {
                _sizeOfChart = 40;
              } else if (_sizeOfChart == 40) {
                _sizeOfChart = 30;
              } else if (_sizeOfChart == 30) {
                _sizeOfChart = 20;
              } else if (_sizeOfChart == 20) {
                _sizeOfChart = 15;
              } else if (_sizeOfChart == 15) {
                _sizeOfChart = 10;
              } else if (_sizeOfChart == 10) {
                _sizeOfChart = 7;
              } else if (_sizeOfChart == 7) {
                _sizeOfChart = 4;
              } else {
                // end the test
                endTest();
              }
            });

            // listen again
            _activateSpeechToText();
          } else {
            // end the test
            endTest();
          }
        }
      } else {
        // prompt the user to try again
        // tryAgain();
        alternateTryAgain();
      }
    }
  }

  void endTest() {
    // set the size at which the user was able to corectly read the entire row
    var scoreSize = 0;
    if (_sizeOfChart == 70) {
      scoreSize = 0;
    } else if (_sizeOfChart == 60) {
      scoreSize = 70;
    } else if (_sizeOfChart == 50) {
      scoreSize = 60;
    } else if (_sizeOfChart == 40) {
      scoreSize = 50;
    } else if (_sizeOfChart == 30) {
      scoreSize = 40;
    } else if (_sizeOfChart == 20) {
      scoreSize = 30;
    } else if (_sizeOfChart == 15) {
      scoreSize = 20;
    } else if (_sizeOfChart == 10) {
      scoreSize = 15;
    } else if (_sizeOfChart == 7) {
      scoreSize = 10;
    } else if (_sizeOfChart == 4) {
      scoreSize = 7;
    } else {
      scoreSize = 4;
    }

    // navigate to the left-eye instruction page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return LeftEyeInstruction(
            leftEyeScore: scoreSize,
          );
        },
      ),
    );
  }

  Widget tryAgainWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Try Again',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Image.asset(
            'assets/images/try_again.png',
          ),
        ],
      ),
    );
  }

  void alternateTryAgain() async {
    await _speech.cancel();
    setState(() {
      _isTryAgain = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isTryAgain = false;
      });
      _activateSpeechToText();
    });
  }

  // void tryAgain() async {
  //   await _speech.cancel();
  //   await showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (dialogContext) {
  //       // to dismiss the dialog box automatically
  //       Timer(const Duration(seconds: 3), () {
  //         Navigator.pop(dialogContext);
  //       });

  //       // Future.delayed(const Duration(seconds: 3), () {
  //       //   Navigator.of(context).pop(true);
  //       // });

  //       // the dialog box
  //       return AlertDialog(
  //         title: const Text(
  //           'Try Again',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: 28,
  //           ),
  //         ),
  //         content: Image.asset(
  //           'assets/images/try_again.png',
  //         ),
  //       );
  //     },
  //   );

  //   // listen again
  //   _activateSpeechToText();
  // }

  String getSnellenLetter(int length) {
    // the list of characters
    const _chars = 'ABCDEFGHIJKLMNOPQRSTVWXYZ';

    // initialize the random class
    Random _rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _activateSpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isTryAgain
          ? tryAgainWidget()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Letter: ' + (_rowCount + 1).toString(),
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SnellenChartWidget(
                    feet: _sizeOfChart,
                    letterToDisplay: _snellenLetter,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    _text,
                  ),
                ],
              ),
            ),
    );
  }
}
