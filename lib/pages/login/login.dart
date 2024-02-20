import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuAppController.dart';
import '../home/home_page.dart';
import 'login_data.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    void login() {
      if (controller2.text == '123456') {
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
    final presenter = LoginData();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Login',style: defStyle,),
            Container(
              margin: const EdgeInsets.all(defaultPadding),
              padding: const EdgeInsets.all(defaultPadding),
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
                        padding: const EdgeInsets.only(right: defaultPadding*0.4),
                        child: ElevatedButton(
                          onPressed: () {presenter.getCode(controller1.text);},
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: borderColor!)))),
                          child: const Text('Send'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  TextField(
                    controller: controller2,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
                    maxLength: 6,
                    onEditingComplete: login,
                    decoration: InputDecoration(
                      hintText: 'code',
                      fillColor: secondaryColor,
                      filled: true,
                      counterText: '',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: defaultPadding*0.4),
                        child: ElevatedButton(
                          onPressed: login,
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
          ],
        ),
      ),
    );
  }
}
