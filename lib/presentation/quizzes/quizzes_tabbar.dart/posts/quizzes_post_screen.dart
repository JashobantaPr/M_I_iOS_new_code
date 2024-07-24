import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/posts/controller/post_controller.dart';
import 'package:incentivesgit/theme/custom_text_style.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'widget/profiles.dart';

class QuizzePostScreen extends GetWidget<QuizzesPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildProfiles(),
            _buildPEPBehaviorQuiz(),
            _buildLikeComments(),
            _buildComments(),
          ],
        ),
      ),
    );
  }

  // Header section
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 10)),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: appTheme.redappbar,
                  width: 2,
                )),
            child: Image.asset(
              ImageConstant.quizePostimag,
              width: 10,
              height: 10,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Winner announcement for Quiz",
                style: CustomTextStyles.Headerblack_01,
              ),
              Row(
                children: [
                  Text("02 February 2024 04:45pm"),
                  // Image.asset(ImageConstant.postImage2)
                ],
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            size: 40,
          ),
        ],
      ),
    );
  }

  //profileSection

  Widget _buildProfiles() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(Get.context!).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.pink,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: _buildProfilesListView(),
    );
  }

  //ProfileListViewBuilder

  Widget _buildProfilesListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        physics: ScrollPhysics(),
        itemCount: 3,
        itemBuilder: ((context, index) {
          return ProfileChip();
        }));
  }
//PEP Behavior Quiz

  Widget _buildPEPBehaviorQuiz() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 20)),
          Text(
            "PEP Behavior Quiz",
            style: CustomTextStyles.Headerblack_01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              "Welcome to the PEP Behavior Quiz, designed to assess your understanding of key workplace PEP Behaviours: BEING PASSIONATE Showing pride and enthusiasm in everything we do GOING EXTRA MILE Doing what it takes to deliver GREAT results BEING PROFESSIONAL Taking ownership for the quality of see more",
              style: CustomTextStyles.Headerblack_02,
            ),
          )
        ],
      ),
    );
  }

  //Like Comments

  Widget _buildLikeComments() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "150",
                style: CustomTextStyles.Headerblack_01,
              ),
              Text(
                "Likes",
                style: CustomTextStyles.Headerblack_02,
              ),
              Spacer(),
              Text(
                "20",
                style: CustomTextStyles.Headerblack_01,
              ),
              Text(
                "Comments",
                style: CustomTextStyles.Headerblack_02,
              ),
            ],
          ),
          _buildDivider(),
          Row(
            children: [
              Icon(Icons.thumb_up_alt_outlined),
              Text("Like"),
              SizedBox(
                width: 45,
              ),
              Icon(Icons.comment_bank_outlined),
              Text("Comments")
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _buildDivider(),
        ],
      ),
    );
  }

  //Divider

  Widget _buildDivider() {
    return Divider(
      thickness: 2,
      color: appTheme.gray100,
    );
  }

  //Comments Part

  Widget _buildComments() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kalpita More",
                    style: CustomTextStyles.Headerblack_01,
                  ),
                  Text(
                    "congratulations",
                  ),
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text("|"),
                      Text("1 Like")
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
