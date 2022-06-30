import 'package:flutter/material.dart';

class StatusGrid extends StatelessWidget {
  const StatusGrid({
    Key? key,
    required this.buildChildren,
    required this.childCount,
    this.crossAxisCount = 3,
  }) : super(key: key);

  final Widget Function(BuildContext, int) buildChildren;
  final int childCount;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      children: List<Widget>.generate(childCount, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: buildChildren(context, index),
        );
      }),
    );
  }
}
