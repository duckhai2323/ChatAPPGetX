import 'package:firebasechat/comcom/middlewares/router_welcome.dart';
import 'package:firebasechat/comcom/routes/names.dart';
import 'package:firebasechat/pages/application/bindings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../pages/application/view.dart';
import '../../pages/chat/bindings.dart';
import '../../pages/chat/view.dart';
import '../../pages/signin/bindings.dart';
import '../../pages/signin/view.dart';
import '../../pages/welcome/bindings.dart';
import '../../pages/welcome/view.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),

    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
    ),

    GetPage(
      name: AppRoutes.Chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
  ];
}