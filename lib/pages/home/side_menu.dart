import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu(this.changePage,{super.key});
  final ValueSetter<String> changePage;
  @override
  Widget build(context) => Drawer(
      width: 190,
      child: ListView(
        children: [
          DrawerHeader(
            child: SvgPicture.asset("assets/notification.svg"),
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/menu_dashboard.svg",
            press: () {changePage.call('Notification');},
          ),
          DrawerListTile(
            title: "Deeplink",
            svgSrc: "assets/deeplink.svg",
            press: () {changePage.call('Deeplink');},
          ),
        ],
      ),
    );
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        // colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
