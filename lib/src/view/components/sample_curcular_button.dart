import 'package:flutter/material.dart';

class SampleCircularButton extends StatelessWidget {
  const SampleCircularButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      onPressed: () => onPressed.call(),
      child: child,
    );
  }
}
