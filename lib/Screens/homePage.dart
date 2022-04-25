import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petstore/Screens/findPets.dart';

import 'findPets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to PetStore App',
                  style: GoogleFonts.bebasNeue(fontSize: 30)),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return FindPets();
                    }));
                  },
                  child: Text(
                    'Get Pets By Status',
                    style: GoogleFonts.montserrat(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return FindPets();
                    }));
                  },
                  child: Text(
                    'Add New Pet',
                    style: GoogleFonts.montserrat(fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
