import 'package:flutter/material.dart';
import 'package:random/screens/home.dart';
import 'package:random/screens/login.dart';
import 'package:random/screens/register.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Image.asset(fit: BoxFit.cover, 'assets/images/background.jpg'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30)),
                      child: Image.asset('assets/images/welcome.jpeg'),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            FittedBox(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  'Welcome To\nThe World of RANDOMS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff101032),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      fontFamily: 'Skranji'),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                'Explore the world of Randoms\nby getting random choices for everything.\nLet your decision be Random.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff101032),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        ToggleButtons(
                          borderRadius: BorderRadius.circular(10),
                          direction: Axis.horizontal,
                          borderWidth: 2,
                          color: Colors.black,
                          borderColor: Colors.white,
                          selectedBorderColor: Colors.white,
                          onPressed: (index) async {
                            if (index == 0) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ));
                            }else {
                              try {
                                final userCredential =
                                    await FirebaseAuth.instance.signInAnonymously();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                                print("Signed in with temporary account. ---- \n$userCredential");
                              } on FirebaseAuthException catch (e) {
                                switch (e.code) {
                                  case "operation-not-allowed":
                                    print("Anonymous auth hasn't been enabled for this project.");
                                    break;
                                  default:
                                    print("Unknown error.");
                                }
                              }

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            }
                          },
                          isSelected: [true, false],
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 17),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontFamily: 'Skranji', fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontFamily: 'Skranji', fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
