import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/models/atributos.dart';
import 'package:rpg_app/src/models/atributos_enum.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';
import 'package:rpg_app/src/view/components/sample_curcular_button.dart';
import 'package:rpg_app/src/view/components/status_grid.dart';

final int _quantidadeDeAtributos = mapIntToAtributoType.length;

class AttributesView extends StatelessWidget {
  const AttributesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardRule, DashboardState>(
      builder: (context, state) {
        final Atributos atributos =
            BlocProvider.of<DashboardRule>(context).state.player.atributos.copyWith();

        final Map<String, dynamic> atributosJson = atributos.toJson();
        return StatusGrid(
          buildChildren: (context, index) {
            final AtributosType attributeType = mapIntToAtributoType[index];
            final String? attributeName = mapAtributoTypeToString[attributeType];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Divider(),
                    Text(attributeName?.toUpperCase() ?? ""),
                    Text("${atributosJson[attributeName?.toLowerCase()]}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SampleCircularButton(
                          onPressed: () => BlocProvider.of<DashboardRule>(context)
                              .decreaseAtributo(atributoIndex: index),
                          child: const Icon(Icons.remove),
                        ),
                        SampleCircularButton(
                          onPressed: () => BlocProvider.of<DashboardRule>(context)
                              .increaseAtributo(atributoIndex: index),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: _quantidadeDeAtributos,
        );
      },
    );
  }
}
