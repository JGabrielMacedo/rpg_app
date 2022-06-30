import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/models/atributos.dart';
import 'package:rpg_app/src/models/atributos_enum.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';
import 'package:rpg_app/src/view/components/sample_curcular_button.dart';
import 'package:rpg_app/src/view/components/status_grid.dart';

final int _quantidadeDeAtributos = mapIntToAtributoType.length;

const Map<AtributosType, String> attributesTitle = {
  AtributosType.Forca: "Força",
  AtributosType.Destreza: "Destreza",
  AtributosType.Constituicao: "Constituição",
  AtributosType.Inteligencia: "Inteligência",
  AtributosType.Sabedoria: "Sabedoria",
  AtributosType.Carisma: "Carisma",
};

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
            final String attributeName = attributesTitle[attributeType] ?? "";
            final int atributosNome = atributosJson[mapAtributoTypeToString[attributeType]];

            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(attributeName),
                  Text(atributosNome.toString()),
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
            );
          },
          childCount: _quantidadeDeAtributos,
        );
      },
    );
  }
}
