import 'package:admin_panel/pages/home/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_panel/constants.dart';
import 'package:admin_panel/controllers/MenuAppController.dart';
import 'package:admin_panel/responsive.dart';
import 'package:admin_panel/pages/notification_page/notification_page.dart';
import 'package:admin_panel/pages/page_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String page = 'Notification';

  Widget _buildPageWidget() {
    switch (page) {
      case "Notification":
        return const NotificationPage();
      case "Deeplink":
        return const Page2();
      default:
        return const NotificationPage();
    }
  }

  void changePage(String newPage) => setState(() => page = newPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(changePage),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context)) SideMenu(changePage),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                            icon: const Icon(Icons.menu),
                            iconSize: 50,
                            onPressed:
                                context.read<MenuAppController>().controlMenu)
                      else
                        const SizedBox(width: 50,height: 50,),
                      const Spacer(),
                      Text(page, style: defStyle),
                      const Spacer(),
                      const SizedBox(width: 50),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding),
                    child: _buildPageWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
