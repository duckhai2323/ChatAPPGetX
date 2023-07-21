import 'package:firebasechat/pages/chat/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

Widget ChatRightItem (String contentStr){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 300,
          minHeight: 40,
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 15,top: 10),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18)
            ),
          ),
          child: Text(
            contentStr??"",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ],
  );
}