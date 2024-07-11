import 'package:flutter/material.dart';

class CustomPlusAssignContainer extends StatelessWidget {
  const CustomPlusAssignContainer(
      {super.key, required this.text, required this.color});

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 70,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Color(0xffabd9f3), fontSize: 22),
        ),
      ),
    );
  }
}
