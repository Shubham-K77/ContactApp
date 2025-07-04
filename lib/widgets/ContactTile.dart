import 'package:contactapp/screens/IndividualContactScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  ContactTile({super.key, required this.name, required this.number});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IndividualContactScreen()),
        );
      },
      child: Container(
        width: 310,
        height: 75,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFF22C55E), // green-500
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white54,
              ),
            ),
            Container(
              width: 215,
              height: 60,
              color: Colors.transparent,
              padding: EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    number,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
