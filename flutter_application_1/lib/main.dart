import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/singin_screen.dart';
import 'package:flutter_application_1/utilities/check_internet_connection.dart';

final internetChecker = CheckInternetConnection();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          appId: '1:226442103665:android:2fd1f764b7b46da37e04d0',
          apiKey: 'AIzaSyBm6yVyjLfmrYsZz2pz7v8H_-b1glmqFKc',
          projectId: 'singin-2bef7',
          messagingSenderId: '226442103665'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SingInScreen(),
    );
  }
}
