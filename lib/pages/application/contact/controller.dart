import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasechat/comcom/entities/user.dart';
import 'package:get/get.dart';

import '../../../comcom/routes/names.dart';

class ContactController extends GetxController {
  RxList<UserData> listUser = <UserData>[].obs;
  ContactController();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onReady(){
    super.onReady();
    asyncLoadAllData();
  }

  asyncLoadAllData() async {
    var usersbase = await db.collection("users").where("id",isNotEqualTo: token).withConverter(
      fromFirestore: UserData.fromFirestore,
      toFirestore: (UserData userdata, options) => userdata.toFirestore()
    ).get();
    for(var doc in usersbase.docs){
      listUser.add(doc.data());
    }
  }
  
  void ClickItem(UserData to_user) {
    Get.toNamed(AppRoutes.Chat,parameters: {"to_uid": to_user.id??"","to_name":to_user.name??"","to_avatar":to_user.photourl??""});
  }
}