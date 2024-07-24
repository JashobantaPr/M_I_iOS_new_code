import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/News/post/controller/post_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class PostScreen extends GetWidget<PostController> {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.grey,
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 556.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: appTheme.grey,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.viewprofile);
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                '',
                                width: 40.w,
                                height: 40.h,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  }
                                },
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Icon(Icons.person, size: 40);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        // '${author?.firstName ?? ""} ${author?.lastName ?? ""}',
                                        'Chetana Shelar ',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' published an Article .',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "04 February 2020 11:42 am",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.greytextcolour,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                SvgPicture.asset(
                                  ImageConstant.public,
                                  width: 13.42.w,
                                  height: 13.42.h,
                                )
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.more_vert)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Divider(
                      color: appTheme.gray90001,
                      thickness: 1, // Adjust the thickness as needed
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _profileimagename(),
                    SizedBox(height: 35.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   "120",
                        //   style: TextStyle(
                        //     fontSize: 12.sp,
                        //     fontFamily: GoogleFonts.poppins().fontFamily,
                        //     color: appTheme.cyan800,
                        //     fontWeight: FontWeight.normal,
                        //   ),
                        // ),
                        // SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "120",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Likes',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "20",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Comments',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 11.5.h),
                    Divider(color: appTheme.gray900),
                    SizedBox(height: 5.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // controller.likepost(
                            //   post.postIdPk.toString(),
                            //   author!.firstName.toString(),
                            //   author.lastName.toString(),
                            // );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // controller.likepost(
                                  //     post.postIdPk.toString(),
                                  //     author!.firstName.toString(),
                                  //     author.lastName.toString());
                                },
                                child: const Icon(
                                  // controller.likedPosts[
                                  //             post.postIdPk.toString()] ==
                                  //         true
                                  //     ? Icons.thumb_up_alt
                                  //     :
                                  Icons.thumb_up_alt_outlined,
                                  // color:
                                  //     // controller.likedPosts[
                                  //     //             post.postIdPk.toString()] ==
                                  //     //         true
                                  //     //     ?
                                  //     Colors.blue
                                  // : null,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'Like',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.cyan800,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 40.27.w),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.commentsdata,
                            //     arguments: post.postIdPk);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                ImageConstant.comment,
                                width: 16.27.w,
                                height: 16.27.h,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'Comment',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.cyan800,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.5.h),
                    Expanded(child: _profileData()),
                    Divider(color: appTheme.greydivider),
                    SizedBox(height: 12.5.h),
                    sendcomment(),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.createnews);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Create News',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 2,
                color: Colors.grey,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed(AppRoutes.);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileData() {
    // String getTimeAgo(String recordDate) {
    //   DateTime commentDate = DateTime.parse(recordDate);
    //   Duration difference = DateTime.now().difference(commentDate);

    //   if (difference.inHours < 24) {
    //     return '${difference.inHours}hr ago';
    //   } else {
    //     // Show the date format of the uploaded picture
    //     return DateFormat.yMMMd().format(commentDate);
    //   }
    // }

    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: ClipOval(
                  child: Image.network(
                    '',
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Icon(Icons.person, size: 40);
                    },
                  ),
                ),
              ),
              title: Text(
                'Kalpita More',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.cyan800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Great",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.cyan800,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.likeblack,
                          width: 15.w,
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 5.5.w,
                        ),
                        VerticalDivider(
                          color: appTheme.greyverticaldevider,
                          thickness: 1.0,
                          width: 1.0,
                        ),
                        SizedBox(
                          width: 5.5.w,
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: appTheme.black900,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 5.5.w,
                        ),
                        Text(
                          'Likes',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: appTheme.black900,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              trailing: Text(
                "1hr ago",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            if (index != -1) // Add divider if not the last item
              Divider(
                color: appTheme.greydivider,
                indent: 70,
              ),
          ],
        );
      },
    );
  }

  Widget _profileimagename() {
    // User? taggedPeople =
    //     controller.getAllCertificate.value.users?[userPosts.taggedUsers];

    return GestureDetector(
      onTap: () {
        // final postId = userPosts.postIdPk;
        // print('postIdpostId$postId');
        // Get.toNamed(AppRoutes.viewcertificatescreen, arguments: postId);
      },
      child: Stack(
        alignment: Alignment.center, // Align the CircleAvatar to the center
        clipBehavior: Clip
            .none, // Allow overflow to show the CircleAvatar outside the bounds
        children: [
          SizedBox(
            width: 327, // Set the desired width
            // height:8,
            child: Text(
              'Just few days to Go....... Right dress for right occasion. No matter in what mood you are, Red and Green will brighten up your day on 21st December The last party for this Year!!! To add to the cheer we have biryani and icecream for lunch. Followed by gifts from secret Santa and a guessing ga see more',
              style: TextStyle(color: appTheme.black600),
            ),
          ),
        ],
      ),
    );
  }

  Widget sendcomment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: CircleAvatar(
              child: Image.network(
                '',
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white,
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            height: 40.h,
            decoration:
                BoxDecoration(border: Border.all(color: appTheme.gray500)),
            child: TextField(
              // controller: controller.commentcontroller,
              cursorColor: appTheme.black600,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour.withOpacity(1),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Type a comment',
                hintStyle: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: appTheme.greytextcolour),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () {
            // final firstName = author!.firstName ?? "";
            // final lastName = author.lastName ?? "";
            // final postId = userPosts.postIdPk ?? "";
            // controller.addcomment(firstName, lastName, postId);
          },
          child: Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: appTheme.rediconbackground,
              ),
              padding:
                  const EdgeInsets.only(top: 9, bottom: 9, right: 21, left: 21),
              child: SvgPicture.asset(
                ImageConstant.send,
                fit: BoxFit.contain,
              )),
        ),
      ],
    );
  }
}
