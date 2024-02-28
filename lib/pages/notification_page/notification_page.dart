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
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    Future<String> getnotifications() async {
      presenter.initDio();
      Response? notificationList = await presenter.getNotificationList();
      print(notificationList!.data);
      return notificationList.data.toString();
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
                  child: Text('${text.replaceAll(new RegExp(r'}, '), '},\n').replaceAll(new RegExp(r'results: '), 'results:\n')}'),
                ),
              ],
            ),
          );
        },
      );
    }
    Future<void> _sended(BuildContext context, bool function) async {
      if (function) showDialog(
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

    Future<String?> getgroups() async {
      presenter.initDio();
      Response? groups = await presenter.getGroups();
      return groups?.data.toString() ?? null;
    }

    Future<bool> postnotifications(String id, String message) async {
      presenter.initDio();
      List<int> intList = id
          .split(',')
          .map((String number) => int.parse(number.trim()))
          .toList();
      Response? notificationList =
          await presenter.postNotifications(intList, message);
      if (notificationList?.statusCode == 200) return true;
      else return false;
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
            runSpacing: defaultPadding,
            alignment: WrapAlignment.spaceAround,
            spacing: defaultPadding,
            children: [
              ElevatedButton(
                onPressed: () => _showBottomSheet(context, getgroups),
                style: butStyle,
                child: const Text(
                  'Open groups',
                  style: defStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () => _showBottomSheet(context, getnotifications),
                style: butStyle,
                child: const Text(
                  'Open notifications',
                  style: defStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () async =>
                     _sended(context, await postnotifications(controller1.text, controller2.text)),
                style: butStyle,
                child: const Text(
                  'Send a message',
                  style: defStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding)
        ]));
  }
}
