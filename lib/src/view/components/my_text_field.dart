import 'package:flutter/material.dart';

class MyTextView extends StatelessWidget {
  const MyTextView({
    super.key,
    required this.onFinish,
    this.initialText,
    this.labelText,
  });

  final Function(String text) onFinish;
  final String? initialText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: initialText ?? "");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
        onSubmitted: onFinish,
        controller: controller,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
          border: const UnderlineInputBorder(),
          labelText: labelText ?? "",
        ),
      ),
    );
  }
}
