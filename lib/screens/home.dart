import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random/screens/welcome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                              'https://i.ibb.co/ct7FWJs/Pngtree-cartoon-language-icon-free-clipart-4628069.png',
                              width: 50),
                          Text(
                            ' Welcome Agian!',
                            style: TextStyle(
                                fontFamily: 'Skranji',
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(),
                              ));
                        },
                        child: Icon(
                          Icons.door_front_door_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blueGrey),
                    child: Center(
                      child: Text(
                        'Iam so sorry but I didnot have the time to finish my project I only did sign in with Email and password sign up with email and password with email verification and also you can sign in anonymous by firebase Thanks alot for all these valuable content and i wish all good for you\nAhmed AbdElmohsen Ali Diab',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Skranji'),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
