import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_suggest/Screens/Instructions/instructions.dart';
import 'package:eye_suggest/Screens/SimulateVision/simulate_vision.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Instructions();
                    },
                  ),
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
                        'Simulate Vision',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your vision under simulation',
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SimulateVision();
                    },
                  ),
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
