import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/buzz_screens/commentsdata/controller/commentsdatacontroller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CommentsDataScreen extends GetWidget<CommentsdataController> {
  const CommentsDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.background,
      appBar: AppBar(
        backgroundColor: appTheme.redappbar,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 27.w,
              height: 18.h,
            ),
          ),
        ),
        title: Text(
          'Comments',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: appTheme.white,
          ),
        ),
      ),
      body: Obx(() {
        final commentsResponse = controller.commentsResponse.value;
        if (commentsResponse == null) {
          return const Center(
              child: Center(
            child: SpinKitFadingCircle(
              color: Colors.black,
              size: 50.0,
            ),
          ));
        }

        final comments = commentsResponse.comments?.comments ?? [];
        final users = commentsResponse.users ?? {};

        return ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            final user = users[comment.cmsUserIdFk];

            return ListTile(
              onLongPress: () {
                if (comment.cmsUserIdFk == user.userIdPk) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Comment"),
                        content: const Text(
                            "Are you sure you want to delete this comment?"),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: appTheme.black600,
                                  fontSize: 14.sp),
                            ),
                            onPressed: () {
                              Get.back(); // Close the dialog
                            },
                          ),
                          TextButton(
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: appTheme.black600,
                                  fontSize: 14.sp),
                            ),
                            onPressed: () {
                              print('dsfhd${comment.commentIdPk}');
                              controller.deletecomment(
                                  comment.commentIdPk.toString());
                              Get.back();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('${Url.profileimageUrl}${user!.profile}')),
              title: Text(
                '${user.firstName ?? ''} ${user.lastName ?? ''}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.comment ?? ''),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.likepost(
                              comment.postIdFk.toString(),
                              user.firstName.toString(),
                              user.lastName.toString(),
                              comment.commentIdPk.toString());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Icon(
                                controller.likedPosts
                                        .contains(comment.postIdFk.toString())
                                    ? Icons.thumb_up_alt
                                    : Icons.thumb_up_alt_outlined,
                              ),
                            ),
                            SizedBox(width: 5.w),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.likerdata,
                              arguments: comment.cmsUserIdFk);
                        },
                        child: Text(
                          '${comment.likes} likes',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    controller.getTimeDifference(comment.recordDate.toString()),
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  
                ],
              ),
              
            );
          },
        );
      }),
    );
  }
}
