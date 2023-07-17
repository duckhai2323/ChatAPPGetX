import 'package:firebasechat/comcom/routes/names.dart';
import 'package:firebasechat/pages/welcome/state.dart';
import 'package:get/get.dart';

import '../../comcom/store/config.dart';

class WelcomeController extends GetxController{
  final state = WelcomeState();
  WelcomeController();
  void ChangedPage(int index) {
    state.index.value = index;
  }

  Future<void> HandleSigin() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}