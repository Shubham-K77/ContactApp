import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndividualCardTile extends StatelessWidget {
  final String label;
  final String value;
  final Icon iconMotif;
  IndividualCardTile({
    super.key,
    required this.label,
    required this.value,
    required this.iconMotif,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 75,
      margin: EdgeInsets.all(8),
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
              color: Colors.transparent,
            ),
            child: Center(child: iconMotif),
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
                  label,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                    fontSize: 16,
                  ),
                ),
                Text(
                  value,
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
    );
  }
}
