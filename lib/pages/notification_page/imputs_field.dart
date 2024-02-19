import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class ImputsField extends StatelessWidget {
  String text;

  ImputsField({required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      TextField(
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
              padding: const EdgeInsets.all(defaultPadding * 0.25),
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset("assets/enter.svg",width: defaultPadding*2,),
            ),
          ),
        ),
      ),
      const SizedBox(height: defaultPadding,)
    ],
  );
}