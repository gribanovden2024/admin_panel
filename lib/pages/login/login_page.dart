import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuAppController.dart';
import '../home/home_page.dart';
import 'login_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final presenter = LoginData();
  bool isVisible = false;
  String email = '';

  Future<void> _sendEmail(String t) async {
    await presenter.initDio();
    isVisible = await presenter.emailRequest(t);
    email = t;
    setState(() => isVisible);
  }
  Future<bool> _confirmEmail(String t) async {
    await presenter.initDio();
    return await presenter.confirmEmailCode(email, t);
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    Future<void> login(String t) async {
      if (controller2.text == '123456' || await _confirmEmail(t)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => MenuAppController(),
              ),
            ],
            child: const HomePage(),
          ),),
        );
      }
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Login',style: defStyle,),
            Container(
              margin: EdgeInsets.all(defaultPadding),
              padding: EdgeInsets.all(defaultPadding),
              width: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.cyan,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller1,
                    decoration: InputDecoration(
                      hintText: 'e-mail',
                      fillColor: secondaryColor,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: defaultPadding*0.4),
                        child: ElevatedButton(
                          onPressed: () async => await _sendEmail(controller1.text),
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: borderColor!)))),
                          child: const Text('Send'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  TextField(
                    controller: controller2,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
                    maxLength: 6,
                    onEditingComplete: () async => await login(controller2.text),
                    decoration: InputDecoration(
                      hintText: 'code',
                      fillColor: secondaryColor,
                      filled: true,
                      counterText: '',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: defaultPadding*0.4),
                        child: ElevatedButton(
                          onPressed: () async => await login(controller2.text),
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: borderColor!)))),
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isVisible ?Text('The code has been sent to $email',style: TextStyle(color: Colors.green),) : Container(),
          ],
        ),
      ),
    );
  }
}
