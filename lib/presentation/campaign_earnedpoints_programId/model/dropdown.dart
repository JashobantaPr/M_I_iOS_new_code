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

  const CustomDropdown({
    super.key,
    this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
    required this.getLabel,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: decoration,
      value: value,
      hint: hintText != null
          ? Text(
              hintText!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: appTheme.black900),
            )
          : null,
      validator: validator,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: SizedBox(
            width: 110,
            child: Text(
              getLabel(item),
              maxLines: 1,
              style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: appTheme.black900),
            ),
          ),
        );
      }).toList(),
      onChanged: (T? value) => onChanged(value),
      icon: Icon(Icons.keyboard_arrow_down_rounded,
          size: 30, color: appTheme.greydownarrow),
    );
  }

  InputDecoration get decoration => InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(10.h, 10.h, 12.h, 15.h),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: appTheme.grey500,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: appTheme.grey500,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: appTheme.grey500,
            width: 1,
          ),
        ),
      );
}
