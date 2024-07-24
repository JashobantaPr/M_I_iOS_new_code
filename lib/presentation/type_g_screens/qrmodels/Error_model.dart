import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorModel extends StatelessWidget {
  final VoidCallback onConfirm;

  ErrorModel({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 330.sp,
          height: 349,
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
                child: Container(
                  height: 185,
                  color: Color(0XFFFF0000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Error!',
                        style: TextStyle(
                            color: const Color(0XFFFFFFFF), fontSize: 40.sp),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color:const Color(0XFFFFFFFF), width: 3),
                            borderRadius: BorderRadius.circular(50)),
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(top: 10),
                        child: const Icon(
                          Icons.close,
                          size: 35.72,
                          color: Color(0XFFFFFFFF),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Invalid code.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Color(0XFF78787B),
                      ),
                    ),
                    const Divider(
                      color: Color(0XFF78787B),
                      thickness: 1,
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: onConfirm,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                            minimumSize: const Size(120, 60),
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            'Try Again',
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
