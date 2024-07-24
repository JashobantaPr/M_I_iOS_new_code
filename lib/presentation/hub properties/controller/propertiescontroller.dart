import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/hub%20properties/module/propertiesmodule.dart';
import 'package:incentivesgit/presentation/hub%20properties/service/propertiesservice.dart';

class HubPropertiesController extends GetxController{
  var hubProperties = Document().obs; // Make claimData observable

  @override
  void onInit() {
    super.onInit();
    fetchHubProperties();
  }

 void fetchHubProperties() async {
  try {
    var claimDetails = await HubPropetiesService().hubproperties();
    if (claimDetails != null) {
      hubProperties.value = claimDetails; // Update the value
      // You might want to print some properties of the fetched document here
      print('Document Type: ${claimDetails.docType}');
      print('Document Name: ${claimDetails.documentName}');
    } else {
      print('claimDetails is null');
    }
  } catch (e) {
    print('Error fetching claim: $e');
  }
}

}