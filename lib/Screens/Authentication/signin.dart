import 'package:eye_suggest/Screens/Authentication/signup.dart';
import 'package:eye_suggest/Screens/Home/home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({
    Key? key,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              // margin: const EdgeInsets.only(
              //   top: 50.0,
              // ),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/app-bar.png'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Color.fromRGBO(196, 196, 196, 0.5400000214576721),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/sigin.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.0,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.0,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(33, 111, 182, 1),
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
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.0,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.0,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(33, 111, 182, 1),
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
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
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
                          Theme.of(context).primaryColor,
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return Authentication();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
