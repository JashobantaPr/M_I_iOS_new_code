import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/News/create_news/controller/create_news_controller.dart';

class CreateNewsScreen extends GetWidget<CreateNewsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 214, 213, 213),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              "Create News",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0XFFE41C39),
            iconTheme: const IconThemeData(color: Colors.white),
            leading: Padding(
              padding: const EdgeInsets.all(0),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: IconButton(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                _buildBuzzCard(context),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Preview',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBuzzCard(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Row(
                children: [
                  Text(
                    'Select Post Type',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Obx(
                  () => Radio(
                    value: 'existing',
                    groupValue: controller.selectedPostType.value,
                    onChanged: (value) {
                      controller.selectedPostType.value = value!;
                      controller.isSelected.value = true;
                    },
                  ),
                ),
                const Text(
                  'Create post in existing scope - Mumbai',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Obx(
                  () => Radio(
                    value: 'global',
                    groupValue: controller.selectedPostType.value,
                    onChanged: (value) {
                      controller.selectedPostType.value = value!;
                      controller.isSelected.value = false;
                    },
                  ),
                ),
                const Text(
                  'Create global post for all scopes',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Obx(
              () => Visibility(
                visible: controller.isSelected.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        Text(
                          'News Title',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Container(
                      width: 310,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD5D5D5)),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: ' Title ',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: 'plain',
                            groupValue: controller.selectedTextType.value,
                            onChanged: (value) {
                              controller.selectedTextType.value = value!;
                            },
                          ),
                        ),
                        const Text('Plain textbox'),
                        const SizedBox(width: 15),
                        Obx(
                          () => Radio(
                            value: 'rich',
                            groupValue: controller.selectedTextType.value,
                            onChanged: (value) {
                              controller.selectedTextType.value = value!;
                            },
                          ),
                        ),
                        const Text('Rich textbox'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => Container(
                        width: 310,
                        height: 128,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD5D5D5)),
                        ),
                        child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText:
                                controller.selectedTextType.value == 'plain'
                                    ? 'Enter your text...'
                                    : 'Enter your rich text...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Select image',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFD5D5D5)),
                            ),
                            child: Obx(
                              () => Center(
                                child: Text(
                                  controller.selectedFileName.value.isNotEmpty
                                      ? controller.selectedFileName.value
                                      : 'No file chosen',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () async => await controller.pickFile(),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Text(
                                  'Choose file',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Max file size up to 1MB',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
