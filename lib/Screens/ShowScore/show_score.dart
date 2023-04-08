import 'package:flutter/material.dart';

class ShowScore extends StatefulWidget {
  final int scoreSize;
  const ShowScore({
    Key? key,
    required this.scoreSize,
  }) : super(key: key);

  @override
  State<ShowScore> createState() => _ShowScoreState();
}

class _ShowScoreState extends State<ShowScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Visual Acuity Score:',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.3,
                child: widget.scoreSize == 0
                    ? const Text(
                        '10 / -',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      )
                    : Text(
                        '10 / ' + widget.scoreSize.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              widget.scoreSize == 0
                  ? const Text(
                      'You were not able to read the row of maximum size set for this chart. Your visual acuity score is beyond the scope of this test. Please visit an ophthalmologist for a check-up.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    )
                  : widget.scoreSize > 10
                      ? const Text(
                          'Your vision is poorer than an average person.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        )
                      : widget.scoreSize == 10
                          ? const Text(
                              'Your vision is normal as that of an average person.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            )
                          : const Text(
                              'Your vision is better than an average person.',
                              textAlign: TextAlign.center,
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
}
