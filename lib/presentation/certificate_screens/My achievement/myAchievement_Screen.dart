import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/My%20achievement/controller/certificateSummary_Controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/My%20achievement/model/certificate_model.dart';
import 'package:incentivesgit/presentation/certificate_screens/My%20achievement/service/buzzSummary_service.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyAchievementScreen extends GetWidget<MyAchievementController> {
  const MyAchievementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 15.0,
                  color: appTheme.greytextcolour,
                ),
                const SizedBox(width: 7.0),
                Text(
                  'Overview of the year',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            _buildBuzzes(),
          ],
        ),
      ),
    );
  }

  Widget _buildBuzzes() {
    return FutureBuilder<LeaderData>(
      future: BuzzSummaryService().fetchLeaderBoardData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final count = snapshot.data?.count ?? 'N/A';
          return Container(
            height: 100,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: appTheme.rediconbackground,
                        child: Text(
                          count,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Text(
                        'Earned Certificate',
                        style: TextStyle(
                          color: appTheme.cyan800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
