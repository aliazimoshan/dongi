import 'package:flutter/material.dart';
import '../../constants/color_config.dart';

class FABWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  const FABWidget({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      extendedPadding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
      backgroundColor: ColorConfig.primarySwatch,
      onPressed: onPressed,
      label: Row(
        children: [
          Icon(Icons.add, size: 18, color: ColorConfig.secondary),
          const SizedBox(width: 2),
          Text(title, style: TextStyle(color: ColorConfig.secondary)),
        ],
      ),
    );
  }
}
