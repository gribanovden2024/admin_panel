import 'package:flutter/material.dart';

import '../../constants.dart';
import 'imputs_field.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.blueGrey),
        child: Column(children: [
          const SizedBox(height: defaultPadding),
          ImputsField(text: 'Message'),
          ImputsField(text: 'Groups'),
          ImputsField(
              text:
                  'Images url (https://flyclipart.com/thumb2/alarma-icon-496777.png)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
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
          const SizedBox(
            height: defaultPadding,
          ),
        ]),
      );
}
