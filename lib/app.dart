import 'package:admin_panel/pages/home/home_page.dart';
import 'package:admin_panel/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/MenuAppController.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Admin Panel',
        theme: ThemeData.dark(),
        home: const LoginPage(),
      );
}
