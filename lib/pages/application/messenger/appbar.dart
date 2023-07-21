import 'package:firebasechat/pages/application/messenger/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessAppBar extends GetView<MessController>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20,right: 20,bottom: 15),
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
                'Đoạn Chat',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Icon(
            Icons.note_alt_outlined,
            color: Colors.blue,
            size: 30,
          ),
        ],
      ),
    );
  }
}