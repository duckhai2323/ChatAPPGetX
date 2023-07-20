import 'package:get/get.dart';

class ChatController extends GetxController{
  final String? to_uid = Get.parameters['to_uid']??"";
  final String? to_name = Get.parameters['to_name']??"";
  final String? to_avatar = Get.parameters['to_avatar']??"";
  final visible = RxBool(true);
}