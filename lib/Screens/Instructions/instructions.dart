import 'package:bulleted_list/bulleted_list.dart';
import 'package:eye_suggest/Screens/Instructions/right_eye_instruction.dart';
import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  const Instructions({
    Key? key,
  }) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  final _listOfInstructions = [
    "It's recommended to take help of a companion in holding the smartphone 10 feet away from you. Maintaining the distance is crucial for the test.",
    "The Snellen's Chart will be displayed on the screen.",
    "Three letters will be displayed from each row of the Snellen's Chart.",
    "Speak out the letter displayed on the screen. If you read correctly, the next letter will be shown.",
    "For every row in the Snellen's Chart, three letters will be displayed one-by-one. After that, the size of the letters will decrease, i.e., next row of the Snellen's Chart will be displayed.",
    "The test will end if you are unable to guess 2 out of 3 letters displayed.",
    "If there is some disturbance in recognizing your speech, you will be prompted to try again speaking the letter displayed on the screen.",
    "You are recommended to wear Bluetooth headphones for ease of speech recognition.",
    "You have to strictly say the phrase 'THE LETTER X' while speaking out the letter identified, where X represents the letter that will be displayed on the screen during the test.",
    "If you fail to speak out the complete phrase, you will be prompted to try again.",
    "If at any point you are unable to read out the letters displayed, guess and speak out any random letter, in the same phrase format.",
    "You have to attempt the test twice, for one eye at time. Please attempt the test with your left eye first and cover your right eye with a plain occluder, card or a tissue. Do not press on your eye. Repeat the entire process for right eye.",
    "It is important that you follow the order for the test, i.e., left eye first and right eye second.",
    "Once the test has successfully completed, the score for the respective eye will be displayed.",
    "The test will start as soon as you press 'Ok'. You will be prompted to speak out the letter, so get in position and ask your companion to press 'Ok' for you once you are comfortable.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image.asset(
                    'assets/images/app-bar.png',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please read the instructions carefully',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: BulletedList(
                  style: const TextStyle(
                    fontFamily: 'ABeeZee',
                    color: Colors.black,
                  ),
                  listItems: _listOfInstructions,
                  bulletType: BulletType.conventional,
                  bulletColor: Colors.grey.shade800,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const RightEyeInstruction();
                    },
                  ),
                );
              },
              child: const Text(
                'Ok',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
                ),
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
