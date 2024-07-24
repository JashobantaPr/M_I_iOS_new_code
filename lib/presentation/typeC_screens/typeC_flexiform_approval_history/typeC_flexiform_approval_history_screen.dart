import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_approval_history/controller/typeC_flexiform_approval_history_controller.dart';

class FlexiFormApprovalScreen extends GetWidget<FlexiFormApprovalController> {
  const FlexiFormApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 7, 7, 7),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            "Approval History",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 14.76.h,
            ),
          ),
        ),
        body: Container(
          color: const Color(0xFFF0F0F0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildApprovalHistory(),
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
          final approverEmail = claim.approverEmail;
          final approverDetails = controller.approverDetails[approverEmail];

          final approverName = approverDetails != null
              ? '${approverDetails.firstName} ${approverDetails.lastName}'
              : 'N/A';

          return Container(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'L1 Approval',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(claim.status ?? ''),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Color(0xFFD5D5D5), thickness: 1),
                const SizedBox(height: 10),
                _buildDetailRow('Approver Name', approverName),
                _buildDetailRow('Approver Status', claim.status ?? 'N/A'),
                _buildDetailRow(
                    'Date of Approval', claim.updatedAt?.toString() ?? 'N/A'),
                _buildDetailRow('Approval Workflow Type',
                    claim.approvalWorkflowTypeId ?? 'N/A'),
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
            style: const TextStyle(color: Color(0xFF383853)),
          ),
        ),
        const Text(":"),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis, // To prevent overflow issues
            maxLines: 2, // Ensure text wraps to the next line if too long
          ),
        ),
      ],
    );
  }
}
