import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/reusable_Widget/reusable_Widget.dart';

import '../utilities/colors.dart';
import 'home_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  TextEditingController _passwordTextcontroller = TextEditingController();
  TextEditingController _emailTextcontroller = TextEditingController();
  TextEditingController _userNameTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sing Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("6096B4"),
          hexStringToColor("93BFCF"),
          hexStringToColor("BDCDD6")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            reusableTxtfield("Enter User Name", Icons.person_outline, false,
                _userNameTextcontroller),
            const SizedBox(
              height: 20,
            ),
            reusableTxtfield("Entrer Email", Icons.person_outline, false,
                _emailTextcontroller),
            const SizedBox(
              height: 20,
            ),
            reusableTxtfield("Enter Password", Icons.lock_outline, true,
                _passwordTextcontroller),
            const SizedBox(
              height: 20,
            ),
            singInsingUpButton(context, false, () {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _emailTextcontroller.text,
                      password: _passwordTextcontroller.text)
                  .then((value) {
                print("Create a new account");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            })
          ]),
        ),
      ),
    );
  }
}
