import 'package:flutter/material.dart';

class CharacterProfile extends StatelessWidget {
  const CharacterProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Row(
          children: [
            SizedBox(
                height: 100,
                child: Column(
                    children: [Text("HP"), Text("Mana")],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween)),
            SizedBox(
                height: 100,
                child: Column(
                    children: [PointLine(), PointLine()],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween)),
            SizedBox(
                height: 100,
                child: Column(
                    children: [Text("20"), Text("20")],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween)),
          ],
        ),
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
    final Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width / 10 * 6,
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
