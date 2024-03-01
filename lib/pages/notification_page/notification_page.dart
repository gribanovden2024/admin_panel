import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:admin_panel/constants.dart';
import 'imputs_field.dart';
import 'notification_data.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final presenter = NotificationData();
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();

    Future<String> getnotifications() async {
      presenter.initDio();
      Response? notificationList = await presenter.getNotificationList();
      return notificationList?.data.toString() ?? 'error';
    }

    Future<void> _showBottomSheet(
        BuildContext context, Function function) async {
      String text = await function();
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(
                top: defaultPadding,
                right: defaultPadding,
                left: defaultPadding),
            child: ListView(
              children: [
                Center(
                  child: Text(
                      '${text.replaceAll(new RegExp(r'}, '), '},\n').replaceAll(new RegExp(r'results: '), 'results:\n')}'),
                ),
              ],
            ),
          );
        },
      );
    }

    Future<void> _sended(context, bool function) async {
      if (function)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('The message has been sent'),
              actions: [
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
    }

    Future<String> getgroups() async {
      presenter.initDio();
      Response? groups = await presenter.getGroups();
      return groups?.data.toString() ?? 'error';
    }

    Future<bool> postnotifications(String id, String message) async {
      presenter.initDio();
      List<int> intList = id
          .split(',')
          .map((String number) => int.parse(number.trim()))
          .toList();
      Response? notificationList =
          await presenter.postNotifications(intList, message);
      return (notificationList?.statusCode == 200) ? true : false;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.blueGrey),
      child: Column(children: [
        SizedBox(height: defaultPadding),
        ImputsField(text: 'ID Groups', controller: controller1),
        ImputsField(text: 'Message', controller: controller2),
        // ImputsField(
        //     text:
        //         'Images url (https://flyclipart.com/thumb2/alarma-icon-496777.png)'),
        Wrap(
          runSpacing: defaultPadding / 3,
          spacing: defaultPadding,
          alignment: WrapAlignment.spaceAround,
          children: [
            ElevatedButtonNotification(
                'Open groups', () => _showBottomSheet(context, getgroups)),
            ElevatedButtonNotification('Open notifications',
                () => _showBottomSheet(context, getnotifications)),
            ElevatedButtonNotification(
                'Send a message',
                () async => _sended(
                    context,
                    await postnotifications(
                        controller1.text, controller2.text))),
          ],
        ),
        SizedBox(height: defaultPadding)
      ]),
    );
  }
}

class ElevatedButtonNotification extends StatelessWidget {
  ElevatedButtonNotification(this.text, this.function);

  final void Function() function;
  final String text;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: function,
        style: butStyle,
        child: Text(
          text,
          style: defStyle,
        ),
      );
}
