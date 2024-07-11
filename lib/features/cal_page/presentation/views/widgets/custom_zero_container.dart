import 'package:flutter/material.dart';

class CustomZeroContainer extends StatelessWidget {
  const CustomZeroContainer({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 170,
        decoration: ShapeDecoration(
          color: Colors.grey.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Center(
          child: Text(
            "0",
            style: TextStyle(color: Color(0xff5b9bd6), fontSize: 22),
          ),
        ),
      ),
    );
  }
}
