import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './landing_page.dart';

class Res extends StatefulWidget {
  final double? bmi;
  Color? color;
  Res({super.key, @required this.bmi, @required this.color});

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          ' ${widget.bmi}',
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
