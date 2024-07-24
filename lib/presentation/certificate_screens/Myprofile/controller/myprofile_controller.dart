import 'package:get/get.dart';
import 'package:incentivesgit/presentation/certificate_screens/Myprofile/module/myprofilemodule.dart';
import 'package:incentivesgit/presentation/certificate_screens/Myprofile/service/myProfile_service.dart';

class MyProfileController extends GetxController {
  var selectedOption1 = false.obs;
  var selectedOption2 = false.obs;
  var myProfile = Rxn<ProfileData>();

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  // Fetch profile data from the ProfileService and update the state
  void fetchProfile() async {
    try {
      var fetchedProfile = await ProfileService().getProfile();
      if (fetchedProfile != null) {
        myProfile.value = fetchedProfile;
      }
    } catch (e) {
      print("Exception during API call: $e");
    }
  }

  // Update the state for selected option 1 and ensure option 2 is deselected
  void selectOption1(bool value) {
    selectedOption1.value = value;
    if (value) selectedOption2.value = false;
  }

  // Update the state for selected option 2 and ensure option 1 is deselected
  void selectOption2(bool value) {
    selectedOption2.value = value;
    if (value) selectedOption1.value = false;
  }
}
