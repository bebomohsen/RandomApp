import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random/screens/home.dart';
import 'package:random/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  String? email, pass;
    UserCredential? credential = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child:
                Image.asset(fit: BoxFit.cover, 'assets/images/background.jpg'),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Hello Again!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff101032),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        fontFamily: 'Skranji'),
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  "Welcome back you've\nbeen missed!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff101032),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    onSaved: (newValue) {
                                      email = newValue;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        hintText: 'Enter E-mail',
                                        label: const Text('E-mail')),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Random app does not prefer Empty E-mail';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value!)) {
                                        return 'Random app does not prefer random Text';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    onSaved: (newValue) {
                                      pass = newValue;
                                    },
                                    obscureText: _passwordVisible,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        hintText: 'Enter Password',
                                        label: const Text('Password')),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Random app does not prefer Empty text';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        textStyle: MaterialStateProperty.all(
                                            const TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Skranji')),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(double.infinity, 60)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15)))),
                                    onPressed: () async {
                                      _formKey.currentState!.save();
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          credential = await FirebaseAuth
                                              .instance
                                              .signInWithEmailAndPassword(
                                            email: email!.trim(),
                                            password: pass!,
                                          );

                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'No user found for that email.')),
                                            );
                                          } else if (e.code ==
                                              'wrong-password') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Wrong password provided for that user.')),
                                            );
                                          }
                                        } catch (e) {
                                          print(e);
                                        }
                                        if(credential != null){
                                          if (credential!.user!.emailVerified) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Home(),
                                                ));
                                          } else {
                                            credential!.user!.sendEmailVerification();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Check your Email First for verification .')),
                                            );
                                          }
                                        }
                                      }
                                      print(credential);
                                    },
                                    child: const Text(
                                      'Sign In',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueGrey),
                                        textStyle: MaterialStateProperty.all(
                                            const TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Skranji')),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(double.infinity, 60)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15)))),
                                    onPressed: () async {
                                      try {
                                        final userCredential =
                                            await FirebaseAuth.instance
                                                .signInAnonymously();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ));
                                        print(
                                            "Signed in with temporary account. ---- \n$userCredential");
                                      } on FirebaseAuthException catch (e) {
                                        switch (e.code) {
                                          case "operation-not-allowed":
                                            print(
                                                "Anonymous auth hasn't been enabled for this project.");
                                            break;
                                          default:
                                            print("Unknown error.");
                                        }
                                      }
                                    },
                                    child: FittedBox(
                                      child: const Text(
                                        'No Account Go as Random',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                const Text(
                                  "Stop being random! &",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff101032),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Register(),
                                        ));
                                  },
                                  child: Text(
                                    " Create Account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
