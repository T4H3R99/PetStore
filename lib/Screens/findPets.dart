import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:petstore/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FindPets extends StatefulWidget {
  const FindPets({Key? key}) : super(key: key);

  @override
  State<FindPets> createState() => _FindPetsState();
}

class _FindPetsState extends State<FindPets> {
  TextEditingController status = TextEditingController();
  var items = ['AVAILABLE', 'PENDING', 'SOLD']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Center(
        child: Text(
          value,
        ),
      ),
    );
  }).toList();
  String value = 'AVAILABLE';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getByStaus(value);
  }

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addnewPet);
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed((context), Routes.editPet);
              },
              child: Icon(Icons.change_circle),
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 145, 186),
          elevation: 0.6,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 3),
                      ),
                    ),
                    items: items,
                    value: value,
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue!;
                        id.clear();
                        name.clear();
                        categoryName.clear();
                        status.clear();
                        getByStaus(value);
                      });

                      print(value);
                    }),
              ),
            ),
            loading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: id.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: GestureDetector(
                              onTap: () {
                                sendData(index);
                                Navigator.pushNamed(context, Routes.editPet);
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                name[index].toString(),
                                                style:
                                                    GoogleFonts.akayaTelivigala(
                                                        textStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .white),
                                                        fontSize: 30),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'This is his Name',
                                                style: GoogleFonts.ptSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Category : ${categoryName[index].toString()}',
                                                style: GoogleFonts.ptSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Status : ${stat[index].toString()}',
                                                style: GoogleFonts.ptSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child:
                                                Image.asset('assets/dpg.png')),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Color.fromARGB(255, 28, 158, 190),
                                    shape: BoxShape.rectangle,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurStyle: BlurStyle.solid)
                                    ]),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }

  var id = [];
  var categoryName = [];
  var name = [];
  var photoUrl = [];
  var tagsname = [];
  var stat = [];
  void getByStaus(var value) async {
    value = value.toString().toLowerCase();

    var url = 'https://petstore.swagger.io/v2/pet/findByStatus?status=$value';
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });
      var body = jsonDecode(response.body);
      setState(() {
        stat.clear();
      });

      for (var i in body) {
        if (i.length != 6) {
          {
            i.addAll({
              "id": 9223372016900003000,
              "category": {"id": 0, "name": "string"},
              "name": "doggie",
              "photoUrls": ["string"],
              "tags": [
                {"id": 0, "name": "string"}
              ],
              "status": "available"
            });
          }
        }

        setState(() {
          id.add(i['id']);

          categoryName.add(i['category']['name']);

          name.add(i['name']);

          stat.add(i['status']);
        });
        print(i['status']);
      }
    } else {
      setState(() {
        loading = true;
      });
    }
  }

  void sendData(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id[index]);
    await prefs.setString('name', name[index].toString());
    await prefs.setString('category', categoryName[index].toString());
    await prefs.setString('status', stat[index].toString());
  }
}
