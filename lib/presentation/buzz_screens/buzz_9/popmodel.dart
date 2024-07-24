import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:popover/popover.dart';

class PopoveraudioButton extends StatelessWidget {
  final String text;

  const PopoveraudioButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          arrowDyOffset: 10,
          backgroundColor: appTheme.black900,
          context: context,
          bodyBuilder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right:0, top: 12, bottom: 12, left:5.5),
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          direction: PopoverDirection.bottom,
          width: 200.w,
          height: 40,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0xFF6D6D6D),
          border: Border.all(color: const Color.fromARGB(255, 54, 27, 27)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.mic, color: Colors.white),
      ),
    );
  }
}
