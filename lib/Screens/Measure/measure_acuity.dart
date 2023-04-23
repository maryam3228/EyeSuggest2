import 'dart:async';
import 'dart:math';
import 'package:eye_suggest/Screens/ShowScore/show_score.dart';
import 'package:eye_suggest/SnellenChart/snellen_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:wakelock/wakelock.dart';

class MeasureAcuity extends StatefulWidget {
  const MeasureAcuity({Key? key}) : super(key: key);

  @override
  State<MeasureAcuity> createState() => _MeasureAcuityState();
}

class _MeasureAcuityState extends State<MeasureAcuity> {
  // state variables
  var _text = '', _isSpeechActive = false, _snellenLetter = '';
  int _correctRead = 0, _incorrectRead = 0, _rowCount = 0, _sizeOfChart = 70;
  var _isTryAgain = false, _coverLeftEye = false, _testingRightEye = false;
  var _leftEyeScore = 0, _rightEyeScore = 0;

  // speech-to-text identifier
  final _speech = SpeechToText();

  // activate speech-to-text module
  void _activateSpeechToText() async {
    // generate the letter to display
    setState(() {
      _snellenLetter = _getSnellenLetter(1);
    });

    // initialize speech to text function
    var isSpeechActive = await _speech.initialize(
      onError: (_) {
        // prompt the user to try again
        // tryAgain();
        _tryAgain();
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
          // change the size of the chart and check the correct inputs
          if (_incorrectRead <= _correctRead) {
            // decrease the size and reset the state variables
            setState(() {
              _isSpeechActive = false;
              _snellenLetter = '';
              _correctRead = 0;
              _incorrectRead = 0;
              _rowCount = 0;

              // reset accordingly the size of chart
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
                _endTest();
              }
            });

            // listen again
            _activateSpeechToText();
          } else {
            // end the test
            _endTest();
          }
        }
      } else {
        // prompt the user to try again
        _tryAgain();
      }
    }
  }

  void _endTest() async {
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

    if (!_testingRightEye) {
      _leftEyeScore = scoreSize;
    } else {
      _rightEyeScore = scoreSize;
    }

    setState(() {
      _testingRightEye = !_testingRightEye;
    });

    await _speech.stop();

    if (_testingRightEye) {
      // prompt to cover the left-eye
      setState(() {
        _coverLeftEye = true;
        _isSpeechActive = false;
        _snellenLetter = '';
        _correctRead = 0;
        _incorrectRead = 0;
        _rowCount = 0;
        _sizeOfChart = 70;
        _text = '';
      });

      // drop after 10 seconds
      Timer(const Duration(seconds: 10), () {
        setState(() {
          _coverLeftEye = false;
        });

        // start the test for right-eye
        _activateSpeechToText();
      });
    } else {
      // navigate to show score Page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ShowScore(
              rightEyeScore: _rightEyeScore,
              leftEyeScore: _leftEyeScore,
            );
          },
        ),
      );
    }
  }

  Widget _coverLeftEyeInstruction() {
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
                "Test will start in 10 seconds",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tryAgainWidget() {
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

  void _tryAgain() async {
    setState(() {
      _isTryAgain = true;
    });
    await _speech.stop();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isTryAgain = false;
      });
      _activateSpeechToText();
    });
  }

  String _getSnellenLetter(int length) {
    // the list of characters
    const _chars = 'ABCDEFGHIJKLMNOPQRSTVWXYZ';

    // initialize the random class
    Random random = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          random.nextInt(_chars.length),
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
    // disbale screen-timeout
    Wakelock.enable();

    return _coverLeftEye
        ? _coverLeftEyeInstruction()
        : Scaffold(
            body: _isTryAgain
                ? _tryAgainWidget()
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
