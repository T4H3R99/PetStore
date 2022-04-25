import 'package:flutter/material.dart';
import 'package:petstore/Screens/addPet.dart';
import 'package:petstore/Screens/findPets.dart';
import 'package:petstore/Screens/homePage.dart';
import 'package:petstore/Screens/splashScreen.dart';
import 'package:petstore/Screens/petDetails.dart';
import 'package:petstore/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes(),
      initialRoute: Routes.splashScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
