import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/model/rewards_landing_model.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/model/select_wallet_model.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/model/wallet_balance_model.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/service/rewards_landing_service.dart';

class RewardsController extends GetxController {
  var searchQuery = ''.obs;
  var product = <RewardsProduct>[].obs;
  var walletData = WalletTypesResponse(status: false, typeLists: []).obs;
  var isLoading = true.obs;
  var category = <String>[].obs;
  var pointcount = Rx<GetBudgetBalance?>(null);

  var selectedwallet = Rx<String?>('');
  var selectedcategory = Rx<String?>('');

  @override
  void onInit() {
    allRewardsProducts();
    selectwallet();
    selectcategorywallet();
    walletBalance();
    super.onInit();
  }

  void allRewardsProducts() async {
    isLoading.value = true;
    var allData = await RewardsProducts().allrewardsProduct();
    product.value = allData;
    isLoading.value = false;
  }

  void selectwallet() async {
    var allselectedwallet = await RewardsProducts().selectWallet();
    print('Selected Wallet: $allselectedwallet');
    walletData.value = allselectedwallet;
  }

  void selectcategorywallet() async {
    var selectedcategorywallet = await RewardsProducts().categorySelection();
    print('Selected Wallet: $selectedcategorywallet');
    category.value = selectedcategorywallet;
  }

  void walletBalance() async {
    try {
      var points = await RewardsProducts().addPoints();
      pointcount.value = points;
    } catch (e) {
      print('Error fetching wallet balance: $e');
    }
  }
}
