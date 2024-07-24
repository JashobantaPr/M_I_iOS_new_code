import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/dropdown.dart';
import 'package:incentivesgit/presentation/rewards/product/controller/product_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customtextfield1.dart';

class ProductScreen extends GetWidget<ProductController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: _customAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bankData(),
                SizedBox(
                  height: 22.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                              appTheme.rediconbackground),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(138, 38))),
                      onPressed: () {},
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: appTheme.white,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Text(
        "Rewards",
        style: TextStyle(
          color: appTheme.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      backgroundColor: appTheme.rediconbackground,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageConstant.arrowback,
          width: 26.75.w,
          height: 19.76.h,
        ),
      ),
    );
  }

  Widget _bankData() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 19),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              ImageConstant.rewards,
              width: 82,
              height: 79,
              color: appTheme.redappbar,
            ),
          ),
          const SizedBox(height: 27),
          Text(
            'Cosco Super Basketball',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.cyan800,
            ),
          ),
          const SizedBox(height: 7),
          _buildDataRow('Reward Code', 'GV843'),
          _buildDataRow('Reward Value', '1,000 Points'),
          const SizedBox(height: 14),
          _countdata(),
          const SizedBox(height: 16),
          Text(
            'Select Wallet',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
          const SizedBox(height: 8),
          CustomDropdown<String?>(
            items: ['Common Wallet'],
            value: null,
            onChanged: (value) {},
            getLabel: (String? value) {
              return '$value';
            },
            hintText: 'All',
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: controller.toggleExpand,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Details',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600,
                  ),
                ),
                Obx(() => Icon(
                      controller.isExpanded.value
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      color: appTheme.greydownarrow,
                    ))
              ],
            ),
          ),
          Divider(
            color: appTheme.greydivider,
            indent: BorderSide.strokeAlignCenter,
          ),
          const SizedBox(height: 15),
          Obx(() => Visibility(
                visible: controller.isExpanded.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField1(
                      labelText: 'Address 1',
                      controller: controller.adress1Controller,
                      hintText: 'Enter',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomTextField1(
                      labelText: 'Address 2',
                      controller: controller.adress2Controller,
                      hintText: 'Enter',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown<String?>(
                                items: const [
                                  'India',
                                  'France',
                                  'USA',
                                  'Finalnd'
                                ],
                                value: null,
                                onChanged: (value) {},
                                getLabel: (String? value) {
                                  return '$value';
                                },
                                hintText: 'Select',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State',
                                style: TextStyle(
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown<String?>(
                                items: const [
                                  'Karnataka',
                                  'Maharashtra',
                                  'Telangana',
                                  'Kerala'
                                ],
                                value: null,
                                onChanged: (value) {},
                                getLabel: (String? value) {
                                  return '$value';
                                },
                                hintText: 'Select',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown<String?>(
                                items: const [
                                  'Hubli',
                                  'Hassan',
                                  'Mangalore',
                                  'Bangalore'
                                ],
                                value: null,
                                onChanged: (value) {},
                                getLabel: (String? value) {
                                  return '$value';
                                },
                                hintText: 'Select',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField1(
                                  labelText: 'Pincode',
                                  controller: controller.pincode12Controller,
                                  hintText: 'Enter',
                                  keyboardType: TextInputType.number)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          InkWell(
            onTap: controller.toggleExpand1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Delivery Details',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600,
                  ),
                ),
                Obx(() => Icon(
                      controller.isExpanded1.value
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      color: appTheme.greydownarrow,
                    ))
              ],
            ),
          ),
          Divider(
            color: appTheme.greydivider,
            indent: BorderSide.strokeAlignCenter,
          ),
          const SizedBox(height: 15),
          Obx(() => Visibility(
                visible: controller.isExpanded1.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField1(
                      labelText: 'Address 1',
                      controller: controller.adress11Controller,
                      hintText: 'Enter',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomTextField1(
                      labelText: 'Address 2',
                      controller: controller.adress12Controller,
                      hintText: 'Enter',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown<String?>(
                                items: const [
                                  'India',
                                  'France',
                                  'USA',
                                  'Finalnd'
                                ],
                                value: null,
                                onChanged: (value) {},
                                getLabel: (String? value) {
                                  return '$value';
                                },
                                hintText: 'Select',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State',
                                style: TextStyle(
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown<String?>(
                                items: const [
                                  'Karnataka',
                                  'Maharashtra',
                                  'Telangana',
                                  'Kerala'
                                ],
                                value: null,
                                onChanged: (value) {},
                                getLabel: (String? value) {
                                  return '$value';
                                },
                                hintText: 'Select',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown<String?>(
                                items: const [
                                  'Hubli',
                                  'Hassan',
                                  'Mangalore',
                                  'Bangalore'
                                ],
                                value: null,
                                onChanged: (value) {},
                                getLabel: (String? value) {
                                  return '$value';
                                },
                                hintText: 'Select',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField1(
                                  labelText: 'Pincode',
                                  controller: controller.pincode12Controller,
                                  hintText: 'Enter',
                                  keyboardType: TextInputType.number)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              backgroundColor: MaterialStatePropertyAll(
                                  appTheme.rediconbackground),
                              fixedSize: const MaterialStatePropertyAll(
                                  Size(223, 38))),
                          onPressed: () {},
                          child: Text(
                            'Use Last Delivery Address',
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: appTheme.white,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 24.h,
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: appTheme.greydivider,
            indent: BorderSide.strokeAlignCenter,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Cosco super basketball.',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Super rubber moulded basketball.',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Exceptional low wear and highly durable covers for all professional players.',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Color: Orange. Size: 7. Brand: Cosco.',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 90.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal),
              )),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _countdata() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Quantity',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.greytextcolour),
            ),
            SizedBox(
              width: 12.w,
            ),
            Container(
              height: 28,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[500]!),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: appTheme.redappbar,
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: appTheme.white,
                          size: 14,
                        ),
                        onPressed: controller.decrement,
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Obx(() => Text(
                              '${controller.count}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: appTheme.redappbar,
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: appTheme.white,
                          size: 14,
                        ),
                        onPressed: controller.increment,
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Total Points:',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w500,
                  color: appTheme.black600)),
          TextSpan(
              text: '1,000',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: appTheme.black600))
        ]))
      ],
    );
  }
}
