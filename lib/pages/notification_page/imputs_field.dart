import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class ImputsField extends StatelessWidget {
  String text;
  TextEditingController? controller;
  ImputsField({required this.text, this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      TextField(
        controller: controller ?? null,
        decoration: InputDecoration(
          hintText: text,
          fillColor: secondaryColor,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.25),
              margin: EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset("assets/enter.svg",width: defaultPadding*2,),
            ),
          ),
        ),
      ),
      SizedBox(height: defaultPadding,)
    ],
  );
}