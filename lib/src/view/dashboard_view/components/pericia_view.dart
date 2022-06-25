import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/models/atributos.dart';
import 'package:rpg_app/src/models/atributos_enum.dart';
import 'package:rpg_app/src/models/expertises_types_enum.dart';
import 'package:rpg_app/src/models/pericia.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';
import 'package:rpg_app/src/view/components/sample_curcular_button.dart';
import 'package:rpg_app/src/view/components/status_grid.dart';

final int _quantidadeDePericia = mapIndexToPericiasType.length;

class PericiasView extends StatelessWidget {
  const PericiasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return BlocBuilder<DashboardRule, DashboardState>(
      builder: (context, state) {
        final Pericia pericias = state.player.pericia.copyWith();
        final Map<String, dynamic> periciaJson = pericias.toJson();

        return StatusGrid(
          buildChildren: (context, index) {
            final PericiasType periciaType = mapIndexToPericiasType[index];
            final String? periciaNome = mapPericiasTypeToString[periciaType];
            final int periciaValue = periciaJson[periciaNome];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Divider(),
                    Text(periciaNome?.toUpperCase() ?? ""),
                    Text(periciaValue.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SampleCircularButton(
                          onPressed: () => BlocProvider.of<DashboardRule>(context)
                              .decreasePericia(periciaIndex: index),
                          child: const Icon(Icons.remove),
                        ),
                        SampleCircularButton(
                          onPressed: () => BlocProvider.of<DashboardRule>(context)
                              .increasePericia(periciaIndex: index),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          childCount: _quantidadeDePericia,
        );
      }
    );
  }
}
