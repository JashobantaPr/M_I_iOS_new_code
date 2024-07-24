import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomTextField1 extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final Color? backgroundColor;

  const CustomTextField1({
    super.key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.maxLines = 1,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: appTheme.greytextcolour,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(height: 7),
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ?? appTheme.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: appTheme.grey500,
              width: 1.0,
            ),
          ),
          child: Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: controller,
              cursorColor: appTheme.black600,
              keyboardType: keyboardType,
              maxLines: maxLines,
              style: TextStyle(
                color: appTheme.black900,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 0.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
