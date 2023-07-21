import 'package:firebasechat/pages/application/messenger/appbar.dart';
import 'package:firebasechat/pages/application/messenger/controller.dart';
import 'package:firebasechat/pages/application/messenger/displaychat.dart';
import 'package:firebasechat/pages/application/messenger/displayusers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MessPage extends GetView<MessController>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MessAppBar(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(left: 5),
          width: MediaQuery.of(context).size.width,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.grey.shade100,
          ),
          child:const Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),

              SizedBox(width: 10,),

              Text(
                'Search',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        DisplayUserMess(),
        DisplayChat(),
      ],
    );
  }
}