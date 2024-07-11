import 'package:flutter/material.dart';

class CustomDeleteContainer extends StatelessWidget {
  const CustomDeleteContainer({
    super.key,
    required this.text,
    this.onTap,
  });
  final void Function()? onTap;

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: ShapeDecoration(
          color: Colors.grey.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Center(
            child: Icon(Icons.cancel_presentation_rounded,
                color: Color(
                  0xff5b9bd6,
                ))),
      ),
    );
  }
}
