import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({Key? key}) : super(key: key);

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editPet();
  }

  var name = '';
  var category = '';
  var status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.4),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/dpg.png'), fit: BoxFit.contain)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Colors.black54),
                    ),
                    Text(
                      category.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black54),
                    ),
                    Text(
                      status.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
        ],
      ),
    );
  }

  void editPet() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name')!;

      category = prefs.getString('category')!;
      status = prefs.getString('status')!;
    });
  }
}
