import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    required this.color,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 100),
        Text(title, style: const TextStyle(fontSize: 28)),
        const Spacer(),
        CustomIcon(onPressed: onPressed, icon: icon, color: color),
      ],
    );
  }
}
