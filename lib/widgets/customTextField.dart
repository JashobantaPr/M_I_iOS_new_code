import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String hintText;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final double? height;
  final RxString? errorMessage;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.controller,
    required this.hintText,
    this.backgroundColor,
    this.validator,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.height,
    this.errorMessage,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: appTheme.redappbar,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ],
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
            height: height ?? 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    cursorColor: appTheme.black600,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 0.0),
                    ),
                    validator: validator,
                    readOnly: readOnly,
                  ),
                ),
                if (suffixIcon != null)
                  IconButton(
                    icon: suffixIcon!,
                    onPressed: onSuffixIconPressed,
                  ),
              ],
            ),
          ),
        ),
        errorMessage != null && errorMessage!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  errorMessage!.value,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
