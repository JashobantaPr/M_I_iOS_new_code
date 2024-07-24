import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/controller/buzz_28_controller.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/model/taggedusers_model.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class Buzz28Screen extends GetWidget<Buzz28Controller> {
  const Buzz28Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Buzz28Controller());
    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
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
          title: Text(
            'Award Points',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          } else if (controller.taggedData.value == null) {
            return const Center(child: Text('No data available'));
          } else {
            return _mainBuilder();
          }
        }),
      ),
    );
  }

  Widget _mainBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: _buildBalancePoints(),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: _buildAwardPoints(),
        ),
        _buildButtons(),
      ],
    );
  }

  Widget _buildBalancePoints() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Balance Points Budget:',
          style: TextStyle(
            color: appTheme.black900,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(width: 5.w),
        Obx(
          () => Text(
            '${controller.budgetData.value.totalMybudgetBalance}',
            style: TextStyle(
              color: appTheme.black900,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAwardPoints() {
    var usersAwards =
        controller.taggedData.value?.usersAwards?.values.toList() ?? [];

    if (usersAwards.isEmpty) {
      return const Center(child: Text("No awards data available."));
    }

    controller.controllers =
        List.generate(usersAwards.length, (_) => TextEditingController());

    for (var textController in controller.controllers) {
      textController.addListener(() {
        if (controller.valid.value == false) {
          controller.valid.value = true;
        }
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: usersAwards.map((taggedUser) {
          var postPoint = controller.taggedData.value?.postPoints?.firstWhere(
            (element) => element.cmsuserIDTo == taggedUser.userIdPk,
            orElse: () => PostPoint(deductedPoints: '0', cmsuserIDTo: ''),
          );

          var deductedPoints = postPoint?.deductedPoints ?? '0';
          int index = usersAwards.indexOf(taggedUser);
          var textController = controller.controllers[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: const Color(0xFFE21D39),
                    backgroundImage: taggedUser.profile != null
                        ? Image.network(
                            '${Url.profileimageUrl}${taggedUser.profile!}',
                            fit: BoxFit.cover,
                          ).image
                        : const AssetImage('assets/default_profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      Text(
                        '${taggedUser.firstName ?? ''} ${taggedUser.lastName ?? ''}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: appTheme.cyan800,
                          fontSize: 14,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 79,
                    height: 40,
                    child: TextField(
                      controller: textController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appTheme.grey500),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: appTheme.grey500),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        isDense: true,
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Previously awarded points: ',
                        style: TextStyle(
                            color: appTheme.redappbar,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                      TextSpan(
                        text: deductedPoints,
                        style: TextStyle(
                            color: appTheme.redappbar,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Color.fromARGB(255, 199, 196, 196),
                thickness: 1,
                height: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                String message;
                if (!controller.valid.value) {
                  if (controller.controllers
                      .any((controller) => controller.text.isEmpty)) {
                    message = 'Points is required';
                  } else {
                    message =
                        'Points assigned should be less or equal to budget';
                  }
                } else {
                  message = '';
                }
                return Text(
                  message,
                  style: TextStyle(
                    color: appTheme.redappbar,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12,
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.white),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: appTheme.greydivider)),
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: appTheme.black600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                var total = controller.budgetData.value.totalMybudgetBalance;

                for (var entereddata in controller.controllers) {
                  double enteredPoints =
                      double.tryParse(entereddata.text) ?? 0.0;
                  if (enteredPoints <= 0 || enteredPoints > total) {
                    controller.valid.value = false;
                    break;
                  }
                }
                if (controller.valid.value) {
                  controller.createAwardPoints();
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.redappbar),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
              child: const Text('Award'),
            ),
          ],
        ),
      ],
    );
  }
}
