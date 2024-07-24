import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/likesdata/model/likedatamodel.dart';
import 'package:incentivesgit/presentation/buzz_screens/likesdata/service/likedataservice.dart';

class LikedataController extends GetxController {
  RxList<UserDetails> userDetailsResponse = <UserDetails>[].obs;

  @override
  void onInit() {
    fetchAllLikes();
    super.onInit();
  }

  void fetchAllLikes() async {
    try {
      List<UserDetails> response = await LikerdataService().getAllLikes();
      userDetailsResponse.value = response;
    } catch (e) {
      print('Error fetching likes: $e');
    }
  }
}
