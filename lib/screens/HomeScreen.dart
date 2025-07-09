//Imports
import "package:contactapp/db/contactSchema.dart";
import "package:contactapp/db/dbHelper.dart";
import "package:contactapp/screens/AddContactScreen.dart";
import "package:contactapp/widgets/ContactTile.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //State Variable
  late Future<List<Contact>> _contactsList;

  //Initial Mounting
  void initState() {
    super.initState();
    void loadContacts() {
      _contactsList = DatabaseHelper().getContacts();
    }

    loadContacts();
  }

  //Home Screen
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            height: 650,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 35),
                Container(
                  width: 320,
                  height: 125,
                  margin: EdgeInsets.all(6),
                  padding: EdgeInsets.all(2),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contacts",
                        style: GoogleFonts.inter(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search contacts...',
                                  hintStyle: GoogleFonts.inter(
                                    color:
                                        Colors
                                            .greenAccent, // Change this to your desired color
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                      color:
                                          Colors
                                              .greenAccent, // Your desired color
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
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 55,
                                height: 45,
                                child: Center(
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.amberAccent,
                                    size: 26,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.amberAccent,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<Contact>>(
                  future: _contactsList,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No contacts found',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      final contacts = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final contact = contacts[index];
                          return ContactTile(
                            name: contact.name, // Adjust based on your schema
                            phone: contact.phone,
                            imagePath: contact.imagePath!,
                            email: contact.email,
                            address: contact.address,
                            id: contact.id,
                          );
                        },
                      );
                    }
                  },
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddContactScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 55,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.green, width: 1.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.greenAccent),
                          SizedBox(width: 10),
                          Text(
                            "Add Contact",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
