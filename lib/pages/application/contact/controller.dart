import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasechat/comcom/entities/user.dart';
import 'package:get/get.dart';
import '../../../comcom/entities/msg.dart';
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
  
  ClickItem(UserData to_user) async {
    String checkFist = 'false';
    String doc_id="";

    var from_messages = await db.collection("message").withConverter(
      fromFirestore:Msg.fromFirestore,
      toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where(
      "from_uid", isEqualTo: token
    ).where("to_uid",isEqualTo: to_user.id).get();

    var to_messages = await db.collection("message").withConverter(
        fromFirestore:Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where(
        "from_uid", isEqualTo: to_user.id
    ).where("to_uid",isEqualTo: token).get();

    if(from_messages.docs.isNotEmpty || to_messages.docs.isNotEmpty){
      checkFist = 'true';
      if(from_messages.docs.isNotEmpty){doc_id = from_messages.docs.first.id;}
      if(to_messages.docs.isNotEmpty){doc_id = to_messages.docs.first.id;}
    }
    Get.toNamed(AppRoutes.Chat,parameters: {"to_uid": to_user.id??"","to_name":to_user.name??"","to_avatar":to_user.photourl??"","check_first":checkFist??"","doc_id":doc_id??""});
  }

}