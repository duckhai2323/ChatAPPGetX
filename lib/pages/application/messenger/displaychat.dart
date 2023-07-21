import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../comcom/entities/msg.dart';
import '../../../comcom/entities/user.dart';
import 'controller.dart';

class DisplayChat extends GetView<MessController>{

  Widget ItemUser1 (Msg item){
    String token = UserStore.to.token;
    String? url;
    String? name;
    if(item.from_uid == token){
      url = item.to_avatar;
      name = item.to_name;
    } else {
      url = item.from_avatar;
      name = item.from_name;
    }
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: Colors.lightBlueAccent,
            child:Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 31,
                backgroundImage: CachedNetworkImageProvider(url??""),
              ),
            ) ,
          ),
          const Positioned(
            right: 3,
            bottom: 3,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Color(0xFF4CAF50),
              ),
            ),
          ),
        ],
      ),

      title: Text(
        name??"",
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),

      subtitle: Text(
        controller.MessAndTime(item),
        style: const TextStyle(
          color: Colors.grey,
          fontWeight:  FontWeight.bold,
        ),
      ),

      trailing: const CircleAvatar(
        radius: 7,
        backgroundColor: Colors.blue,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      margin: const EdgeInsets.only(right: 10,top: 5,bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: controller.listUser.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap:(){
              controller.ClickItemChat(controller.listUser[index]);
            } ,
              child: ItemUser1(controller.listUser[index]));
        },
      ),
    ),
    );
  }
}