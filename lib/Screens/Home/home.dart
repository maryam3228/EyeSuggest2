import 'package:bulleted_list/bulleted_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Measure/measure_acuity.dart';

class HomePage extends StatefulWidget {
  final String? title;

  const HomePage({
    Key? key,
    @required this.title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url =
      Uri.parse('https://www.google.com/maps/search/ophthalmologist near me');

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
    "Once the test has successfully completed, the score will be displayed.",
    "The test will start as soon as you press 'Ok'. You will be prompted to speak out the letter, so get in position and ask your companion to press 'Ok' for you once you are comfortable.",
  ];

  Future<void> _onSignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/app-bar.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: IconButton(
                    onPressed: _onSignOut,
                    icon: const Icon(
                      Icons.logout_rounded,
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .get()
                  .asStream(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var userData = snapshot.data!.data();
                  return Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      "Hi, ${userData!['name']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  );
                }
              }),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white60,
                    spreadRadius: 4,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.only(
                top: 22,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/homeScreen.png',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 15,
              ),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Services',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 2,
                ),
              ),
            ),
            InkWell(
              child: Card(
                elevation: 8,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Measure Visual Acuity',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Check your visual acuity',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title:
                          const Text('Please read the instructions carefully.'),
                      content: SingleChildScrollView(
                        child: BulletedList(
                          listItems: _listOfInstructions,
                          // listOrder: ListOrder.ordered,
                          bulletType: BulletType.numbered,
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (buildContext) {
                                  return const MeasureAcuity();
                                },
                              ),
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            InkWell(
              child: Card(
                elevation: 8,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nearby Clinics',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Check for nearby opthalmologists',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: _launchUrl,
            ),
          ],
        ),
      ),
    );
  }
}
