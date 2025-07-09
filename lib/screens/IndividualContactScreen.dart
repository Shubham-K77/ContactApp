// Imports:
import 'dart:io';

import 'package:contactapp/db/dbHelper.dart';
import 'package:contactapp/screens/EditContact.dart';
import 'package:contactapp/widgets/IndividualCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Stateful Widget:
class IndividualContactScreen extends StatefulWidget {
  final int? id;
  final String name;
  final String phone;
  final String imagePath;
  final String email;
  final String address;
  const IndividualContactScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.imagePath,
    required this.email,
    required this.address,
    required this.id,
  });
  @override
  State<IndividualContactScreen> createState() =>
      _IndividualContactScreenState();
}

class _IndividualContactScreenState extends State<IndividualContactScreen> {
  //State Varaiables

  //Build Method
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(widget.imagePath)),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black87.withOpacity(0.6),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 75,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white38.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.amber,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => EditContactScreen(
                                        imagePath: widget.imagePath,
                                        name: widget.name,
                                        phone: widget.phone,
                                        email: widget.email,
                                        address: widget.address,
                                        id: widget.id,
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              width: 65,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white38.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: GoogleFonts.inter(
                                    fontSize: 15.15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.name,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 480,
                color: Colors.black,
                padding: EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    IndividualCardTile(
                      label: "Phone",
                      value: widget.phone,
                      iconMotif: Icon(
                        Icons.phone,
                        color: Colors.greenAccent,
                        size: 26,
                      ),
                    ),
                    IndividualCardTile(
                      label: "Email",
                      value: widget.email,
                      iconMotif: Icon(
                        Icons.email,
                        color: Colors.greenAccent,
                        size: 26,
                      ),
                    ),
                    IndividualCardTile(
                      label: "Address",
                      value: widget.address,
                      iconMotif: Icon(
                        Icons.location_city,
                        color: Colors.greenAccent,
                        size: 26,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => EditContactScreen(
                                  imagePath: widget.imagePath,
                                  name: widget.name,
                                  phone: widget.phone,
                                  email: widget.email,
                                  address: widget.address,
                                  id: widget.id,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        width: 310,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.blueAccent,
                              size: 26,
                            ),
                            SizedBox(width: 35),
                            Text(
                              "Edit Contact",
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
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () async {
                        await DatabaseHelper().deleteContact(widget.id!);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 310,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Colors.redAccent,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                              size: 26,
                            ),
                            SizedBox(width: 25),
                            Text(
                              "Delete Contact",
                              style: GoogleFonts.inter(
                                fontSize: 16.16,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
