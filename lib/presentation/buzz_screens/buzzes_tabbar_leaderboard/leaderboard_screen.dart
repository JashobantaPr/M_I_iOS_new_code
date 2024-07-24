import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/controller/leaderboard_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class BuzzesTabbarLeaderBoardScreen
    extends GetWidget<BuzzesTabbarLeaderBoardController> {
  const BuzzesTabbarLeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<BuzzesTabbarLeaderBoardController>(
    //     () => BuzzesTabbarLeaderBoardController());
    final controller = Get.put<BuzzesTabbarLeaderBoardController>(
        BuzzesTabbarLeaderBoardController());

    return Scaffold(
      backgroundColor: appTheme.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                    size: 15,
                  ),
                ),
                Text(
                  'Overview of the year',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.leaderBoardResponse.value == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  var users = controller.leaderBoardResponse.value.users;
                  var allRank = controller.leaderBoardResponse.value.allRank;
                  if (users == null || users.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        var userId = allRank.keys.elementAt(index);
                        var userDetails = users[userId];
                        var rankDetails = allRank[userId];

                        if (userDetails == null || rankDetails == null) {
                          return SizedBox.shrink();
                        }

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
                                          color: Colors.red,
                                          width: 1.5,
                                        ),
                                      ),
                                      child:
                                          // CircleAvatar(
                                          //   radius: 32,
                                          //   backgroundImage: NetworkImage(
                                          //     userDetails.profile ??
                                          //         '', // Ensure profile is not null
                                          //   ),
                                          // ),
                                          CircleAvatar(
                                        radius: 32,
                                        backgroundImage: userDetails.profile !=
                                                    null &&
                                                userDetails.profile.isNotEmpty
                                            ? NetworkImage(userDetails.profile)
                                            : null,
                                        child: userDetails.profile == null ||
                                                userDetails.profile.isEmpty
                                            ? Icon(Icons.person, size: 60)
                                            : null,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                        child: Text(
                                          rankDetails.ranks.toString(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${userDetails.firstName} ${userDetails.lastName}',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Location: ${userDetails.city ?? 'N/A'}',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        userDetails.dpName ?? '',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Text(
                                            rankDetails.count.toString(),
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Buzzes',
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
