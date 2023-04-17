import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/warning_widget.dart';
import 'package:flutter_application_1/utilities/colors.dart';
import 'package:flutter_application_1/reusable_Widget/reusable_Widget.dart';
import 'package:flutter_application_1/pages/singup_screen.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  TextEditingController _passwordTextcontroller = TextEditingController();
  TextEditingController _emailTextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              hexStringToColor("6096B4"),
              hexStringToColor("93BFCF"),
              hexStringToColor("BDCDD6")
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter // paleta de corlores del fondo
                )),
        child: ListView(
          children: [
            const WarningWidgetCubit(),
            Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
               const SizedBox(height: 20),
                reusableTxtfield("Enter user name", Icons.person_2_outlined,
                    false, _emailTextcontroller),
               const SizedBox(height: 20),
                reusableTxtfield("Enter password", Icons.lock_outline, true,
                    _passwordTextcontroller),
               const  SizedBox(height: 20),
                singInsingUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextcontroller.text,
                          password: _passwordTextcontroller.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Homescreen()));
                  }).onError((error, stackTrace) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text(" Email o Contraseña incorrecta"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  });
                  ;
                }),
                signUpOption(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(" Don't have account? ",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SingUpScreen()));
        },
        child: const Text(
          " Sing Up ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
