import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random/screens/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  String? email, pass, confPass;

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
                                    'Join Us!',
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
                                  "Create your account\nJoin Random!",
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
                                        return 'Random app does not prefer random password';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    onSaved: (newValue) {
                                      confPass = newValue;
                                    },
                                    obscureText: _passwordVisible,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        hintText: 'Confirm Password',
                                        label: const Text('Confirm Password')),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value != pass) {
                                        return 'Password dose not match';
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
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );

                                        try {
                                          final credential = await FirebaseAuth
                                              .instance
                                              .createUserWithEmailAndPassword(
                                            email: email!.trim(),
                                            password: pass!,
                                          );
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Login(),
                                              ));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'weak-password') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'The password provided is too weak.')),
                                            );
                                          } else if (e.code ==
                                              'email-already-in-use') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'The account already exists for that email.')),
                                            );
                                            //todo navigate to login
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Login(),
                                                ));
                                          }
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Sign Up',
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
                                  "You Already Random?",
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
                                          builder: (context) => Login(),
                                        ));
                                  },
                                  child: Text(
                                    " Sign In",
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
