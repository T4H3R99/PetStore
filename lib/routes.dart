import 'package:flutter/cupertino.dart';
import 'package:petstore/Screens/addPet.dart';
import 'package:petstore/Screens/editPet.dart';
import 'package:petstore/Screens/findPets.dart';
import 'package:petstore/Screens/splashScreen.dart';
import 'package:petstore/Screens/petDetails.dart';

class Routes {
  static const splashScreen = 'splash';
  static const findbystatus = 'findbystatus';
  static const addnewPet = 'addNewPet';
  static const editPet = 'editPet';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      splashScreen: (context) => SplashScreen(),
      findbystatus: (context) => const FindPets(),
      addnewPet: (context) => const AddPet(),
      editPet: (context) => const EditPet()
    };
  }
}
