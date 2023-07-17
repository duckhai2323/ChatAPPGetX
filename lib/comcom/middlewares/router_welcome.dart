import 'package:firebasechat/comcom/entities/user.dart';
import 'package:firebasechat/comcom/routes/names.dart';
import 'package:firebasechat/comcom/store/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;
  RouteWelcomeMiddleware({required this.priority});
  @override
  RouteSettings? redirect(String? route){
    if(!ConfigStore.to.isFirstOpen){
      return null;
    } else {
      if(UserStore.to.isLogin){
        return const RouteSettings(name: AppRoutes.Application);
      } else {
        return const RouteSettings(name: AppRoutes.SIGN_IN);
      }
    }
  }
}