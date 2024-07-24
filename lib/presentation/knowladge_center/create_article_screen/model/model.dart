import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';

class CustommodelScreen extends StatelessWidget {
  final VoidCallback onConfirm;

  CustommodelScreen({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 330.sp,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: Colors.red,
                  toolbarHeight: 40,
                  automaticallyImplyLeading: false,
                  title: const Text(
                    'Confirmation',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, right: 12.5, bottom: 12),
                      child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            ImageConstant.cancel,
                            width: 14.93,
                            height: 14.93,
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 70,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Switching to the other option will lose all its current created data. Are you sure you want to switch?',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Color.fromARGB(255, 5, 4, 4),
                        
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Get.back(); // Close the dialog
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey),
                            minimumSize: Size(120, 60),
                          ),
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: onConfirm,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.red),
                            minimumSize: Size(120, 60),
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
