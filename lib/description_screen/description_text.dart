import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Objects
import '../objects/shoe.dart';

class DescriptionText extends StatelessWidget {
  final Shoe shoe;

  DescriptionText({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        shoe.description,
        style: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    );
  }
}
