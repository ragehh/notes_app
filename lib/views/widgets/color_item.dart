import 'package:flutter/material.dart';

import '../../constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isPicked, required this.color});

  final bool isPicked;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? CircleAvatar(
            radius: 30,
            backgroundColor: kPrimaryColor,
            child: CircleAvatar(radius: 25, backgroundColor: color),
          )
        : CircleAvatar(radius: 30, backgroundColor: color);
  }
}
