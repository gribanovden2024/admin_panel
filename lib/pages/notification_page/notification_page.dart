import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:admin_panel/constants.dart';
import 'imputs_field.dart';
import 'notification_data.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = NotificationData();
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    Future<void> getgroups() async {
      presenter.initDio();
      List<Map<String, dynamic>> list = [];
      Response? groups = await presenter.getGroups();
      print(groups!.data);
      for (int i = 0; i < groups!.data.length; i++) list.addAll(groups!.data);
    }

    Future<void> getnotifications() async {
      presenter.initDio();
      Response? notificationList = await presenter.getNotificationList();
      print(notificationList!.data);
    }

    Future<void> postnotifications(String id, String message) async {
      presenter.initDio();
      Response? notificationList = await presenter.postNotifications(id,message);
      print(notificationList!.data);
    }

    return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.blueGrey),
        child: Column(children: [
          SizedBox(height: defaultPadding),
          ImputsField(text: 'ID Groups', controller: controller1),
          ImputsField(text: 'Course'),
          ImputsField(text: 'Number'),
          ImputsField(text: 'Sub Number'),
          ImputsField(text: 'Message', controller: controller2),
          ImputsField(
              text:
                  'Images url (https://flyclipart.com/thumb2/alarma-icon-496777.png)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  getgroups();
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColor!)))),
                child: const Text(
                  'Enter',
                  style: defStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  getnotifications();
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColor!)))),
                child: const Text(
                  'Enter',
                  style: defStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  postnotifications(controller1.text,controller2.text);
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColor!)))),
                child: const Text(
                  'Enter',
                  style: defStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding)
        ]));
  }
}
