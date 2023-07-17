import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebasechat/pages/application/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DrawerWidget extends GetView<ApplicationController>{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - 30,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: CachedNetworkImageProvider("${controller.profileData.photourl}")
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor: Colors.red,
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 10,),
                       Text(
                        controller.profileData.name??"",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(width: 2,),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                        color: Colors.black,
                      ),
                    ],
                  ),

                  const Icon(
                    Icons.settings,
                    color: Colors.blue,
                    size: 30,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child:const Icon(
                      CupertinoIcons.chat_bubble_fill,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),

                  const SizedBox(
                    width: 15,
                  ),

                  const Text(
                    'Đoạn chat',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child:const Icon(
                      Icons.store_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),

                  const SizedBox(
                    width: 15,
                  ),

                  const Text(
                    'MarketPlace',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child:const Icon(
                      CupertinoIcons.chat_bubble_text_fill,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),

                  const SizedBox(
                    width: 15,
                  ),

                  const Text(
                    'Tin nhắn đang chờ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child:const Icon(
                      Icons.folder_shared,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),

                  const SizedBox(
                    width: 15,
                  ),

                  const Text(
                    'Kho lưu trữ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 15,top: 10),
              child: Text(
                'Cộng đồng',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}