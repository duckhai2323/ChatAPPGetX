import 'package:firebasechat/pages/application/contact/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AppBarWidget extends GetView<ContactController>{

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          InkWell(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.menu_sharp,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),

                const Positioned(
                  top: 3,
                  right: 3,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Expanded(
            child:Center(
              child: Text(
                'Danh bạ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Icon(
            Icons.perm_contact_cal,
            color: Colors.blue,
            size: 30,
          ),
        ],
      ),
    );
  }
}