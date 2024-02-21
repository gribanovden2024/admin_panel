import 'package:admin_panel/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Admin Panel',
        theme: ThemeData.dark(),
        home: const LoginPage(),
      );
}
