import 'package:flutter/material.dart';
import 'package:admin_panel/constants.dart';

class ImputsField extends StatelessWidget {
  String text;
  TextEditingController? controller;
  ImputsField({required this.text, this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      TextFormField(
        controller: controller ?? null,
        decoration: InputDecoration(
          hintText: text,
          fillColor: secondaryColor,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      SizedBox(height: defaultPadding,)
    ],
  );
}