import 'package:firebasechat/pages/application/contact/displayusers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'appbar.dart';
import 'controller.dart';

class ContactPage extends GetView<ContactController>{
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        AppBarWidget(),
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DisplayUsers(),
        ),
      ],
    );
  }
}