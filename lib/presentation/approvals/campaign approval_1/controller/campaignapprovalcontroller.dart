import 'package:file_picker/file_picker.dart';
import 'package:incentivesgit/core/app_export.dart';

class CampaignApprovalController extends GetxController {
  var isExpanded = false.obs;
  var isExpande = false.obs;

  // Method to toggle expansion state
  void toggleExpande() {
    isExpande.value = !isExpande.value;
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  Future<void> chooseFile() async {
    // Use file_picker to allow the user to pick a file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // File picked successfully, handle the selected file
      PlatformFile file = result.files.first;

      // Handle the selected file, e.g., save it to state or use it in your application
      print('File picked: ${file.name}');
    } else {
      // User canceled the file picking
      print('File picking canceled.');
    }
  }
}
