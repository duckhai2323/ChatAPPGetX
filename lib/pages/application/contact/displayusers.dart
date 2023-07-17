import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebasechat/pages/application/contact/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayUsers extends GetView<ContactController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10,top: 10,bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: controller.listUser.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.lightBlueAccent,
                        child:Padding(
                          padding: const EdgeInsets.all(3),
                          child: CircleAvatar(
                            radius: 28,
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

                  trailing: const CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(left: 95.0),
                  child: Divider(color: Colors.grey,height: 1,),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}