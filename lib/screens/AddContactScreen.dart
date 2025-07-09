// Imports
// ignore_for_file: unnecessary_null_comparison, unused_element, file_names

import 'dart:io';
import 'package:contactapp/db/contactSchema.dart';
import 'package:contactapp/db/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:image_picker/image_picker.dart';

//Stateful Widget
class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});
  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  //State Variables
  String phone = "";
  String email = "";
  String address = "";
  String name = "";
  String imagePath = "";
  //File Functionality
  File? _image;
  final _picker = ImagePicker();
  pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imagePath = pickedFile.path;
      });
    }
  }

  //Building The Screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            height: 740,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Container(
                  width: 320,
                  height: 125,
                  margin: EdgeInsets.all(6),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      bottom: BorderSide(color: Colors.greenAccent, width: 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 55,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.greenAccent,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.green,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Create A New Contact",
                        style: GoogleFonts.inter(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // Render The Fields
                _image != null
                    ? Container(
                      width: 150,
                      height: 145,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        width: 300,
                        height: 55,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.blueGrey.withOpacity(0.2),
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 22,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(width: 25),
                            Text(
                              "Pick an Image",
                              style: GoogleFonts.inter(
                                fontSize: 16.16,
                                fontWeight: FontWeight.w600,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.15,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add a name",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.15,
                        fontWeight: FontWeight.w600,
                        color: Colors.greenAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent, // Your desired color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.blueGrey.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    style: GoogleFonts.inter(
                      color:
                          Colors.white, // 👈 change this to any color you want
                      fontSize: 15.15,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        phone = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add a phone number",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.15,
                        fontWeight: FontWeight.w600,
                        color: Colors.greenAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent, // Your desired color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.blueGrey.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    style: GoogleFonts.inter(
                      color:
                          Colors.white, // 👈 change this to any color you want
                      fontSize: 15.15,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add a email address",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.15,
                        fontWeight: FontWeight.w600,
                        color: Colors.greenAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent, // Your desired color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.blueGrey.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    style: GoogleFonts.inter(
                      color:
                          Colors.white, // 👈 change this to any color you want
                      fontSize: 15.15,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      setState(() {
                        address = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add a home address",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.15,
                        fontWeight: FontWeight.w600,
                        color: Colors.greenAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.location_city,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent, // Your desired color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.blueGrey.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: () async {
                    var contact = Contact(
                      imagePath: imagePath,
                      name: name,
                      phone: phone,
                      email: email,
                      address: address,
                    );
                    await DatabaseHelper().insertContact(contact);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 260,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightGreenAccent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.blueGrey.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.lightGreenAccent,
                          size: 22,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Add New Contact",
                          style: GoogleFonts.inter(
                            color: Colors.lightGreenAccent,
                            fontSize: 15.15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
