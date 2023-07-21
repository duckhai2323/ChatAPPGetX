import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasechat/comcom/entities/msg.dart';
import 'package:firebasechat/comcom/entities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../comcom/routes/names.dart';

class MessController extends GetxController{
  MessController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  ScrollController msgScrolling = ScrollController();
  final listUser = <Msg>[].obs;
  RxList<UserData> listUser1 = <UserData>[].obs;
  var listener;

  String textContr (String str){
    if(str.length >= 10){
      return str.substring(0,10);
    } else {
      return str;
    }
  }

  String MessAndTime(Msg msg){
    Timestamp? timestamp = msg.last_time;
    DateTime? dateTime = timestamp?.toDate();
    String timeString = '${dateTime?.hour.toString().padLeft(2, '0')}:${dateTime?.minute.toString().padLeft(2, '0')}';
    return "${msg.last_msg} . ${timeString}";
  }

  @override
  void onReady() async {
    super.onReady();

    var usersbase = await db.collection("users").where("id",isNotEqualTo: token).withConverter(
        fromFirestore: UserData.fromFirestore,
        toFirestore: (UserData userdata, options) => userdata.toFirestore()
    ).get();
    for(var doc in usersbase.docs){
      listUser1.add(doc.data());
    }

    var messData = db.collection("message").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).orderBy("last_time",descending: true);
    listUser.clear();
    listener = messData.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              if(change.doc.data()?.to_uid == token || change.doc.data()?.from_uid == token){
                listUser.insert(0, change.doc.data()!);
              }
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
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

  ClickItemChat(Msg msg) async {
    var messages = await db.collection("message").withConverter(
        fromFirestore:Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where("from_uid",isEqualTo:token).where("to_uid",isEqualTo: msg.to_uid).get();
    if(msg.from_uid == token){
      Get.toNamed(AppRoutes.Chat,parameters: {"to_uid": msg.to_uid??"","to_name":msg.to_name??"","to_avatar":msg.to_avatar??"","check_first":"true","doc_id":messages.docs.first.id??""});
    } else {
        Get.toNamed(AppRoutes.Chat,parameters: {"to_uid": msg.from_uid??"","to_name":msg.from_name??"","to_avatar":msg.from_avatar??"","check_first":"true","doc_id":messages.docs.first.id??""});
    }
  }

}