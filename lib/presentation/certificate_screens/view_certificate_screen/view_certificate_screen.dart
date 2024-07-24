import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';

import '../../../data/api_secvices/api_url.dart';
import 'controller/view_certificate_controller.dart';
import 'model/view_certificate_model.dart';

class ViewCertificateScreen extends GetWidget<ViewCertificateController> {
  const ViewCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "View Post",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
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
        backgroundColor: appTheme.grey,
        body: Obx(
          () {
            final postId = Get.arguments;
            var posts = controller.viewCertificatedata.value.data?.posts;

            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0XFFE41C39),
                ),
              );
            } else if (posts == null || posts.isEmpty) {
              return Center(
                child: Text(
                  'No data available',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.cyan800,
                  ),
                ),
              );
            } else {
              // Find the post with the matching postId
              Post? postToShow = posts.firstWhere(
                (post) => post.postIdPk == postId,
              );

              if (postToShow == null) {
                return Center(
                  child: Text(
                    'Post not found',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.cyan800,
                    ),
                  ),
                );
              } else {
                // Show the data when the specific post is found
                User? author = controller.viewCertificatedata.value.data
                    ?.users?[postToShow.authoredBy];

                List<Comment>? comments =
                    controller.viewCertificatedata.value.data?.comments;
                List<Comment> postComments = comments!
                    .where((comment) => comment.postIdFk == postToShow.postIdPk)
                    .toList();
                int commentCount = postComments.length;
                controller.getalllikesbuzzes(postToShow.postIdPk.toString());

                print('commentCount$commentCount');
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 480.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: appTheme.grey,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 2.0, // Adjust the width as needed
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    '${Url.imageUrl}${author?.profile ?? ''}',
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
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Icon(Icons.person, size: 35);
                                    },
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
                                              '${author?.firstName ?? ""} ${author?.lastName ?? ""}',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.cyan800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' has a given Certificate.',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
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
                                        formatDate(postToShow.recorddate ?? ""),
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
                            ],
                          ),
                          SizedBox(height: 15.h),
                          _profileimagename(postToShow, author),
                          SizedBox(height: 35.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postToShow.name ?? "",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.cyan800,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Divider(color: appTheme.greydivider),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if ((postToShow.likes ?? "0") !=
                                      "0") // Check if likes is not "0"
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.likerdata,
                                            arguments: postToShow.postIdPk);
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: postToShow.likes ?? "0",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: appTheme.cyan800,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' Likes',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: appTheme.cyan800,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if ((postToShow.totalcomments ?? "0") !=
                                      "0") // Check if totalcomments is not "0"
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.commentsdata,
                                            arguments: postToShow.postIdPk);
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: postToShow.totalcomments ??
                                                  "0",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: appTheme.cyan800,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' Comments',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: appTheme.cyan800,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 11.5.h),
                          Divider(color: appTheme.greydivider),
                          SizedBox(height: 5.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.likepost(
                                          postToShow.postIdPk.toString(),
                                          author!.firstName.toString(),
                                          author.lastName.toString());
                                    },
                                    child: Icon(
                                      controller.likedPosts.contains(
                                              postToShow.postIdPk.toString())
                                          ? Icons.thumb_up_alt
                                          : Icons.thumb_up_alt_outlined,
                                      color: controller.likedPosts.contains(
                                              postToShow.postIdPk.toString())
                                          ? Colors.black
                                          : null,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    'Like',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 40.27.w),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.commentsdata,
                                      arguments: postToShow.postIdPk);
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
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: appTheme.cyan800,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(color: appTheme.greydivider),
                          SizedBox(height: 5.5.h),
                          Visibility(
                            visible:
                                postComments.isNotEmpty && postComments != null,
                            child: Expanded(
                              child: postComments.isEmpty
                                  ? SizedBox.shrink()
                                  : _profileData(postComments, author),
                            ),
                          ),
                          Divider(color: appTheme.greydivider),
                          SizedBox(height: 12.5.h),
                          sendcomment(author),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  String formatDate(String dateTime) {
    final dateFormat = DateFormat('dd MMMM yyyy hh:mm a');
    final parsedDate = DateTime.parse(dateTime);
    return dateFormat.format(parsedDate);
  }

  Widget _profileData(List<Comment> postComments, User? commentDetails) {
    String _getTimeAgo(String recordDate) {
      DateTime commentDate = DateTime.parse(recordDate);
      Duration difference = DateTime.now().difference(commentDate);

      if (difference.inHours < 24) {
        return '${difference.inHours}hr ago';
      } else {
        // Show the date only
        return DateFormat.yMMMd().format(commentDate);
      }
    }

    return postComments.isEmpty
        ? const SizedBox.shrink()
        : ListView.builder(
            itemCount: postComments.length > 1 ? 1 : postComments.length,
            itemBuilder: (context, index) {
              final comment = postComments[index];
              bool isUserResponse =
                  commentDetails?.userIdPk == commentDetails?.userIdPk;
              String userResponse = '';
              String firstName = '';
              String lastName = '';
              String profileImage = '';

              if (isUserResponse) {
                // If it's the user's response, store the full response
                userResponse = comment.comment ?? "";
                // Access additional user data
                firstName = commentDetails?.firstName ?? "";
                lastName = commentDetails?.lastName ?? "";
                profileImage = commentDetails?.profile ?? "";
              }

              print('userResponse: $userResponse');
              print('firstName: $firstName');
              print('lastName: $lastName');
              print('profileImage: $profileImage');

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
                          '${Url.imageUrl}$profileImage',
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
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
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
                      '$firstName $lastName',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.cyan800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.comment ?? "",
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
                      "",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.greytextcolour,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  if (index !=
                      postComments.length -
                          1) // Add divider if not the last item
                    Divider(
                      color: appTheme.greydivider,
                      indent: 70,
                    ),
                ],
              );
            },
          );
  }

  Widget _profileimagename(Post userPosts, User? userDetails) {
    String? profileImage;

    return Stack(
      alignment: Alignment.center, // Align the CircleAvatar to the center
      clipBehavior: Clip
          .none, // Allow overflow to show the CircleAvatar outside the bounds
      children: [
        SizedBox(
            width: 400, // Set the desired width
            height: 200,
            child: Image.network(
              userPosts.certificateTemplate ?? "",
              width: 400, // Set the desired width
              height: 200,
              fit: BoxFit.cover,
            )),
        Positioned(
          bottom: -20, // Adjust the position to place it half outside the box
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.red,
                width: 2.0, // Adjust the width as needed
              ),
            ),
            child: ClipOval(
              child: Image.network(
                '${Url.imageUrl}$profileImage',
                width: 30.w,
                height: 30.h,
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
                  return Icon(Icons.person, size: 35);
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget sendcomment(User? author) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
            child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.red,
              width: 2.0, // Adjust the width as needed
            ),
          ),
          child: ClipOval(
            child: Image.network(
              '${Url.imageUrl}${author?.profile ?? ''}',
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
                  size: 35,
                  color: Colors.black,
                );
              },
            ),
          ),
        )),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            height: 40.h,
            decoration:
                BoxDecoration(border: Border.all(color: appTheme.gray500)),
            child: TextField(
              controller: controller.commentcontroller,
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
            final firstName = author!.firstName ?? '';
            final lastName = author.lastName ?? '';
            controller.addcomment(firstName, lastName, controller.postId);
          },
          child: Container(
              width: 60,
              height: 46,
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
