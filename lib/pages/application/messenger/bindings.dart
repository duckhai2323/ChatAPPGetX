import 'package:firebasechat/pages/application/messenger/controller.dart';
import 'package:get/get.dart';

class MessBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => MessController());
  }
}