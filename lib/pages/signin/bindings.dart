import 'package:firebasechat/pages/signin/controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}