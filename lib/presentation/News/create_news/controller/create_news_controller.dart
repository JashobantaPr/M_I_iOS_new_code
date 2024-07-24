import 'package:file_picker/file_picker.dart';
import 'package:incentivesgit/core/app_export.dart';

class CreateNewsController extends GetxController {
  var isSelected = false.obs;
  var selectedPostType = 'global'.obs; // Set default value to 'global'
  var selectedTextType = 'plain'.obs;
  var selectedFileName = ''.obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      selectedFileName.value = result.files.single.name;
    } else {
      selectedFileName.value = 'No file chosen';
    }
  }
}
