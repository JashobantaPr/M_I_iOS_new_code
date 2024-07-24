import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_10/controller/buzz_10_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class Buzz10Screen extends StatelessWidget {
  Buzz10Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Buzzz",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0XFFE41C39),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Color(0xFFEBEBEB),
          child: Column(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return _buildBuzz10(constraints.maxWidth +
                        500); // Increasing the maxWidth by 500
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 16), // Add space to the left
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 103,
                      height: 48,
                      decoration: BoxDecoration(
                        color: appTheme.rediconbackground,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: appTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle cancel action
                    },
                    child: Container(
                      width: 103,
                      height: 48,
                      decoration: BoxDecoration(
                        color: appTheme.rediconbackground,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'Buzzz',
                          style: TextStyle(
                            color: appTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Add space to the right
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBuzz10(double maxWidth) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 390,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Select Post Type ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: appTheme.cyan800,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Obx(() => Radio(
                      value: true,
                      groupValue:
                          Get.find<Buzz10Controller>().selectedOption1.value,
                      onChanged: (value) {
                        Get.find<Buzz10Controller>()
                            .selectOption1(value as bool);
                      },
                      activeColor:
                          Colors.lightBlue, // Set active color to light blue
                    )),
                Text(
                  'Create post in existing scope -Mumbai',
                  style: TextStyle(color: appTheme.black900),
                ),
              ],
            ),
            Row(
              children: [
                Obx(() => Radio(
                      value: true,
                      groupValue:
                          Get.find<Buzz10Controller>().selectedOption2.value,
                      onChanged: (value) {
                        Get.find<Buzz10Controller>()
                            .selectOption2(value as bool);
                      },
                      activeColor:
                          Colors.lightBlue, // Set active color to light blue
                    )),
                Text(
                  'Create global post for all scopes​',
                  style: TextStyle(color: appTheme.black900),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: appTheme.black900),
                      ),
                    )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Select User',
                          style: TextStyle(color: appTheme.black900),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(color: appTheme.black900),
                      ),
                    )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Add Description',
                          style: TextStyle(color: appTheme.black900),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(color: appTheme.black900),
                      ),
                    )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Select Behaviour',
                          style: TextStyle(color: appTheme.black900),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
