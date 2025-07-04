//Imports
import 'package:contactapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

//Main Method
void main() {
  runApp(Main());
}

//Statless Class
class Main extends StatelessWidget {
  Main({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
