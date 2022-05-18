import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FittedBox(
                  child: Row(
                    children: [
                      Image.network('https://i.ibb.co/ct7FWJs/Pngtree-cartoon-language-icon-free-clipart-4628069.png',width: 50),
                      Text(' Welcome, Ahmed!',style: TextStyle(fontFamily: 'Skranji',fontSize: 20),)
                    ],
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
