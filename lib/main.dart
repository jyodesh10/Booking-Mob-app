import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';


// void main() => runApp(MyApp()); 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //calls the first screen login page
    return MaterialApp(
      title: 'BOoking',
      home: Scaffold(
        appBar: null,
        floatingActionButton: null,
        backgroundColor: Colors.grey,
        body: Signin(),
      ),
    );
  }
}




