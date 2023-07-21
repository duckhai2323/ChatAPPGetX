import 'package:firebasechat/pages/application/controller.dart';
import 'package:firebasechat/pages/application/messenger/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'contact/view.dart';
import 'drawer.dart';

class ApplicationPage extends GetView<ApplicationController>{

  @override
  Widget build(BuildContext context) {
    Widget buildPageView(){
      return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handPageChanged,
        children: [
          MessPage(),
          Center(child: Text('danh ba'),),
          ContactPage(),
          Center(child: Text('profile'),),
        ],
      );
    }

    Widget BottomNavigation(){
      return Obx(()=>BottomNavigationBar(
        items: controller.bottomTab,
        currentIndex: controller.state.value,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handNavBarTap,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: buildPageView(),
        drawer: DrawerWidget(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}