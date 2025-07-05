// Imports
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

//Creating the Stateful Widget
class EditContactScreen extends StatefulWidget {
  //Data That Will Be Received
  final File? image;
  final String phone;
  final String email;
  final String address;
  //Contructor With The Passed Values
  EditContactScreen({
    super.key,
    this.image,
    required this.phone,
    required this.email,
    required this.address,
  });
  //Creating the state
  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

//Creating the Widget
class _EditContactScreenState extends State<EditContactScreen> {
  //State Varaiables
  File? image;
  String? phone;
  String? email;
  String? address;

  //Controllers To Display The Value In The Form
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  void initState() {
    super.initState();
    //Init code
    image = widget.image;
    phone = widget.phone;
    email = widget.email;
    address = widget.address;
    phoneController = TextEditingController(text: phone);
    emailController = TextEditingController(text: email);
    addressController = TextEditingController(text: address);
  }

  //For picking the image
  final _picker = ImagePicker();
  pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            height: 680,
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
                      bottom: BorderSide(color: Colors.blueAccent, width: 1.0),
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
                              color: Colors.blueAccent,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.blue,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Edit The Contact",
                        style: GoogleFonts.inter(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // Render The Fields
                image != null
                    ? Container(
                      width: 150,
                      height: 145,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        image: DecorationImage(
                          image: FileImage(image!),
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
                            color: Colors.blueAccent,
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
                              color: Colors.blueAccent,
                            ),
                            SizedBox(width: 25),
                            Text(
                              "Pick an Image",
                              style: GoogleFonts.inter(
                                fontSize: 16.16,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
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
                    controller: phoneController,
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
                      hintText: phone,
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        size: 22,
                        color: Colors.blueAccent,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.blueAccent, // Your desired color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
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
                    controller: emailController,
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
                      hintText: email,
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 22,
                        color: Colors.blueAccent,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.blueAccent, // Your desired color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
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
                    controller: addressController,
                    onChanged: (value) {
                      setState(() {
                        address = value;
                      });
                    },
                    style: GoogleFonts.inter(
                      color:
                          Colors.white, // 👈 change this to any color you want
                      fontSize: 15.15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: address,
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15.15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.location_city,
                        size: 22,
                        color: Colors.blueAccent,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.blueAccent, // Your desired color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
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
                  onTap: () {},
                  child: Container(
                    width: 260,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlueAccent,
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
                          Icons.edit,
                          color: Colors.lightBlueAccent,
                          size: 22,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Edit The Contact",
                          style: GoogleFonts.inter(
                            color: Colors.lightBlueAccent,
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
