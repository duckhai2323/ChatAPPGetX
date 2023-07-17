import 'package:firebasechat/pages/application/contact/controller.dart';
import 'package:get/get.dart';

class ContactBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
  }
}