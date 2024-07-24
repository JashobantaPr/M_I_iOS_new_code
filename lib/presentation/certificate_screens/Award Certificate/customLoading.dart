import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomloadingScreen extends StatelessWidget {
  CustomloadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 78, 73, 73),
      body: Center(
        child: Container(
            width: 330.sp,
            height: 220,
          
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitFadingCircle(
                  color: Colors.white,
                  size: 70.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please wait your post is being created.....',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
