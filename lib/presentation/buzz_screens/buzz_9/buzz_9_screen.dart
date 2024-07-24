import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/controller/buzz_9_controller.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/model/model.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/popmodel.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Buzz9Screen extends GetWidget<Buzz9Controller> {
  final Buzz9Controller buzz9Controller = Get.put(Buzz9Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: WillPopScope(
        onWillPop: () async {
          controller.cleardatacreatedbuzz();
          return true;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 214, 213, 213),
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: const Text(
                "Buzzz",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color(0XFFE41C39),
              iconTheme: const IconThemeData(color: Colors.white),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  controller.cleardatacreatedbuzz();
                  Get.back();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  _buildBuzzCard(context),
                  const SizedBox(width: 20),
                  Obx(
                    () => Visibility(
                      visible: buzz9Controller.isSelected.value.isNotEmpty,
                      child: _buttoncontainer(),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
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
        color: const Color(0XFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      'Select Post Type',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF383853),
                      ),
                    ),
                    Text(
                      '*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Obx(
                      () => Radio<String>(
                        value: 'SingleScope',
                        groupValue: buzz9Controller.isSelected.value,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          buzz9Controller.isSelected.value = value!;
                          print(buzz9Controller.isSelected.value);
                        },
                      ),
                    ),
                    const Text(
                      'Create post in existing scope - ',
                      style: TextStyle(
                        color: Color(0XFF191919),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${controller.scopeName}',
                      style: const TextStyle(
                        color: Color(0XFF191919),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Obx(
                      () => Radio<String>(
                        value: 'GlobalScope',
                        groupValue: buzz9Controller.isSelected.value,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          buzz9Controller.isSelected.value = value!;
                          print(buzz9Controller.isSelected.value);
                        },
                      ),
                    ),
                    const Text(
                      'Create global post for all scopes​',
                      style: TextStyle(
                        color: Color(0XFF191919),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: buzz9Controller.isSelected.value == 'SingleScope',
              child: singleScope(context),
            ),
          ),
          Obx(
            () => Visibility(
              visible: buzz9Controller.isSelected.value == 'GlobalScope',
              child: globalScope(context),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  //SingleScope
  Widget singleScope(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineTile(
            isFirst: true,
            isLast: false,
            title: '1',
            child: _buildStepCard1('Select User', context),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: false,
            title: '2',
            child: _buildStepCard2('Add Description', context),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: true,
            title: '3',
            child: _buildStepCard3('Select Behaviour'),
          ),
        ],
      ),
    );
  }

//GloberScope
  Widget globalScope(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineTile(
            isFirst: true,
            isLast: false,
            title: '1',
            child: _buildStepCard1('Select User', context),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: false,
            title: '2',
            child: _buildStepCard2('Add Description', context),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: true,
            title: '3',
            child: _buildStepCard3('Select Behaviour'),
          ),
        ],
      ),
    );
  }

// stepsTimeline Widget

  Widget _buildTimelineTile({
    required bool isFirst,
    required bool isLast,
    required String title,
    required Widget child,
  }) {
    int index = int.parse(title) - 1; // Convert title to index
    return Obx(
      () => TimelineTile(
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.start,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0.11,
          width: 35,
          height: 35,
          color: controller.stepsCompleted[index]
              ? const Color(0XFF017F00)
              : Colors.black12,
          indicator: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFFE4E4E4), width: 2),
              shape: BoxShape.circle,
              color: controller.stepsCompleted[index]
                  ? const Color(0XFF017F00)
                  : Colors.white,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: controller.stepsCompleted[index]
                      ? Colors.white
                      : const Color(0XFF191919),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        beforeLineStyle: LineStyle(
          color: controller.stepsCompleted[index]
              ? const Color(0XFF017F00)
              : Colors.grey,
          thickness: 1,
        ),
        afterLineStyle: LineStyle(
          color: controller.stepsCompleted[index]
              ? const Color(0XFF017F00)
              : Colors.grey,
          thickness: 1,
        ),
        endChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            child,
          ],
        ),
      ),
    );
  }

//Step-1
  Widget _buildStepCard1(String title, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(
            Radius.circular(1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                controller.isUserExpanded.value =
                    !controller.isUserExpanded.value;
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Color(0XFF191919),
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                    Obx(() {
                      return Icon(
                        controller.isUserExpanded.value
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.grey,
                      );
                    }),
                  ],
                ),
              ),
            ),
            Obx(() {
              return Visibility(
                visible: controller.isUserExpanded.value,
                child: Column(
                  children: [
                    const Divider(height: 1, color: Colors.black),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.search_outlined,
                              color: appTheme.greydownarrow,
                              size: 25,
                            ),
                            const SizedBox(width: 2),
                            Expanded(
                              child: TextField(
                                controller: controller.serchcontroller,
                                onChanged: (value) {
                                  controller.filterUsers(value);
                                  if (value.isNotEmpty) {
                                    _showModal(context);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search User',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w300),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(10),
                                ),
                                style: const TextStyle(color: Colors.black),
                                textAlignVertical: TextAlignVertical.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.selectedUsers.isEmpty) {
                        return const Center(child: Text(''));
                      } else {
                        return Column(
                          children: controller.selectedUsers.map((user) {
                            var userprofile =
                                'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080${user.profile}';

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.red, width: 1.5),
                                        ),
                                        child: ClipOval(
                                          child: Image.network(userprofile,
                                              width: 25.w,
                                              height: 25.h,
                                              fit: BoxFit.cover, errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                            return Container(
                                              width: 25.w,
                                              height: 25.h,
                                              color: Colors.white,
                                              child: const Icon(
                                                Icons.image_outlined,
                                                weight: 1,
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: SizedBox(
                                          width: 120,
                                          child: Text(
                                            '${user.firstName} ${user.lastName}',
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .removeUserFromSelection(user);
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.red,
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.close,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    }),
                  ],
                ),
              );
            }),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: appTheme.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset:
                        Offset(0, 3), // changes position of shadow to bottom
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//Step-2
  Widget _buildStepCard2(String title, context) {
    final Buzz9Controller controller = Get.put(Buzz9Controller());

    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      if (controller.selectedUsers.isNotEmpty) {
                        controller.isDescriptionExpanded.value =
                            !controller.isDescriptionExpanded.value;
                      }
                      controller.selectedRadio.value == 'Text';
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 3, bottom: 3, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  color: Color(0XFF191919),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                          Obx(
                            () => Icon(
                              controller.isDescriptionExpanded.value
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              size: controller.isDescriptionExpanded.value
                                  ? 30
                                  : 30,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: controller.isDescriptionExpanded.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Divider(height: 1, color: Colors.black),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Obx(
                                () => Radio<String>(
                                  activeColor: Colors.red,
                                  value: 'Text',
                                  groupValue: controller.selectedRadio.value,
                                  fillColor: const MaterialStatePropertyAll(
                                      Color(0XFFE21D39)),
                                  onChanged: (value) {
                                    if ((controller.selectedRadio.value !=
                                            value) &&
                                        (controller
                                                .discription.text.isNotEmpty ||
                                            controller.pickedFilePath.value
                                                .isNotEmpty)) {
                                      Get.dialog(
                                        CustommodelScreen(
                                          onConfirm: () {
                                            controller.removeAudioFile();
                                            controller.clearVideo();
                                            controller.selectedRadio.value =
                                                value!;
                                            Get.back();
                                          },
                                        ),
                                      );
                                    } else {
                                      controller.selectedRadio.value = value!;
                                    }
                                  },
                                ),
                              ),
                              const Text('Text',
                                  style: TextStyle(
                                    color: Color(0XFFE21D39),
                                  )),
                              const SizedBox(width: 20),
                              Radio(
                                activeColor: Colors.red,
                                value: 'Audio',
                                groupValue: controller.selectedRadio.value,
                                fillColor: const MaterialStatePropertyAll(
                                    Color(0XFFE21D39)),
                                onChanged: (value) {
                                  if ((controller.selectedRadio.value !=
                                          value) &&
                                      (controller.discription.text.isNotEmpty ||
                                          controller.pickedFilePath.value
                                              .isNotEmpty)) {
                                    Get.dialog(
                                      CustommodelScreen(
                                        onConfirm: () {
                                          controller.discription.clear();
                                          controller.clearVideo();
                                          controller.selectedRadio.value =
                                              value!;
                                          Get.back();
                                        },
                                      ),
                                    );
                                  } else {
                                    controller.selectedRadio.value = value!;
                                  }
                                },
                              ),
                              const Text('Audio',
                                  style: TextStyle(
                                    color: Color(0XFFE21D39),
                                  )),
                              const SizedBox(width: 20),
                              Radio(
                                activeColor: Colors.red,
                                value: 'Video',
                                groupValue: controller.selectedRadio.value,
                                fillColor: const MaterialStatePropertyAll(
                                    Color(0XFFE21D39)),
                                onChanged: (value) {
                                  if ((controller.selectedRadio.value !=
                                          value) &&
                                      (controller.discription.text.isNotEmpty ||
                                          controller.pickedFilePath.value
                                              .isNotEmpty)) {
                                    Get.dialog(
                                      CustommodelScreen(
                                        onConfirm: () {
                                          controller.discription.clear();
                                          controller.removeAudioFile();
                                          controller.selectedRadio.value =
                                              value!;
                                          Get.back();
                                        },
                                      ),
                                    );
                                  } else {
                                    controller.selectedRadio.value = value!;
                                  }
                                },
                              ),
                              const Text('Video',
                                  style: TextStyle(
                                    color: Color(0XFFE21D39),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: controller.selectedRadio.value == 'Text',
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                  ),
                                  child: TextField(
                                    controller: controller.discription,
                                    onChanged: (value) {
                                      controller.updateStepCompletion();
                                    },
                                    onEditingComplete: () {
                                      controller.updateStepCompletion();
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300),
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller.selectedRadio.value == 'Audio',
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              // Blinking Audio Icon
                                              if (controller
                                                  .isRecording.value) ...[
                                                AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                  child: const Icon(
                                                    Icons.mic,
                                                    color: Colors.red,
                                                    size: 30,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                              ],
                                              Text(
                                                controller.isRecording.value
                                                    ? '${controller.recordingDurationInSeconds.value} s'
                                                    : controller.pickedFilePath
                                                            .value.isEmpty
                                                        ? 'Audio'
                                                        : controller
                                                            .pickedFilePath
                                                            .value
                                                            .split('/')
                                                            .last,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onLongPressStart: (_) async {
                                      await controller.startRecording();
                                    },
                                    onLongPressEnd: (_) async {
                                      await controller.stopRecording();
                                    },
                                    child: const PopoveraudioButton(
                                        text:
                                            'Hold to record ,release to send.'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Obx(() {
                            return Visibility(
                              visible:
                                  controller.selectedRadio.value == 'Video',
                              child: Column(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Select Video',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(height: 1, color: Colors.black),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await controller.pickVideo();
                                        },
                                        child: Container(
                                          width: 102,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Center(
                                            child: Text('Upload Video',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await controller.recordVideo();
                                        },
                                        child: Container(
                                          width: 102,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Center(
                                            child: Text('Record Video',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      'While Uploading: Video size Max 20Mb, File Format MP4.\nWhile Recording: Video Length Max 60 Seconds.',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          Visibility(
                            visible:
                                controller.selectedRadio.value == 'Audio' &&
                                    controller.isRecording.value == false,
                            child: audioContainer(),
                          ),
                          Obx(() {
                            return Visibility(
                              visible:
                                  controller.selectedRadio.value == 'Video',
                              child: videoConatiner(),
                            );
                          }),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  }),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: appTheme.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(
                              0, 3), // changes position of shadow to bottom
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//Step-3
  Widget _buildStepCard3(String title) {
    final scrollController = Get.put(Buzz9Controller());

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      if (controller.discription.text != "" ||
                          controller.pickedFilePath.isNotEmpty ||
                          controller.videoPlayerController?.value != null) {
                        buzz9Controller.isBehaviourExpanded.value =
                            !buzz9Controller.isBehaviourExpanded.value;
                      } else {}
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 3, bottom: 3, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              controller.selectedUser.value.toString().isEmpty
                                  ? title
                                  : controller.selectedUser.value.toString(),
                              style: const TextStyle(
                                  color: Color(0XFF191919),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                          Icon(
                            buzz9Controller.isBehaviourExpanded.value
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: buzz9Controller.isBehaviourExpanded.value
                                ? 30
                                : 30, // Adjust sizes as needed
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: buzz9Controller.isBehaviourExpanded.value,
                    child: Column(
                      children: [
                        const Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          )),
                          child: Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              Scrollbar(
                                thickness: 20,
                                thumbVisibility: true,
                                trackVisibility: true,
                                controller: scrollController.scrollController,
                                child: ListView.builder(
                                  controller: scrollController.scrollController,
                                  itemCount: controller.behaviors.length,
                                  itemBuilder: (context, index) {
                                    final behavior =
                                        controller.behaviors[index];
                                    return GestureDetector(
                                      onTap: () {
                                        controller.selectUser(
                                            behavior.name, behavior.behaviorId);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 4),
                                              Text(
                                                behavior.name,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0XFF7B8191)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    scrollController.scrollUp();
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.arrow_drop_up,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    scrollController.scrollDown();
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.arrow_drop_down_outlined,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Buttom Container
  _buttoncontainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  color: buzz9Controller.isCancelTapped.value
                      ? const Color(0XFFE41C39)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextButton(
                  onPressed: () {
                    buzz9Controller.toggleCancel();
                  },
                  child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: buzz9Controller.isCancelTapped.value
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                // color: buzz9Controller.isBuzzTapped.value
                //     ? const Color(0XFFE41C39)
                //     : Colors.white,

                color: const Color(0XFFE41C39),

                borderRadius: BorderRadius.circular(3),
              ),
              child: TextButton(
                onPressed: () async {
                  await buzz9Controller.createBuzz();
                },
                child: const Text(
                  'Buzzz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // buzz9Controller.isBuzzTapped.value
                      //       ? Colors.white
                      //       : Colors.black,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget audioContainer() {
    return Obx(() {
      if (controller.pickedFilePath.value.isEmpty) {
        return const SizedBox();
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 4,
                ),
                // Play/Pause Button
                GestureDetector(
                  onTap: () {
                    if (controller.isAudioPlaying.value) {
                      controller.stopAudio();
                    } else {
                      controller.playRecording();
                    }
                  },
                  child: Obx(() => Icon(
                        controller.isAudioPlaying.value
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                        color: Colors.red,
                        size: 30,
                      )),
                ),

                // Slider and Time Duration
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Slider
                      Obx(() => Slider(
                            value:
                                controller.position.value.inSeconds.toDouble(),
                            max: controller.duration.value.inSeconds.toDouble(),
                            onChanged: (value) {
                              final position = Duration(seconds: value.toInt());
                              controller.player.seek(position);
                            },
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                          )),
                      // Time Duration
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Current Position
                            Obx(() => Text(
                                  controller.position.value
                                      .toString()
                                      .split('.')
                                      .first,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                )),
                            // Total Duration
                            Obx(() => Text(
                                  controller.duration.value
                                      .toString()
                                      .split('.')
                                      .first,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                // Remove Button
                GestureDetector(
                  onTap: () {
                    controller.removeAudioFile();
                  },
                  child: const Icon(
                    Icons.highlight_off,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 4,
                )
              ],
            ),
          ),
        );
      }
    });
  }

  Widget videoConatiner() {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: controller.chewieController != null &&
              controller.videoPlayerController!.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio:
                      controller.videoPlayerController!.value.aspectRatio,
                  child: Chewie(
                    controller: controller.chewieController!,
                  ),
                ),
                // Positioned(
                //   top: 10,
                //   left: 10,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(1),
                //       color: Colors.black,
                //     ),
                //     child: const Padding(
                //       padding: EdgeInsets.only(left: 20, right: 20),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.cut_outlined,
                //             size: 15,
                //             color: Colors.white,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'Trim ',
                //             style: TextStyle(color: Colors.white, fontSize: 18),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.only(bottom: 2),
                      icon: const Icon(Icons.clear, color: Colors.white),
                      onPressed: () {
                        controller.clearVideo();
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        '${controller.videoSizeMB.value!.toStringAsFixed(2)} MB',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        '${controller.videoDuration.value!.inSeconds} s',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: controller.isvideoPlaying.value
                              ? const Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                          onPressed: () {
                            if (controller.isvideoPlaying.value) {
                              controller.pauseVideo();
                            } else {
                              controller.playVideo();
                            }
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ],
            )
          : const Center(
              child: Text(''),
            ),
    );
  }

  void _showModal(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.white,
          content: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 400,
            color: Colors.white,
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.filteredUsers.length,
                itemBuilder: (context, index) {
                  var user = controller.filteredUsers[index];
                  var userProfile =
                      'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/${user.profile}';
                  return GestureDetector(
                    onTap: () {
                      controller.addUserToSelection(user);
                      Navigator.of(context)
                          .pop(); // Close the modal after selection
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.red, width: 1.5),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  userProfile,
                                  width: 25.w,
                                  height: 25.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 25.w,
                                      height: 25.h,
                                      color: Colors.white,
                                      child: const Icon(
                                        Icons.image_outlined,
                                        size: 24,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user.firstName} ${user.lastName}',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Location: ${user.email ?? 'N/A'}',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }

  // void showOverlay(BuildContext context, TapDownDetails details) {
  //   final overlay = Overlay.of(context);
  //   final renderBox = context.findRenderObject() as RenderBox;
  //   final offset = renderBox.localToGlobal(details.globalPosition);

  //   controller.overlayEntry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       bottom: offset.dy - 250,
  //       left: offset.dx - 150,
  //       child: Material(
  //         color: Colors.transparent,
  //         child: Container(
  //           padding: const EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //             color: Colors.black,
  //             borderRadius: BorderRadius.circular(5),
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Colors.black26,
  //                 blurRadius: 10,
  //                 offset: Offset(2, 2),
  //               ),
  //             ],
  //           ),
  //           child: const Text(
  //             'Hold to record ,release to send.',
  //             style: TextStyle(fontSize: 16, color: Colors.white),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  //   overlay.insert(controller.overlayEntry!);
  // }

  // void _removeOverlay() {
  //   controller.overlayEntry?.remove();
  //   controller.overlayEntry = null;
  // }
}
