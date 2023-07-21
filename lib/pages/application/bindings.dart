import 'package:firebasechat/pages/application/contact/bindings.dart';
import 'package:firebasechat/pages/application/controller.dart';
import 'package:firebasechat/pages/application/messenger/controller.dart';
import 'package:get/get.dart';

import 'contact/controller.dart';

class ApplicationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => ContactController());
    Get.lazyPut(() => MessController());
  }
}