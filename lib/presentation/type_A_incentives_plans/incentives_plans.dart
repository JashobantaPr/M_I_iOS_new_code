import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/type_A_incentives_plans/controllers/incentives_plans.dart';

class Incentiveplans extends GetWidget<IncentivesPlansControlller> {
  const Incentiveplans({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Background color for SafeArea
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Incentives Plan",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0XFFE41C39),
          iconTheme: IconThemeData(color: Colors.white), // Set icon color here
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 27.w,
              height: 18.h,
            ),
          ),
        ),
        // body: SingleChildScrollView(
        //   physics: AlwaysScrollableScrollPhysics(),
        //   child: Column(
        //     children: [
        //       SizedBox(height: 16),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 16.h),
        //         child: _buildFamily(),
        //       ),
        //       SizedBox(height: 3),
        //     ],
        //   ),
        // ),
        body: Obx(() => Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                controller.achievements.value.incentivePlan ?? '',
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 8, 8),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildFamily() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Daily GMV',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '5,00,00,000+',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Size',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              'XL',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'One time revenue',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '1,50,000',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Recurring revenue slab',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '10%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Daily GMV',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '5,00,00,000+',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Size',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              'XL',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'One time revenue',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '1,50,000',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Recurring revenue slab',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '10%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Daily GMV',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '5,00,00,000+',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Size',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              'XL',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'One time revenue',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '1,50,000',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Recurring revenue slab',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '10%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Daily GMV',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '5,00,00,000+',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Size',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              'XL',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'One time revenue',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '1,50,000',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Recurring revenue slab',
              style: TextStyle(
                color: Color.fromARGB(255, 127, 125, 125),
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          const SizedBox(
            width: 100,
            child: Text(
              '10%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    ]);
  }
}
