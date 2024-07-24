import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/certificate_screens/Filter/filter_screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/get_all_certificate_screen/model/get_all_certificate_model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../../data/api_secvices/api_url.dart';
import '../certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'controller/get_all_certificate_controller.dart';

class GetAllCertificateScreen extends GetWidget<GetAllCertificateController> {
  const GetAllCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: RefreshIndicator(
        strokeWidth: 2,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: appTheme.black600,
        onRefresh: () {
          return controller.getAllCertifictes();
        },
        child: Scaffold(
          body: Obx(
            () {
              var posts = controller.getAllCertificate.value.posts;

              if (controller.isLoading.value) {
                return _buildLoadingIndicator(context);
              } else if (posts == null || posts.isEmpty) {
                // Show a message when there is no data
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
                // Show the data when available
                return Card(
                  //  elevation: 2,
                  margin: const EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          Post post = posts[index];
                          User? author = controller
                              .getAllCertificate.value.users?[post.authoredBy];
                          List<Comment>? comments =
                              controller.getAllCertificate.value.comments;
                          List<Comment> postComments = comments!
                              .where((comment) =>
                                  comment.postIdFk == post.postIdPk)
                              .toList();
                          int commentCount = postComments.length;
                          controller
                              .getalllikesCertificate(post.postIdPk.toString());
                          controller.firstName.value = author!.firstName ?? "";
                          controller.lastName.value = author.lastName ?? "";
                          controller.profileImage.value = author.profile ?? "";

                          return Card(
                            elevation: 4,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 0),
                              child: Stack(
                                children: [
                                  Container(
                                    height:
                                        postComments.isEmpty ? 425.h : 490.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: appTheme.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewprofile);
                                                },
                                                child: Container(
                                                  width: 45.w,
                                                  height: 45.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.red,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    child: ClipOval(
                                                      child: Image.network(
                                                        '${Url.imageUrl}${author?.profile ?? ''}',
                                                        width: 30.w,
                                                        height: 30.h,
                                                        fit: BoxFit.cover,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          } else {
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
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
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Icon(
                                                              Icons.person,
                                                              size: 40);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 7.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '${author?.firstName ?? ""} ${author?.lastName ?? ""}',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                            color: appTheme
                                                                .cyan800,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' has a given Certificate.',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                            color: appTheme
                                                                .cyan800,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        formatDate(
                                                            post.recorddate ??
                                                                ""),
                                                        style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                          color: appTheme
                                                              .greytextcolour,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                          _profileimagename(post, author),
                                          SizedBox(height: 20.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                stripHtmlTags(
                                                    post.description ?? ""),
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  color: appTheme.cyan800,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Divider(
                                                  color: appTheme.greydivider),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .commentsdata,
                                                          arguments:
                                                              post.postIdPk);
                                                    },
                                                    child: Visibility(
                                                      visible:
                                                          post.likes != "0",
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  post.likes ??
                                                                      "",
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily: GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                                color: appTheme
                                                                    .cyan800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' Likes',
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily: GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                                color: appTheme
                                                                    .cyan800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible:
                                                        post.totalcomments !=
                                                            "0",
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            AppRoutes
                                                                .commentsdata,
                                                            arguments:
                                                                post.postIdPk);
                                                      },
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  post.totalcomments ??
                                                                      "",
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily: GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                                color: appTheme
                                                                    .cyan800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' Comments',
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily: GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                                color: appTheme
                                                                    .cyan800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller.likepost(
                                                    post.postIdPk.toString(),
                                                    author.firstName.toString(),
                                                    author.lastName.toString(),
                                                  );
                                                  controller
                                                      .getalllikesCertificate(
                                                          post.postIdPk
                                                              .toString());
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Obx(
                                                      () => GestureDetector(
                                                        onTap: () {
                                                          controller.likepost(
                                                            post.postIdPk
                                                                .toString(),
                                                            author.firstName
                                                                .toString(),
                                                            author.lastName
                                                                .toString(),
                                                          );
                                                          controller
                                                              .getalllikesCertificate(
                                                                  post.postIdPk
                                                                      .toString());
                                                        },
                                                        child: Icon(
                                                          controller.likedPosts
                                                                  .contains(post
                                                                      .postIdPk
                                                                      .toString())
                                                              ? Icons
                                                                  .thumb_up_alt
                                                              : Icons
                                                                  .thumb_up_alt_outlined,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 3.w),
                                                    Text(
                                                      'Like',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily,
                                                        color: appTheme.cyan800,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 40.27.w),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.commentsdata,
                                                      arguments: post.postIdPk);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
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
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily,
                                                        color: appTheme.cyan800,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.5.h),
                                          Divider(color: appTheme.greydivider),
                                          postComments.isEmpty
                                              ? SizedBox.shrink()
                                              : Flexible(
                                                  child: _profileData(
                                                      postComments)),
                                          Divider(color: appTheme.greydivider),
                                          SizedBox(height: 12.5.h),
                                          sendcomment(author, post),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: -5,
                                    child: PopupMenuButton<String>(
                                      position: PopupMenuPosition.under,
                                      offset: const Offset(-13, 0),
                                      onSelected: (String value) async {
                                        if (value == 'Download Certificate') {
                                          await Get.find<
                                                  GetAllCertificateController>()
                                              .downloadCertificate(post
                                                  .certificateUserMappingId!);
                                        }
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem<String>(
                                            height: 25,
                                            textStyle: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: appTheme.black600,
                                            ),
                                            padding: EdgeInsets.only(
                                              left: 10.w,
                                              right: 40.w,
                                              top: 8.h,
                                              bottom: 8.h,
                                            ),
                                            value: 'Download Certificate',
                                            child: const Text(
                                                'Download Certificate'),
                                          ),
                                        ];
                                      },
                                      icon: SvgPicture.asset(
                                          ImageConstant.morevert),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
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
                      final CertificateTabBarController scopeController =
                          Get.find<CertificateTabBarController>();
                      print(
                          'selectedScopeid${scopeController.selectedScopeid.value}');
                      print(
                          'selectedScopeName${scopeController.selectedScopeName.value}');

                      Get.toNamed(
                        AppRoutes.awardCertificate,
                        arguments: {
                          'scopeId': scopeController.selectedScopeid.value,
                          'scopeName': scopeController.selectedScopeName.value,
                        },
                      );
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
                          'Certificate',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
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
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => FilterBottomSheetScreen(),
                      );
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
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(String dateTime) {
    final dateFormat = DateFormat('dd MMMM yyyy hh:mm a');
    final parsedDate = DateTime.parse(dateTime);
    return dateFormat.format(parsedDate);
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return SkeletonLoader(
      builder: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 232, 230, 230),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 40.0,
                    color: const Color.fromARGB(255, 232, 230, 230),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 150.0,
              color: const Color.fromARGB(255, 232, 230, 230),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 40.0,
              color: const Color.fromARGB(255, 232, 230, 230),
            ),
          ],
        ),
      ),
      items: 2,
      period: const Duration(seconds: 2),
      highlightColor: const Color.fromARGB(255, 182, 180, 180),
      direction: SkeletonDirection.ltr,
    );
  }

  String stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  Widget _profileData(List<Comment> postComments) {
    String getTimeAgo(String recordDate) {
      DateTime commentDate = DateTime.parse(recordDate);
      Duration difference = DateTime.now().difference(commentDate);

      if (difference.inHours < 24) {
        return '${difference.inHours}hr ago';
      } else {
        // Show the date format of the uploaded picture
        return DateFormat.yMMMd().format(commentDate);
      }
    }

    return postComments.isEmpty
        ? const SizedBox.shrink()
        : ListView.builder(
            itemCount: postComments.length,
            itemBuilder: (context, index) {
              Comment comment = postComments[index];
              User? commentAuthor = controller
                  .getAllCertificate.value.users?[comment.cmsUserIdFk];

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
                          '${Url.imageUrl}${commentAuthor!.profile}',
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
                      '${commentAuthor.firstName ?? ''} ${commentAuthor.lastName ?? ''}',
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
                                '${comment.likes ?? "0"} Likes',
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
                      getTimeAgo(comment.recorddate ?? ""),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.greytextcolour,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  if (index != postComments.length - 1)
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
    User? taggedPeople =
        controller.getAllCertificate.value.users?[userPosts.taggedUsers];

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.viewotherprofile, arguments: userPosts);
        // print('postIdpostId$postId');
        // Get.toNamed(AppRoutes.viewcertificatescreen, arguments: postId);
      },
      child: Stack(
        alignment: Alignment.center, // Align the CircleAvatar to the center
        clipBehavior: Clip
            .none, // Allow overflow to show the CircleAvatar outside the bounds
        children: [
          SizedBox(
            width: 400, // Set the desired width
            height: 200,
            child: userPosts.certificateTemplate != null &&
                    userPosts.certificateTemplate!.isNotEmpty
                ? Image.network(
                    userPosts.certificateTemplate!,
                    width: 400, // Set the desired width
                    height: 200,
                    fit: BoxFit
                        .cover, // Use BoxFit.cover to maintain aspect ratio and cover the given dimensions
                  )
                : Container(
                    color: Colors.grey, // Placeholder color
                    width: 400,
                    height: 200,
                    child: const Center(
                      child: Text(
                        'No Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ),
          Positioned(
            bottom: -20, // Adjust the position to place it half outside the box
            child: Container(
              width:
                  44.w, // Increased width and height to accommodate the border
              height: 44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.red, // Set border color here
                  width: 2.0, // Set border width here
                ),
              ),

              child: ClipOval(
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors
                        .transparent, // Set background color to transparent
                    child: Image.network(
                      '${Url.imageUrl}${taggedPeople?.profile}',
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
                        return const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sendcomment(User? author, Post userPosts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 44.w, // Increased width and height to accommodate the border
          height: 44.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red, // Set border color here
              width: 2.0, // Set border width here
            ),
          ),
          child: ClipOval(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: CircleAvatar(
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
                      size: 20,
                      color: Colors.white,
                    );
                  },
                ),
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
            final firstName = author!.firstName ?? "";
            final lastName = author.lastName ?? "";
            final postId = userPosts.postIdPk ?? "";
            controller.addcomment(firstName, lastName, postId);
          },
          child: Container(
              width: 50,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: appTheme.rediconbackground,
              ),
              padding:
                  const EdgeInsets.only(top: 9, bottom: 9, right: 18, left: 18),
              child: SvgPicture.asset(
                ImageConstant.send,
                fit: BoxFit.contain,
              )),
        ),
      ],
    );
  }
}
