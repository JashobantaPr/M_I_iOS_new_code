import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/Approvals/campaign%20approval_1/controller/campaignapprovalcontroller.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/dropdown.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ApprovalCampaignApprovalScreen
    extends GetWidget<CampaignApprovalController> {
  final CampaignApprovalController controller =
      Get.find<CampaignApprovalController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: appTheme.redappbar),
    );

    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Container(
            width: 1.sw,
            child: Padding(
              padding: EdgeInsets.all(14.0.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCampaignDetailsBox(),
                    Obx(() => controller.isExpanded.value
                        ? Column(
                            children: [
                              SizedBox(height: 10.h),
                              _buildOrderContainer(),
                            ],
                          )
                        : SizedBox.shrink()),
                    SizedBox(height: 15.h),
                    _buildCampaignDetailsBox1(),
                    SizedBox(height: 10.h),
                    Obx(() => controller.isExpande.value
                        ? _buildExpandedContent(context)
                        : SizedBox.shrink()),
                    SizedBox(height: 10.h),
                    _buildCommentsSection(),
                    _buildActionButtons(),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
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
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Approvals',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsBox(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 330.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(3.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF383853),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 30,
              color: Color(0xFF383853),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignDetailsBox() {
    return _buildDetailsBox(
        'Campaign Details', () => controller.toggleExpanded());
  }

  Widget _buildOrderContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 242, 242),
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader1('Campaign Stakeholder'),
          SizedBox(height: 10.h),
          _buildBudgetHistory('Order placed on', ':', '6-04-2020'),
          SizedBox(height: 2.h),
          _buildBudgetHistory(
              'Order id', ':', 'Recognition for Going Extra Mile'),
          SizedBox(height: 2.h),
          _buildBudgetHistory('Quantity', ':', 'Chetana Shelar'),
          SizedBox(height: 2.h),
          _buildBudgetHistory('Wallet Name', ':', '300'),
          SizedBox(height: 5.h),
          _buildSectionHeader1('UI Configurations'),
          SizedBox(height: 10.h),
          _buildBudgetHistory('Campaign Banner', ':', 'Some Banner Info'),
          SizedBox(height: 2.h),
          _buildBudgetHistory('Campaign Landing Page banner for stakeholders',
              ':', 'Wazix - 1,WazirX - 2'),
          SizedBox(height: 5.h),
          _buildSectionHeader1('Campaign Budget'),
          SizedBox(height: 10.h),
          _buildBudgetHistory('Select Sponsor', ':', 'Some Banner Info'),
          SizedBox(height: 2.h),
          _buildBudgetHistory(
              'Total Tentitive Budget', ':', 'Wazix - 1,WazirX - 2'),
          SizedBox(height: 2.h),
          _buildBudgetHistory('Budget PO Mapped', ':', 'Some Banner Info'),
          SizedBox(height: 5.h),
          _buildSectionHeader1('Participant Wallet & Rewards'),
          SizedBox(height: 10.h),
          _buildBudgetHistory(
              'Participant Wallet Type', ':', 'Wazix - 1,WazirX - 2'),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildBudgetHistory(String label1, String separator, String label2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150.w, // Adjust the width as needed
          child: Text(
            label1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
        ),
        Text(
          separator,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            label2,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignDetailsBox1() {
    return _buildDetailsBox('Claim Form', () => controller.toggleExpande());
  }

  Widget _buildExpandedContent(BuildContext context) {
    return Container(
      width: 330.w,
      decoration: BoxDecoration(
        color: appTheme.grey500,
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _buildSectionHeader1('Basic Details'),
          _buildFormField(context, 'Enter the Invoice number'),
          _buildFormField(context, 'Select the sku'),
          _buildFormField(context, 'Enter the quantity of incentives Claim *'),
          _buildAttachmentField(context),
          SizedBox(
            height: 20,
          ),
          _buildSectionHeader1('Business Hierarchy'),
          _buildFormField1(context, 'Country'),
          _buildFormField1(context, 'State'),
          _buildFormField1(context, 'City'),
          SizedBox(
            height: 20,
          ),
          _buildSectionHeader1('Other Fields'),
          _buildFormField(context, 'Name'),
          _buildFormField2(context, 'Date'),
          _buildFormField1(context, 'Select Purchased Product'),
          _buildAttachmentField(context),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader1(String title) {
    return Text(
      title,
      textAlign: TextAlign.left, // Align text to the left
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: Colors.black,
      ),
    );
  }

  Widget _buildFormField(BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                '*',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField1(BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                '*',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          CustomDropdown<String?>(
            backgroundColor: appTheme.white,
            hintText: 'Select',
            items: const [
              'All',
              'Common wallet',
              'Type B7 Level 1',
              'Type B7 Level 2',
              'Type B7 Level 3',
              'Type c 201 Type B 504'
            ],
            value: null,
            onChanged: (Value) {},
            getLabel: (String? value) {
              return '$value';
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFormField2(BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                '*',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 5.0),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      // Do something with the picked date
                      print("Selected date: ${pickedDate.toLocal()}"
                          .split(' ')[0]);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Attach the claim Proof (Invoice Copy)',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
              Text(
                '*',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 5.0),
                      hintText: 'No file chosen',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => controller.chooseFile(),
                    child: Container(
                      height: 48,
                      color: const Color(0XFFE41C39),
                      child: Center(
                        child: Text(
                          'Choose File',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comments * :',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF383853),
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          width: 330.w,
          height: 110.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Enter your comments here',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton('Reject', Colors.white, Color(0xFF7B8191)),
          _buildActionButton('Approve', Colors.red, Colors.white),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, Color bgColor, Color textColor) {
    return Container(
      width: 98.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: bgColor,
        border: bgColor == Colors.white
            ? Border.all(color: textColor, width: 1.0)
            : null,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextButton(
        onPressed: () {
          // Handle action
        },
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
    );
  }
}
