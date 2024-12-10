import 'package:flutter/material.dart';

import '../utils/constants.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton({Key? key, required this.text, required this.icon, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: COLOR_DARK_BLUE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(color: COLOR_WHITE),
            ),
          ],
        ),
      ),
    );
  }

}
