import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomDropdowncompulsory<T> extends StatelessWidget {
  final String labelText;
  final List<T> items;
  final T value;
  final String hintText;
  final void Function(T?) onChanged;
  final String Function(T) getLabel;
  final FormFieldValidator? validator;

  const CustomDropdowncompulsory({
    super.key,
    required this.labelText,
    required this.items,
    required this.value,
    required this.hintText,
    required this.onChanged,
    this.validator,
    required this.getLabel,
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
        DropdownButtonFormField<T>(
          decoration: decoration,
          value: value,
          hint: Text(
            hintText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF7D7A7A),
            ),
          ),
          validator: validator,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  getLabel(item),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: appTheme.black900,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (T? value) => onChanged(value),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 30,
            color: appTheme.greydownarrow,
          ),
        ),
      ],
    );
  }

  InputDecoration get decoration => InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 10, 12, 15),
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
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: appTheme.grey500,
            width: 1,
          ),
        ),
      );
}
