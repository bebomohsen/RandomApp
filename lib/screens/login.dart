import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
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
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
