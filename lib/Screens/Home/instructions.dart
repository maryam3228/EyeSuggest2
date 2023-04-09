import 'package:bulleted_list/bulleted_list.dart';
import 'package:eye_suggest/Screens/Measure/right_eye_instruction.dart';
import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  final List<String> listOfInstructions;
  const Instructions({
    Key? key,
    required this.listOfInstructions,
  }) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          """Please read the intrsuctions 
carefully.""",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BulletedList(
                listItems: widget.listOfInstructions,
                bulletType: BulletType.numbered,
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
      ),
    );
  }
}
