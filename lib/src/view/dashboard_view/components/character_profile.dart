import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/models/character.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';

class CharacterProfile extends StatelessWidget {
  const CharacterProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<DashboardRule, DashboardState>(
        buildWhen: (currentState, previousState) => currentState is LoadedDashboardState,
        builder: (context, state) {
          final Personagem personagem = state.personagem;
          return Column(
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
                          PointLine(
                            executeWhenChangeValue: (double value) =>
                                BlocProvider.of<DashboardRule>(context).changeHealthPointTo(value),
                            totalPoints: personagem.pontosTotaisDeVida,
                            currentPoint: personagem.pontosDeVidaAtuais * 1.0,
                          ),
                          Text(personagem.pontosDeVidaAtuais.toString().padLeft(2, "0"),
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("SP", style: Theme.of(context).textTheme.bodyText1),
                          PointLine(
                            executeWhenChangeValue: (double value) =>
                                BlocProvider.of<DashboardRule>(context).changePowerPointTo(value),
                            totalPoints: personagem.pontosTotaisDePoder,
                            currentPoint: personagem.pontosDePoderAtuais * 1.0,
                          ),
                          Text(personagem.pontosDePoderAtuais.toString().padLeft(2, "0"),
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class PointLine extends StatelessWidget {
  const PointLine({
    Key? key,
    required this.totalPoints,
    required this.currentPoint,
    required this.executeWhenChangeValue,
  }) : super(key: key);

  final int totalPoints;
  final double currentPoint;
  final Function(double) executeWhenChangeValue;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth / 10 * 6,
      child: Slider(
        value: currentPoint,
        max: totalPoints * 1.0,
        divisions: totalPoints,
        label: currentPoint.round().toString().padLeft(2, "0"),
        onChanged: executeWhenChangeValue,
      ),
    );
  }
}
