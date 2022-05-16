import 'package:flutter/material.dart';


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
          child:
          Image.asset(fit: BoxFit.cover, 'assets/images/background.jpg'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
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
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20,vertical: 17),
                            child: Text(
                              'Register',
                              style: TextStyle(fontFamily: 'Skranji',fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontFamily: 'Skranji',fontSize: 20),
                            ),
                          ),

                        ],
                        onPressed: (index){}, isSelected:[true,false] ,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
