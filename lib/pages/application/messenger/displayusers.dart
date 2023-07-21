import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebasechat/pages/application/messenger/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayUserMess extends GetView<MessController>{

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Column(
              children: [
                InkWell(
                  onTap:(){
                  },
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.grey.shade200,
                    child:Icon(CupertinoIcons.plus,color: Colors.grey,),
                  ),
                ),

                const SizedBox(height: 10,),

                const Text(
                  'Your Story',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top:10,bottom:10),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.listUser1.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return InkWell(
                  onTap: (){
                    controller.ClickItem(controller.listUser1[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 34,
                              backgroundColor: Colors.lightBlueAccent,
                              child:Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  radius: 31,
                                  backgroundImage: CachedNetworkImageProvider(controller.listUser1[index].photourl??""),
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

                        const SizedBox(height: 10,),

                        Text(
                          controller.textContr(controller.listUser1[index].name??""),
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
    );
  }
}