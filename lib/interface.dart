import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz2/filemanagement.dart';

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  String? name = "", email = "", phone = "", address = "", data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar:
      appBar: AppBar(
        title: Text("Registration Form",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            )),
        backgroundColor: Color.fromARGB(255, 255, 193, 7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        centerTitle: true,
        leading: ClipOval(
          child: Icon(
            Icons.app_registration,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),

      //Body:
      body: Container(
        child: Column(
          children: [
            //TextFields:
            fields(TextInputType.name, "Name", Icons.person, name),
            fields(TextInputType.emailAddress, "Email", Icons.email, email),
            fields(TextInputType.phone, "Phone", Icons.phone, phone),
            fields(TextInputType.streetAddress, "Address", Icons.location_city,
                address),
            //Buttons:
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Save button
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(150, 37)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {
                        FilesManagement.SaveToFile("Name: " +
                            name! +
                            "\n" +
                            "Email: " +
                            email! +
                            "\n" +
                            "Phone: " +
                            phone! +
                            "\n" +
                            "Address: " +
                            address! +
                            "\n");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SAVE",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.data_saver_on_rounded,
                            color: Colors.black,
                            size: 23,
                          )
                        ],
                      )),
                       SizedBox(
                            width: 10,
                          ),
                  //View Button:        
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(150, 37)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {
                        setState(() {
                          FilesManagement.ReadFile()
                              .then((value) => {data = value});
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "View",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.list_alt_outlined,
                            color: Colors.black,
                            size: 23,
                          )
                        ],
                      ))
                ],
              ),
            ),
            //View_Area:
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 420,
                          height: 250,
                          padding: EdgeInsets.only(top: 8),
                          child: Text("$data"),
                        ),
                        Container(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                data = "";
                              });
                            },
                            icon: Icon(Icons.delete,
                                color: Color.fromARGB(255, 221, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  

  Padding fields(keybord, txt, icon, val) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
      child: TextField(
        onChanged: (value) => val = value,
        keyboardType: keybord,
        decoration: InputDecoration(
            label: Text(txt),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gapPadding: 5,
            )),
      ),
    );
  }
}
