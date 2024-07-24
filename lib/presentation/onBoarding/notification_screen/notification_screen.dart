import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'controller/notification_controller.dart';

class NotificationScreen extends GetWidget<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        child: Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 26.06,
              height: 13.53,
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset(
                ImageConstant.arrowback,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        backgroundColor: appTheme.redappbar,
        title: Text(
          'Notification',
          style: GoogleFonts.roboto(
            fontSize: 20.sp,
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                controller.markAllAsRead();
              },
              child: Text(
                controller.notifications.isNotEmpty ? 'Mark All As Read' : '',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w200,
                ),
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: appTheme.white),
        child: Obx(() {
          if (controller.notifications.isEmpty) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              ),
            );
          } else {
            return RefreshIndicator(
              strokeWidth: 2,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              color: appTheme.black600,
              onRefresh: () {
                return controller.fetchNotifications();
              },
              child: ListView.separated(
                itemCount: controller.notifications.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox();
                },
                itemBuilder: (context, index) {
                  var notification = controller.notifications[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (index != 0)
                        Divider(
                          thickness: 1.h,
                          indent: 17,
                          endIndent: 20,
                        ),
                      Container(
                        color: controller.notifications[index].userSeen == '1'
                            ? appTheme.grey
                            : appTheme.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 23.r,
                            backgroundColor: appTheme.redappbar,
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundColor:
                                  const Color.fromRGBO(110, 109, 114, 1),
                              foregroundColor: appTheme.white,
                              child: const Icon(Icons.notifications),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              notification.message.contains('<')
                                  ? Html(
                                      data: notification.message,
                                      style: {
                                        "body": Style(
                                          fontSize: FontSize(13.sp),
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        "strong": Style(
                                          color: appTheme.black600,
                                        ),
                                      },
                                    )
                                  : Text(
                                      notification.message,
                                      style: GoogleFonts.roboto(
                                        fontSize: 13.sp,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                              Text(
                                notification.createdAt,
                                style: GoogleFonts.roboto(
                                  fontSize: 10.sp,
                                  color: const Color.fromRGBO(109, 109, 109, 1),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            controller.toggleReadStatus(index);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        }),
      ),
    ));
  }
}
