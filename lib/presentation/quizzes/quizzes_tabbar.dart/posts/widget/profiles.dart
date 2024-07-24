import 'package:flutter/material.dart';
import 'package:incentivesgit/theme/custom_text_style.dart';

class ProfileChip extends StatelessWidget {
  const ProfileChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 20, left: 5, right: 5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                CircleAvatar(
                  radius: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Anushka \n Sharma",
                    style: CustomTextStyles.Headerblack_01,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
