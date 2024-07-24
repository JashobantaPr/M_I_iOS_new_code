import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/controller/customersupport_1_controller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:permission_handler/permission_handler.dart';

import 'models/list_user_ticket_model.dart';

class CustomerSupport1Screen extends GetWidget<CustomerSupport1Controller> {
  const CustomerSupport1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: appTheme.background,
          appBar: _customAppBar(),
          body: Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  pointsData(),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: _buildNewTicketButton(context),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(child: listData(context)),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
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
        'All Modules',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 18.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget pointsData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: OptionCard(
                  imagePath: ImageConstant.totalTickets,
                  points: controller.parsePoints(
                      controller.ticketSummary.value.total.toString()),
                  text: 'Total No. of Tickets',
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: OptionCard(
                  imagePath: ImageConstant.openTicket,
                  points: controller.parsePoints(
                      controller.ticketSummary.value.open.toString()),
                  text: 'Open Tickets',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: OptionCard(
                  imagePath: ImageConstant.closeTicket,
                  points: controller.parsePoints(
                      controller.ticketSummary.value.closed.toString()),
                  text: 'Closed Tickets',
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: OptionCard(
                  imagePath: ImageConstant.unholdTickets,
                  points: controller.parsePoints(
                      controller.ticketSummary.value.onhold.toString()),
                  text: 'On Hold Tickets',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewTicketButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: TextButton(
        onPressed: () {
          Get.toNamed(AppRoutes.helpandsupportcustomersupport2);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(appTheme.redappbar),
          maximumSize: MaterialStateProperty.all<Size>(Size(135.w, 40.h)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              'New Ticket',
              style: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 104.w,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  color: appTheme.black900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow1(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 104.w,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  color: value.startsWith("O")
                      ? Colors.green
                      : value.startsWith("C")
                          ? appTheme.redappbar
                          : Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listData(BuildContext context) {
    return Obx(() {
      if (controller.tickets.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
            strokeWidth: 2,
          ),
        );
      } else {
        return ListView.builder(
          itemCount: controller.tickets.length,
          itemBuilder: (context, index) {
            UserTicket ticket = controller.tickets[index];
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: ticket.status.startsWith("O")
                            ? Colors.green
                            : ticket.status.startsWith("C")
                                ? appTheme.redappbar
                                : Colors.yellow,
                        width: 4,
                      ),
                    ),
                    color: appTheme.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildDataRow('Ticket Id', ticket.ticketId),
                          ),
                          PopupMenuButton<String>(
                            position: PopupMenuPosition.under,
                            offset: const Offset(-13, 0),
                            onSelected: (String value) {
                              if (value == 'view_details') {
                                print('ticketidddd${ticket.ticketNumber}');
                                Get.toNamed(
                                  AppRoutes.helpandsupportcustomersupport5,
                                  arguments: {'ticketId': ticket.ticketNumber},
                                );
                              } else if (value == 'edit') {
                                print('ticketidddd${ticket.ticketNumber}');
                                Get.toNamed(
                                  AppRoutes.editticket,
                                  arguments: {'ticketId': ticket.ticketNumber},
                                );
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              List<PopupMenuEntry<String>> menuItems = [
                                PopupMenuItem<String>(
                                  height: 25,
                                  textStyle: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: appTheme.black600,
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 40, top: 8, bottom: 8),
                                  value: 'view_details',
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: appTheme.black900,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ),
                              ];

                              // Add the 'Edit' option if the status starts with 'O' or any other status except 'C'
                              if (ticket.status.startsWith("O") ||
                                  !ticket.status.startsWith("C")) {
                                menuItems.add(
                                  PopupMenuItem<String>(
                                    height: 25,
                                    textStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: appTheme.black600,
                                    ),
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 40, top: 8, bottom: 8),
                                    value: 'edit',
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: appTheme.black900,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return menuItems;
                            },
                            icon: SvgPicture.asset(ImageConstant.morevert),
                          ),
                        ],
                      ),
                      _buildDataRow('Assignee', ticket.assignee),
                      _buildDataRow('Create Date', ticket.createdDate),
                      _buildDataRow1('Status', ticket.status),
                    ],
                  ),
                ),
                const SizedBox(height: 4), // Add this SizedBox for space
              ],
            );
          },
        );
      }
    });
  }
}
