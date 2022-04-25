import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petstore/routes.dart';

class EditPet extends StatefulWidget {
  const EditPet({Key? key}) : super(key: key);

  @override
  State<EditPet> createState() => _EditPetState();
}

class _EditPetState extends State<EditPet> {
  TextEditingController name = TextEditingController();
  TextEditingController categroy = TextEditingController();
  TextEditingController tagname = TextEditingController();
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
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Edit PET"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    suffixIcon:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter The Pet Name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusColor: Colors.grey[800],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: categroy,
                  decoration: InputDecoration(
                    suffixIcon:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter The Pet category',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusColor: Colors.grey[800],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: tagname,
                  decoration: InputDecoration(
                    suffixIcon:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter The Pet Tag Name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusColor: Colors.grey[800],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
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
                      });

                      print(value);
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    editPet();
                  },
                  child: Text('Edit Pet'))
            ],
          ),
        ),
      ),
    ));
  }

  void editPet() async {
    var url = Uri.parse('https://petstore.swagger.io/v2/pet');
    var data = {
      "id": 0,
      "category": {"id": 0, "name": categroy.text.toString()},
      "name": name.text.toString(),
      "photoUrls": ["string"],
      "tags": [
        {"id": 0, "name": tagname.text.toString()}
      ],
      "status": value.toString()
    };
    var response = await http.put(url, body: jsonEncode(data));
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, Routes.findbystatus);
    } else if (response.statusCode == 404) {
      print('error 404');
    } else if (response.statusCode == 400) {
      print('error 400');
    } else {
      print("error 405");
    }
  }
}
