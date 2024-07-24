import 'package:flutter/widgets.dart';
import 'package:incentivesgit/theme/custom_text_style.dart';

class VowcharText extends StatelessWidget {
  final String? text;
  final String? subText;
  const VowcharText({super.key, this.text, this.subText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            text ?? "",
            style: CustomTextStyles.Headerblack_02,
          ),
          Text(
            ": ${subText}",
            style: CustomTextStyles.Headerblack_01,
          )
        ],
      ),
    );
  }
}
