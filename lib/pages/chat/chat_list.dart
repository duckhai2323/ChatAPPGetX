import 'package:firebasechat/pages/chat/chat_right_item.dart';
import 'package:firebasechat/pages/chat/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../comcom/entities/user.dart';
import 'chat_left_item.dart';

class ChatList extends GetView<ChatController>{
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: CustomScrollView(
        controller: controller.msgScrolling,
        reverse: true,
        slivers: [
          SliverPadding(padding: EdgeInsets.all(0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index){
                    if(controller.listContent[index].uid == controller.user_id){
                      return ChatRightItem(controller.listContent[index].content.toString());
                    }else {
                      return ChatLeftItem(controller.listContent[index].content.toString(),controller.to_avatar.toString());
                    }
                  },
                childCount: controller.listContent.length,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}