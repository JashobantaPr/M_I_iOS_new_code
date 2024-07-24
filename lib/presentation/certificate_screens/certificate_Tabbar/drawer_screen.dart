import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_leaderboard/controller/certficateLeader_controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/get_all_certificate_screen/controller/get_all_certificate_controller.dart';

class CertificateDialougeScreen extends StatelessWidget {
  CertificateDialougeScreen({Key? key});

  final CertificateTabBarController controller =
      Get.find<CertificateTabBarController>();

  final GetAllCertificateController certificatecontroller =
      Get.find<GetAllCertificateController>();

  final CertificateLeaderBoardController trendingController =
      Get.find<CertificateLeaderBoardController>();

  @override
  Widget build(BuildContext context) {
    // Displayed by default
    String defaultScope = controller.selectedScopeName.value.isNotEmpty
        ? controller.selectedScopeName.value
        : "No Scope Selected";

    return Drawer(
      elevation: BorderSide.strokeAlignOutside,
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.getScopeData.length,
                      itemExtent: 40,
                      itemBuilder: (BuildContext context, int index) {
                        final city = controller.getScopeData[index]['city'];
                        bool isSelected =
                            city == controller.selectedScopeName.value;

                        return ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: city,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                        AutofillHints.creditCardExpirationDay,
                                    color: Colors.black,
                                  ),
                                ),
                                if (isSelected)
                                  TextSpan(
                                    text: '   (Default View)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xFF000EEE),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          onTap: () {
                            controller.setSelectedCity(city);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                    endIndent: 5,
                    indent: 5,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    if (controller.selectedScopeName.value.isNotEmpty) {
                      return ListTile(
                        leading: Obx(() {
                          return Checkbox(
                            value: controller.isDefaultView.value,
                            onChanged: (bool? value) {
                              controller.isDefaultView.value = value ?? false;
                            },
                            fillColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 190, 190, 192),
                            ),
                            hoverColor: const Color(0xFF000EEE),
                            checkColor: Colors.white,
                          );
                        }),
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Mark ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: controller.selectedScopeName.value,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text: ' for a default view',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.setCityName(
                            controller.selectedScopeName.value,
                            controller.selectedScopeid.value);
                        certificatecontroller.getAllCertifictes();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE41C39),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
