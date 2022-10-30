// import 'package:camera/camera.dart';
import 'package:eye_suggest/Screens/home.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  // final List<CameraDescription>? cameras;
  Authentication({
    Key? key,
    // this.cameras,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _canLogin(BuildContext context) {
    FocusScope.of(context).unfocus();
    var isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    var _email = "";
    var _password = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text('EyeSuggest'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              child: const Text('Login'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                fixedSize: MaterialStateProperty.all(
                  Size.fromWidth(MediaQuery.of(context).size.width),
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.blue,
                ),
                elevation: MaterialStateProperty.all(2),
              ),
              onPressed: () {
                if (_canLogin(context)) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage(
                          title: 'EyeSuggest',
                          // cameras: cameras,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
