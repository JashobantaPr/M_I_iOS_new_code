import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'controller/trending_article_controller.dart';

class TreandingArticleScreen
    extends GetWidget<TreandingArticleScreenController> {
  const TreandingArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.grey10,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: appTheme.greytextcolour,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Overview of last 3 Months',
                    textAlign: TextAlign.start, // Align text to start
                    style:
                        TextStyle(color: appTheme.greytextcolour, fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      10.h), // Add some space between the text and the ListView
              Expanded(
                child: ListView.builder(
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0), // Add some spacing between list items
                      child: Container(
                        padding: const EdgeInsets.all(
                            10.0), // Add padding inside the container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: appTheme.grey,
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Align text to start
                          children: [
                            Text(
                              'Diwali quiz competition on Buzzz',
                              style: TextStyle(
                                  color: appTheme.cyan800, fontSize: 14),
                            ),
                            SizedBox(height: 5.h),
                            const Text(
                              'by Kimaya Kambli',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '04 February 2020 11:42 am',
                              style: TextStyle(
                                  color: appTheme.greytext, fontSize: 10),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Text(
                                  '150 Likes',
                                  style: TextStyle(
                                      color: appTheme.cyan800, fontSize: 10),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                      color: appTheme.greytext,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '20 Comments',
                                  style: TextStyle(
                                      color: appTheme.cyan800, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
