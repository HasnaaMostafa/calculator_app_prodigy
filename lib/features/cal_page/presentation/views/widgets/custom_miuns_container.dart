import 'package:flutter/material.dart';

class CustomMinContainer extends StatelessWidget {
  const CustomMinContainer({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: ShapeDecoration(
        color: const Color(0xff025cb2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
