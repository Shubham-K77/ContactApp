// Imports:
import 'package:contactapp/screens/EditContact.dart';
import 'package:contactapp/widgets/IndividualCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Stateful Widget:
class IndividualContactScreen extends StatefulWidget {
  const IndividualContactScreen({super.key});
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
                color: Colors.amber,
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
                                  color: Colors.green,
                                  size: 22,
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
                                        phone: "+1(555)123-4567",
                                        email: "john.doe@gmail.com",
                                        address:
                                            "123 Main St, New York, Ny 1001",
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
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "John Doe",
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
                      value: "+1 (555) 123-4567",
                      iconMotif: Icon(
                        Icons.phone,
                        color: Colors.greenAccent,
                        size: 26,
                      ),
                    ),
                    IndividualCardTile(
                      label: "Email",
                      value: "john.doe@gmail.com",
                      iconMotif: Icon(
                        Icons.email,
                        color: Colors.greenAccent,
                        size: 26,
                      ),
                    ),
                    IndividualCardTile(
                      label: "Address",
                      value: "123 Main St, New York, Ny 1001",
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
                                  phone: "+1(555)123-4567",
                                  email: "john.doe@gmail.com",
                                  address: "123 Main St, New York, Ny 1001",
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
                      onTap: () {},
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
