import 'package:flutter/material.dart';
import 'package:quiz_prj/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quizyy",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w900),
          ),
          backgroundColor: const Color.fromARGB(255, 109, 2, 190),
          foregroundColor: Colors.white,
          centerTitle: true,
          
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 83, 17, 163),
                const Color.fromARGB(255, 151, 39, 212),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: StartScreen(),
        ),
      ),
    ),
  );
}
