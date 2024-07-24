import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/controller/buzzes_tabbar_post_controller.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/model/buzzes_tabbar_post_model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:video_player/video_player.dart';

import '../Buzze_Tabbar/controller/buzzeTabBar_Controller.dart';

class BuzzesTabbarPostScreen extends GetWidget<BuzzesTababrPostController> {
  const BuzzesTabbarPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BuzzesTababrPostController());
    print('ggggggggggggggggggg${controller.likedPosts}');

    return ScreenUtilInit(
      child: RefreshIndicator(
        strokeWidth: 2,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: appTheme.black600,
        onRefresh: () {
          return controller.fetchedbuzzes();
        },
        child: Scaffold(
          backgroundColor: appTheme.grey,
          body: Obx(() {
            if (controller.isLoading.value) {
              return _buildLoadingIndicator(context);
            } else if (controller.buzzesdetails.value == null) {
              return _buildNoBuzzesMessage();
            } else {
              return _buildBuzzesList();
            }
          }),
          bottomNavigationBar: Container(
            height: 50,
            decoration: BoxDecoration(color: appTheme.white, boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: appTheme.background,
                  offset: Offset(2, 4),
                  spreadRadius: Checkbox.width)
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      final BuzzesTabBarController scopeController =
                          Get.find<BuzzesTabBarController>();
                      print(
                          'selectedScopeid${scopeController.selectedScopeid.value}');
                      print(
                          'selectedScopeName${scopeController.selectedScopeName.value}');

                      Get.toNamed(
                        AppRoutes.buzz9,
                        arguments: {
                          'scopeId': scopeController.selectedScopeid.value,
                          'scopeName': scopeController.selectedScopeName.value,
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: appTheme.greytextcolour,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Buzz',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: appTheme.black600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 2,
                  color: appTheme.greytextcolour,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => FilterBottomSheet(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageConstant.filter,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: appTheme.black600,
                          ),
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

  // Widget _buildLoadingIndicator() {
  //   return const Center(
  //     child: SpinKitFadingCircle(
  //       color: Colors.black,
  //       size: 50.0,
  //     ),
  //   );
  // }

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

  Widget _buildNoBuzzesMessage() {
    return const Center(
      child: Text('No Buzzes'),
    );
  }

  Widget _buildBuzzesList() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: controller.buzzesdetails.value.posts?.length ?? 0,
      itemBuilder: (context, index) {
        return _buildBuzzListItem(index, context);
      },
    );
  }

  Widget _buildBuzzListItem(int index, BuildContext context) {
    final post = controller.buzzesdetails.value.posts?[index];
    if (post == null) {
      return SizedBox.shrink();
    }

    List<String> taggedUserIds = post.taggedUsers?.split(',') ?? [];
    BuzzUser? author = controller.buzzesdetails.value.users?[post.authoredBy];
    List<BuzzComment>? comments = controller.buzzesdetails.value.comments;
    List<BuzzComment> postComments = comments
            ?.where((comment) => comment.postIdFk == post.postIdPk)
            .toList() ??
        [];
    int commentCount = postComments.length;
    controller.getalllikesbuzzes(post.postIdPk.toString());

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: appTheme.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.viewprofile);
                      },
                      child: Container(
                        width: 41.w,
                        height: 37.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: appTheme.redappbar, width: 1.2),
                            shape: BoxShape.circle),
                        child: ClipOval(
                          child: Image.network(
                              '${Url.profileimageUrl}${author!.profile}',
                              width: 41.w,
                              height: 37.h,
                              fit: BoxFit.cover, errorBuilder:
                                  (BuildContext context, Object exception,
                                      StackTrace? stackTrace) {
                            return Container(
                              color: Color(0XFFE1E1E1),
                              child: const Icon(
                                Icons.image_outlined,
                                weight: 1,
                              ),
                            );
                          }),
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
                                text: '${author.firstName} ${author.lastName} ',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.cyan800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'has buzzed.',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.cyan800,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${DateFormat('dd-MMMM-yyyy').format(DateTime.tryParse(post.recorddate!) ?? DateTime.now())} ${_formatTime(DateTime.tryParse(post.recorddate!) ?? DateTime.now())}',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: appTheme.greytextcolour,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            SvgPicture.asset(
                              ImageConstant.public,
                              width: 13.42.w,
                              height: 13.42.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  position: PopupMenuPosition.under,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      height: 35,
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.buzz28,
                          arguments: controller
                              .buzzesdetails.value.posts![index].postIdPk,
                        );
                      },
                      value: 'Award points',
                      child: Text(
                        'Award points',
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: appTheme.black900,
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'Delete by author',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return dialoguebox(post.postIdPk.toString());
                          },
                        );
                      },
                      child: Text(
                        'Delete by author',
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: appTheme.black900,
                        ),
                      ),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      ImageConstant.morevert,
                      width: 3.75.w,
                      height: 15.02.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: taggedUserIds.map((userId) {
                    return _buildTaggedUserItem(userId);
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                  'For ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: appTheme.cyan800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' ${post.behaviour}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: appTheme.redappbar,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2.w),
                Image.network(
                  '${Url.behaviourimageUrl}${post.icon}',
                  height: 16.54,
                  width: 13.51,
                )
              ],
            ),
            Visibility(
                visible: post.description!.isNotEmpty,
                child: SizedBox(height: 8.h)),
            if (post.buzzzTypeName?.toLowerCase() == 'text')
              Align(
                alignment: Alignment.centerLeft,
                child: ExpandableText(
                  stripHtmlTags(post.description ?? ""),
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 2,
                  linkColor: Colors.blue,
                  animation: true,
                  collapseOnTextTap: true,
                  textAlign: TextAlign.start,
                ),
              )
            else if (post.buzzzTypeName?.toLowerCase() == 'video' &&
                post.recognitionfile != null &&
                post.recognitionfile != "")
              VideoPlayerWidget(
                videoUrl: post.recognitionfile!,
                autoPlay: false,
              )
            else if (post.buzzzTypeName?.toLowerCase() == 'audio' &&
                post.recognitionfile != null &&
                post.recognitionfile != "")
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0XFFE4E4E4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            if (controller.isPlayings.value &&
                                controller.playingindex.value == index) {
                              controller.stopAudio();
                            } else {
                              controller.playAudio(
                                  'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/audio/${post.recognitionfile}',
                                  index);
                            }
                          },
                          child: Obx(() => Icon(
                                controller.isPlayings.value &&
                                        controller.playingindex.value == index
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline,
                                color: Colors.black,
                                size: 30,
                              )),
                        ),
                        // Slider and Time Duration
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Slider
                              Obx(() {
                                if (controller.playingindex.value == index) {
                                  return Slider(
                                    value: controller.position.value.inSeconds
                                        .toDouble(),
                                    max: controller.duration.value.inSeconds
                                        .toDouble(),
                                    onChanged: (value) {
                                      final position =
                                          Duration(seconds: value.toInt());
                                      controller.seek(position);
                                    },
                                    activeColor: Colors.black,
                                    inactiveColor: Colors.grey,
                                  );
                                } else {
                                  return const Slider(
                                    value: 0,
                                    max: 1,
                                    onChanged: null,
                                    activeColor: Colors.black,
                                    inactiveColor: Colors.black,
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.toggleMute();
                          },
                          child: Obx(() => Icon(
                                controller.isMuted.value &&
                                        controller.playingindex.value == index
                                    ? Icons.volume_off
                                    : Icons.volume_up,
                                color: Colors.black,
                                size: 30,
                              )),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ),
              ),
            Visibility(
                visible: post.description!.isNotEmpty,
                child: SizedBox(height: 10.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.likerdata, arguments: post.postIdPk);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: post.likes != null &&
                            int.tryParse(post.likes!) != null &&
                            int.parse(post.likes!) > 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${post.likes}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                    ],
                  ),
                ),
                SizedBox(width: 40.27.w),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.commentsdata,
                        arguments: post.postIdPk);
                  },
                  child: Visibility(
                    visible: post.totalcomments != null &&
                        int.tryParse(post.totalcomments!) != null &&
                        int.parse(post.totalcomments!) > 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${post.totalcomments}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
                ),
              ],
            ),
            Visibility(
                visible: post.description!.isNotEmpty,
                child: SizedBox(height: 11.5.h)),
            Divider(color: appTheme.greydivider),
            SizedBox(height: 11.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.likepost(
                      post.postIdPk.toString(),
                      author.firstName.toString(),
                      author.lastName.toString(),
                    );
                    controller.getalllikesbuzzes(post.postIdPk.toString());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.likepost(
                              post.postIdPk.toString(),
                              author.firstName.toString(),
                              author.lastName.toString(),
                            );
                          },
                          child: Icon(
                            controller.likedPosts
                                    .contains(post.postIdPk.toString())
                                ? Icons.thumb_up_alt
                                : Icons.thumb_up_alt_outlined,
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
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
                    Get.toNamed(AppRoutes.commentsdata,
                        arguments: post.postIdPk);
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
            SizedBox(height: 11.5.h),
            Divider(color: appTheme.greydivider),
            ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: commentCount,
              itemBuilder: (context, commentIndex) {
                BuzzComment comment = postComments[commentIndex];
                BuzzUser? commentAuthor =
                    controller.buzzesdetails.value.users?[comment.cmsUserIdFk];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${Url.profileimageUrl}${commentAuthor!.profile}'),
                  ),
                  title: Text(
                    '${commentAuthor.firstName} ${commentAuthor.lastName}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(comment.comment ?? ''),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            sendcomment(index)
          ],
        ),
      ),
    );
  }

  String stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  Widget sendcomment(int index) {
    BuzzPost post = controller.buzzesdetails.value.posts![index];
    BuzzUser? author = controller.buzzesdetails.value.users?[post.authoredBy];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 41.w,
          height: 37.h,
          decoration: BoxDecoration(
              border: Border.all(color: appTheme.redappbar),
              shape: BoxShape.circle),
          child: ClipOval(
            child: Image.network('${Url.profileimageUrl}${author!.profile}',
                width: 41.w,
                height: 37.h,
                fit: BoxFit.cover, errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
              return Container(
                color: const Color(0XFFE1E1E1),
                child: const Icon(
                  Icons.image_outlined,
                  weight: 1,
                ),
              );
            }),
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
                contentPadding: const EdgeInsets.only(left: 15),
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
            controller.addcomment(post.postIdPk.toString(),
                author.firstName.toString(), author.lastName.toString());
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

  Widget _buildTaggedUserItem(String userId) {
    BuzzUser? user = controller.buzzesdetails.value.users?[userId];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: SizedBox(
        width: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 51,
              decoration: BoxDecoration(
                  border: Border.all(color: appTheme.redappbar),
                  shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network('${Url.profileimageUrl}${user?.profile}',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover, errorBuilder: (BuildContext context,
                        Object exception, StackTrace? stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                    color: Colors.white,
                    child: const Icon(
                      Icons.image_outlined,
                      weight: 1,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              '${user?.firstName} ${user?.lastName}',
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: appTheme.cyan800,
                  fontSize: 10.sp),
            )
          ],
        ),
      ),
    );
  }

  Widget dialoguebox(String postid) {
    return Center(
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
                    'Are you sure you want to delete it?',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 5, 4, 4),
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
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          minimumSize: const Size(120, 60),
                        ),
                        child: const Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {
                          controller.deletepost(postid);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                          minimumSize: const Size(120, 60),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
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
    );
  }

  String _formatTime(DateTime dateTime) {
    String amPm = 'AM';
    int hour = dateTime.hour;
    if (hour >= 12) {
      amPm = 'PM';
      if (hour > 12) {
        hour -= 12;
      }
    }
    if (hour == 0) {
      hour = 12;
    }
    String minute = '${dateTime.minute}'.padLeft(2, '0');
    return '$hour:$minute $amPm';
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;
  final bool isMuted;
  final bool autoPlay;

  VideoPlayerWidget({
    required this.videoUrl,
    this.isMuted = false,
    this.autoPlay = false,
  });

  final videoController = Get.put(BuzzesTababrPostController());

  @override
  Widget build(BuildContext context) {
    videoController.initializeVideoPlayer(videoUrl,
        autoPlay: autoPlay, isMuted: isMuted);

    return Obx(() {
      if (videoController.isError.value) {
        return _buildErrorWidget();
      } else if (videoController.isInitialized.value) {
        return AspectRatio(
          aspectRatio: videoController.controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: VideoPlayer(videoController.controller),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: GestureDetector(
                  onTap: videoController.togglePlayPause,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 92, 91, 91),
                    ),
                    child: Icon(
                      videoController.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget _buildErrorWidget() {
    return GestureDetector(
      onTap: () {
        videoController.initializeVideoPlayer(videoUrl,
            autoPlay: autoPlay, isMuted: isMuted);
      },
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 1.5,
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'loading....',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  final BuzzesTababrPostController filterController =
      Get.put(BuzzesTababrPostController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: appTheme.redappbar,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Filter',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Spacer(),
                        const Text(
                          'reset Filter',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(bottom: 0),
                          icon: const Icon(
                            Icons.rotate_left_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            filterController.resetFilters();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'Search',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: TextField(
                      controller: filterController.serchcontroller,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'View',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: Obx(() => DropdownButtonFormField<String>(
                          value: filterController.selectedOption.value.isEmpty
                              ? null
                              : filterController.selectedOption.value,
                          items:
                              filterController.viewOptions.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            filterController.setSelectedOption(newValue);
                          },
                          decoration: const InputDecoration(
                            labelText: 'All Buzzes',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(10),
                          ),
                        )),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'From',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: Obx(
                      () => TextField(
                        controller: TextEditingController(
                            text: filterController.fromDate.value),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelText: 'From Date',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () => filterController.selectDate(context, true),
                        readOnly: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'To',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: Obx(
                      () => TextField(
                        controller: TextEditingController(
                            text: filterController.toDate.value),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelText: 'To Date',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () =>
                            filterController.selectDate(context, false),
                        readOnly: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(color: appTheme.greydivider),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          filterController.isApplyButtonClicked.value = true;
                          filterController.isCancelButtonClicked.value = false;
                          filterController.fetchedbuzzes();
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          minimumSize: const Size(120, 60),
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {
                          filterController.isApplyButtonClicked.value = false;
                          filterController.isCancelButtonClicked.value = true;
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          minimumSize: const Size(120, 60),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
