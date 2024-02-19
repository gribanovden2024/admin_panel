import 'package:flutter/material.dart';

import '../pages/notification_page/notification_page.dart';
import '../pages/page_2.dart';

class ContextAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey get scaffoldKey => _scaffoldKey;
  late Widget _pages;
  Widget get pages => _pages;
  void controlContext(String str) {
    if (str == '1') {
      _pages = const NotificationPage();
    }
    else {
      _pages = const Page2();
    }
  }
}
