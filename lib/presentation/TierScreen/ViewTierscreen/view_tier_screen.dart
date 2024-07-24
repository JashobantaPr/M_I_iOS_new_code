import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../../../data/api_secvices/api_url.dart';
import 'controller/TierscreenController.dart';

class TierScreen extends GetWidget<TierController> {
  const TierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TierController>();

    return ScreenUtilInit(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(kToolbarHeight), // Adjust the height if needed
            child: Obx(
              () => AppBar(
                title: Text(
                  "View Tier",
                  style: TextStyle(
                    color: appTheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                backgroundColor: controller.tierData.value != null &&
                        controller.tierData.value!.tierType.isNotEmpty &&
                        controller.tierData.value!.tierType[0]
                                .tierBackgroundColor !=
                            null
                    ? hexToColor(controller
                        .tierData.value!.tierType[0].tierBackgroundColor)
                    : const Color(0XFFD1AB3E),
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: SvgPicture.asset(
                    ImageConstant.arrowback,
                    width: 26.75.w,
                    height: 19.76.h,
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 600,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: _viewtrierdata(),
                      ),
                      Positioned(
                        top: 150,
                        left: 10,
                        right: 10,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Next Tier: Platinum'),
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.audittrailscreen);
                                      },
                                      child: const Text(
                                        'Audit Trail',
                                        style: TextStyle(
                                          color: Color(0xFF000EEE),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 310,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [percentage()],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: controller.tierData.value !=
                                                      null &&
                                                  controller.tierData.value!
                                                      .tiersTarget.isNotEmpty
                                              ? Text(controller
                                                  .tierData
                                                  .value!
                                                  .tiersTarget[0]
                                                  .lastCalculated)
                                              : const Text('date:23/07/2024'),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 13, top: 5, bottom: 10),
                  child: Text(
                    'About More Tier',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: aboutmoretier()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color hexToColor(String hexString) {
    hexString = hexString.replaceAll("#", "");
    if (hexString.length == 6) {
      hexString = "FF$hexString";
    }
    return Color(int.parse("0x$hexString"));
  }

  Widget _viewtrierdata() {
    return Obx(
      () => Container(
        height: 322,
        width: double.infinity,
        color: controller.tierData.value != null &&
                controller.tierData.value!.tierType.isNotEmpty
            ? hexToColor(
                controller.tierData.value!.tierType[0].tierBackgroundColor)
            : const Color(0XFFD1AB3E),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: appTheme.white, width: 1),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      '${Url.profileimageUrl}${controller.profilePic.toString()}'),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: appTheme.white,
                              width: 1,
                            ),
                          ),
                          child: Container(
                              width: 41,
                              height: 37,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.2),
                                shape: BoxShape.circle,
                              ),
                              child: controller.tierData.value != null &&
                                      controller
                                          .tierData.value!.tierType.isNotEmpty
                                  ? ClipOval(
                                      child: Image.network(
                                        '${Url.profileimageUrl}${controller.tierData.value!.tierType[0].tierLogoName.toString()}',
                                        width: 41,
                                        height: 37,
                                        fit: BoxFit.cover,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Container(
                                            width: 38,
                                            height: 36,
                                            color: const Color(0XFFE1E1E1),
                                            child: const Icon(
                                              Icons.image_outlined,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Icon(
                                      Icons.star,
                                      color: Colors.black,
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutmoretier() {
    final controller = Get.find<TierController>();

    return Obx(
      () => Row(
        children: controller.tierData.value?.tiers.map((tier) {
              Color backgroundColor = hexToColor(tier.tierBackgroundColor);

              return Container(
                height: 391,
                width: 320,
                padding: const EdgeInsets.only(left: 10),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 59,
                          decoration: BoxDecoration(color: backgroundColor),
                          child: Row(
                            children: [
                              Container(
                                width: 41.w,
                                height: 37.h,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: appTheme.redappbar, width: 1.2),
                                    shape: BoxShape.circle),
                                child: ClipOval(
                                  child: Image.network(
                                      '${Url.profileimageUrl}${tier.tierLogoName}',
                                      width: 41.w,
                                      height: 37.h,
                                      fit: BoxFit.cover, errorBuilder:
                                          (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                    return Container(
                                      width: 38.w,
                                      height: 36.h,
                                      color: Color(0XFFE1E1E1),
                                      child: const Icon(
                                        Icons.image_outlined,
                                        weight: 1,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tier.tierName,
                                    style: TextStyle(
                                        color: const Color(0XFFFFFFFF),
                                        fontSize: 13,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Get upgraded to Gold Membership & enjoy \nadditional benefits. ',
                                    style: TextStyle(
                                        color: const Color(0XFFFFFFFF),
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          stripHtmlTags(tier.tierDescription ?? ""),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }

  Widget percentage() {
    final controller = Get.find<TierController>();

    return Obx(
      () {
        final tiersTarget = controller.tierData.value?.tiersTarget ?? [];
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tiersTarget.length,
          itemBuilder: (context, index) {
            final tier = tiersTarget[index];
            final double achievedPercentage = tier.achieved;

            Color progressColor;
            if (achievedPercentage <= 20) {
              progressColor = Colors.red;
            } else if (achievedPercentage <= 60) {
              progressColor = Colors.orange;
            } else {
              progressColor = const Color(0XFF2DA20D);
            }

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tier.kpiName,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text('${tier.percentage.toStringAsFixed(0)} %'),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: achievedPercentage / tier.target,
                  color: progressColor,
                  borderRadius: BorderRadius.circular(3),
                  minHeight: 5,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0'),
                    Text('100'),
                  ],
                ),
                const SizedBox(height: 5),
                CustomPaint(
                  painter: DottedLinePainter(color: Colors.grey),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }

  String stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}

class DottedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Paint _paint;

  DottedLinePainter({
    required Color color,
    this.dashWidth = 4.0,
    this.dashSpace = 4.0,
  }) : _paint = Paint()
          ..color = color
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    final double endX = size.width;

    while (startX < endX) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), _paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
