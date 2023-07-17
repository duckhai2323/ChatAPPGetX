import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'controller.dart';

class ContactPage extends GetView<ContactController>{
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(right: 10,top: 5,bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: controller.listUser.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
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
                      backgroundImage: CachedNetworkImageProvider("${controller.listUser[index].photourl}"),
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
              controller.listUser[index].name??"",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),

            subtitle: const Text(
              "alo alo alo",
              style: TextStyle(
                color: Colors.grey,
                fontWeight:  FontWeight.bold,
              ),
            ),

            trailing: const CircleAvatar(
              radius: 7,
              backgroundColor: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}