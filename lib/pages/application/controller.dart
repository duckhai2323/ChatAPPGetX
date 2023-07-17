import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comcom/entities/user.dart';

class ApplicationController extends GetxController {
  ApplicationController();
  final state = 0.obs;
  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTab;
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;
  late UserData profileData;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    tabTitles = ['chat','Contact','Profile'];
    bottomTab = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble_fill,
          color: Colors.grey,
          size: 30,
        ),

        activeIcon: Icon(
          CupertinoIcons.chat_bubble_fill,
          color: Colors.lightBlueAccent,
          size: 30,
        ),
        label: 'Đoạn chat',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.video_camera_solid,
          color: Colors.grey,
          size: 36,
        ),

        activeIcon: Icon(
          CupertinoIcons.video_camera_solid,
          color: Colors.lightBlueAccent,
          size: 36,
        ),
        label: 'Cuộc gọi',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.contact_page,
          color: Colors.grey,
          size: 30,
        ),

        activeIcon: Icon(
          Icons.contact_page,
          color: Colors.lightBlueAccent,
          size: 30,
        ),
        label: 'Danh bạ',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.grey,
          size: 30,
        ),

        activeIcon: Icon(
          Icons.person,
          color: Colors.lightBlueAccent,
          size: 30,
        ),
        label: 'Cá nhân',
        backgroundColor: Colors.transparent,
      ),
    ];
    pageController = PageController(initialPage: state.value);

    var profile = await db.collection("users").where("id",isEqualTo: token).withConverter(
      fromFirestore: UserData.fromFirestore,
      toFirestore: (UserData userdata, options) => userdata.toFirestore()
    ).get();

    for(var doc in profile.docs){
      profileData = doc.data();
    }
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  void handPageChanged(int index) {
    state.value = index;
  }

  void handNavBarTap(int index) {
    pageController.jumpToPage(index);
  }
}