import 'package:firebasechat/pages/chat/controller.dart';
import 'package:get/get.dart';

class ChatBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}