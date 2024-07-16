import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget _buildCard({required IconData icon, required String text}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.fromLTRB(0, 14, 0, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0x0D176FF2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            width: 30,
            height: 28,
            child: Icon(icon, size: 28, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(right: 1.3),
            child: Text(
              text,
              style: GoogleFonts.getFont(
                "Roboto Condensed",
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
