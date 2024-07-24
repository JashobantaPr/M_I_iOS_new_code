import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/commentsdata/controller/commentsdatacontroller.dart';

class CommentsDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommentsdataController());
  }
}
