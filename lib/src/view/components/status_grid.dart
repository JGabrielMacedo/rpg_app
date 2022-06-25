import 'package:flutter/material.dart';

class StatusGrid extends StatelessWidget {
  const StatusGrid({
    Key? key,
    required this.buildChildren,
    required this.childCount,
  }) : super(key: key);

  final Widget Function(BuildContext, int) buildChildren;
  final int childCount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        buildChildren,
        childCount: childCount,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
