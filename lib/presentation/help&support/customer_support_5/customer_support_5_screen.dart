import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/controller/customer_support_5_controller.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/model/customer_support_5_model.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportCustomerSupport5Screen
    extends GetWidget<HelpandSupportCustomerSupport5Controller> {
  const HelpandSupportCustomerSupport5Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
            'View Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Obx(() {
          if (controller.ticketDetailsResponse.value == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 1,
            ));
          } else {
            var ticketDetails =
                controller.ticketDetailsResponse.value!.ticketDetails;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              color: const Color(0xFFF0F0F0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildHelpAndSupport(ticketDetails!),
                  SizedBox(height: 10),
                  _buildViewDetails(context, ticketDetails),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _buildHelpAndSupport(TicketDetails ticketDetails) {
    return Container(
      width: 340,
      height: 198,
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ticket Details',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          SizedBox(height: 8),
          _buildTicketDetails(
              'Ticket Id', ':', ticketDetails.ticketId ?? 'N/A'),
          _buildTicketDetails(
              'Request Name', ':', ticketDetails.requesterName ?? 'N/A'),
          _buildTicketDetails('Category', ':', ticketDetails.category ?? 'N/A'),
          _buildTicketDetails(
              'Assignee', ':', ticketDetails.assigneeName ?? 'N/A'),
          _buildTicketDetails(
              'Create Date', ':', ticketDetails.createdDate ?? 'N/A'),
          _buildTicketDetails1('Status', ':', ticketDetails.status ?? 'N/A'),
        ],
      ),
    );
  }

  Widget _buildTicketDetails(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 7.0),
      ],
    );
  }

  Widget _buildTicketDetails1(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  // Removed the conditional color logic from here
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  // Conditional color logic based on label2 value
                  color: label2.startsWith("O")
                      ? Colors.green
                      : label2.startsWith("C")
                          ? appTheme.redappbar
                          : Colors.yellow,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 7.0),
      ],
    );
  }

  String stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  Widget _buildViewDetails(BuildContext context, TicketDetails ticketDetails) {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          ticketDetails.subject,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              ticketDetails.requesterName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(width: 2),
            Text(
              '<${ticketDetails.email}>',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: appTheme.blue50,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          ticketDetails.createdDate,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: appTheme.black900,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        SizedBox(height: 25),
        Divider(
          color: appTheme.gray500,
          thickness: 1.0,
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: appTheme.redappbar, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        '${Url.profileimageUrl}${controller.profilePic.toString()}'),
                  ),
                ),
              );
            }),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticketDetails.requesterName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    stripHtmlTags(ticketDetails.description ?? ""),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: appTheme.greytextcolour,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {
                      if (ticketDetails.attachment.isNotEmpty) {
                        print(
                            'sdfgfgt${Url.profileimageUrl}${ticketDetails.attachment.first.name}');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Center(
                              child: Image.network(
                                '${Url.profileimageUrl}${ticketDetails.attachment.first.name}',
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text(
                                      'No Image Found',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.image,
                          size: 17,
                          color: appTheme.blue50,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          ticketDetails.attachment.isNotEmpty
                              ? ticketDetails.attachment.first.name
                              : 'No attachments',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: appTheme.blue50,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
