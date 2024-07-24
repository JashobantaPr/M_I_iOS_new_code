import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/type_A_incentives_plans/controllers/incentives_plans.dart';
import 'package:incentivesgit/presentation/type_B_leaderboard/controller/leaderBoard_typeb_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class LeaderBoardScreentypeb extends GetWidget<IncentivesPlansControlller> {
  const LeaderBoardScreentypeb({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderBTypeBController controller = Get.put(LeaderBTypeBController());

    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          title: Text(
            "Leader Board",
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 19.76.h,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          controller.searchQuery.value = value;
                        },
                        cursorColor: appTheme.black600, // Set cursor color here
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          contentPadding: EdgeInsets.only(bottom: 10.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey, // Specify the color you want here
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.filteredUserIds!.length,
              itemBuilder: (context, index) {
                final userId = controller.filteredUserIds![index];
                final user =
                    controller.leaderBoardResponse.value.users![userId];
                final userRank =
                    controller.leaderBoardResponse.value.allRank![userId];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: appTheme.rediconbackground,
                                  width: 1.5, // Border width
                                ),
                              ),
                              child: ClipOval(
                                child: user?.profile != null
                                    ? Image.network(
                                        '${Url.profileimageUrl}${user!.profile}',
                                        width: 60,
                                        height: 60,
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
                                          return const Icon(Icons.person,
                                              size: 60);
                                        },
                                      )
                                    : const Icon(
                                        Icons.person,
                                        size: 60,
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appTheme.rediconbackground,
                                ),
                                child: Text(
                                  '${userRank?.ranks ?? 'N/A'}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${user!.firstName} ${user.lastName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: appTheme.black900,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Scope: ${user.scope}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: appTheme.greytextcolour,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                // overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 3),
                              // Text(
                              //   'Points: ${userRank?.points ?? 'N/A'}',
                              //   style: TextStyle(
                              //     fontSize: 12,
                              //     color: Colors.grey,
                              //     fontFamily: GoogleFonts.poppins().fontFamily,
                              //   ),
                              // ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Points: ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${userRank?.points ?? 'N/A'}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: appTheme.black900,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
