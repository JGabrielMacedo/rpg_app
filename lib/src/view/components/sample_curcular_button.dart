import 'package:flutter/material.dart';

class SampleCircularButton extends StatelessWidget {
  const SampleCircularButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.primaryColor,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  final Function onPressed;
  final Widget child;
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        onPressed: () => onPressed.call(),
        child: child,
      ),
    );
  }
}
