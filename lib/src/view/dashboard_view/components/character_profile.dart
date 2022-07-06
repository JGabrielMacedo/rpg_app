import 'package:flutter/material.dart';

class CharacterProfile extends StatelessWidget {
  const CharacterProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("HP", style: Theme.of(context).textTheme.bodyText1),
                      const PointLine(),
                      Text("20", style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("SP", style: Theme.of(context).textTheme.bodyText1),
                      const PointLine(),
                      Text("20", style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const int qntPoint = 60;

class PointLine extends StatefulWidget {
  const PointLine({Key? key, this.pointsNumbers = qntPoint}) : super(key: key);
  final int pointsNumbers;

  @override
  State<PointLine> createState() => _PointLineState();
}

class _PointLineState extends State<PointLine> {
  double _currentSliderValue = 20;
  final int totalPoints = 20;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth / 10 * 6,
      child: Slider(
        value: _currentSliderValue,
        max: totalPoints * 1.0,
        divisions: totalPoints,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) => setState(() => _currentSliderValue = value),
      ),
    );
  }
}
