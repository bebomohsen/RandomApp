import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

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
          body: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
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
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      hintText: 'Enter username',
                                      label: Text('Username')),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Random app does not prefer random username';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: _passwordVisible,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color:
                                              Theme.of(context).primaryColorDark,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      hintText: 'Enter Password',
                                      label: Text('Password')),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Random app does not prefer random password';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(
                                              fontSize: 24,
                                              fontFamily: 'Skranji')),
                                      minimumSize: MaterialStateProperty.all(
                                          Size(double.infinity, 60)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)))),
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
                                  child: const Text(
                                    'Sign In',
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "Stop being random! &",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff101032),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                " Create Account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
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
    );
  }
}
