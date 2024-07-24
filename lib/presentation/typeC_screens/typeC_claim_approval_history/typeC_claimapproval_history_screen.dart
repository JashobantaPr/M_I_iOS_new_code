import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_claim_approval_history/controller/typeC_claimapproval_history_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/image_constant.dart';

class ClaimApprovalScreen extends GetWidget<ClaimApprovalController> {
  const ClaimApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 7, 7, 7),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              "Approval History",
              style: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
            backgroundColor: const Color(0XFFE41C39),
            iconTheme: const IconThemeData(color: Colors.white),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.arrowback,
                width: 26.75.w,
                height: 19.76.h,
              ),
            ),
          ),
          body: Container(
            color: const Color(0xFFF0F0F0),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                          color: appTheme.black900,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Approval workflow type: ',
                            style: TextStyle(
                              color: appTheme.black900,
                              fontWeight: FontWeight.normal,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Approval does not go through all levels if any one rejects.',
                            style: TextStyle(
                              color: appTheme.black900,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildApprovalHistory(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildApprovalHistory() {
    return Obx(() {
      if (controller.allClaims.isEmpty) {
        return const Center(child: Text("No approval history available"));
      }

      return ListView.builder(
        itemCount: controller.allClaims.length,
        itemBuilder: (context, index) {
          final claim = controller.allClaims[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(left: BorderSide(color: Colors.red,width: 4))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'L1 Approval',
                      style: TextStyle(
                        color: appTheme.cyan800,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    Spacer(),
                    // Text(claim.status ?? ''),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(color: appTheme.gray10002, thickness: 1),
                const SizedBox(height: 10),
                _buildDetailRow('Approver Name', claim.approverName ?? 'N/A'),
                const SizedBox(height: 5),
                _buildDetailRow('Approver Status', claim.status ?? 'N/A'),
                const SizedBox(height: 5),
                // _buildDetailRow('Date of approval', claim.updatedAt ?? 'N/A'),
                _buildDetailRow(
                    'Date of approval',
                    claim.updatedAt != null
                        ? DateFormat('dd-MM-yyyy')
                            .format(DateTime.parse(claim.updatedAt))
                        : 'N/A'),
                const SizedBox(height: 5),
                // _buildDetailRow('Approval workflow type',
                //     claim.approvalWorkflowTypeId ?? 'N/A'),
                _buildDetailRow('Comments', claim.approverComment ?? 'N/A'),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            title,
            style: TextStyle(
                color: appTheme.cyan800,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12),
          ),
        ),
        const Text(":"),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                color: appTheme.cyan800,
                fontWeight: FontWeight.bold,
                fontSize: 12),
            // overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
