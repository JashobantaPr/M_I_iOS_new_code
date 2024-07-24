import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? label;
  final List<T> items;
  final T value;
  final String? hintText;
  final void Function(T?) onChanged;
  final String Function(T) getLabel;
  final FormFieldValidator? validator;
  final Color? backgroundColor;
  final double borderRadius;
  final bool hasError; // Added parameter to indicate error state

  const CustomDropdown({
    super.key,
    this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
    required this.getLabel,
    this.hintText,
    this.backgroundColor,
    this.borderRadius = 6.0,
    this.hasError = false, 
  });

  @override
  Widget build(BuildContext context) {
    Color containerColor = backgroundColor ?? Colors.transparent;
    Color borderColor = hasError
        ? appTheme.gray500
        : appTheme.gray500; 

    return Container(
      height: 50,
      width: 340,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(10.h, 5.h, 12.h, 10.h),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        value: value,
        hint: hintText != null
            ? Text(
                hintText!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: appTheme.greytextcolour,
                ),
              )
            : null,
        validator: validator,
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              getLabel(item),
              maxLines: 1,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: appTheme.greydownarrow,
              ),
            ),
          );
        }).toList(),
        onChanged: (T? value) => onChanged(value),
        icon: Icon(Icons.keyboard_arrow_down_rounded,
            size: 30, color: appTheme.greydownarrow),
      ),
    );
  }
}
