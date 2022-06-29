import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/helper/hex_color.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_bloc.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_event.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_state.dart';

final Iterable<MaterialColor> applicationColorsThemes = [
  ...List<MaterialColor>.generate(
    Colors.accents.length,
    (index) => HexColor.fromHex(Colors.accents.elementAt(index).toHex()),
  ),
  Colors.deepPurple,
  Colors.purple,
  Colors.lightBlue,
  Colors.red,
  Colors.blue,
  Colors.amber,
  Colors.deepOrange,
  Colors.pink,
  Colors.cyan,
  Colors.teal,
  Colors.lime,
  Colors.lightGreen,
  Colors.indigo,
  Colors.blueGrey,
  Colors.brown,
  Colors.grey,
  Colors.yellow,
  HexColor.fromHex(Colors.black12.toHex()),
  HexColor.fromHex(Colors.black26.toHex()),
  HexColor.fromHex(Colors.black38.toHex()),
  HexColor.fromHex(Colors.black45.toHex()),
  HexColor.fromHex(Colors.black54.toHex()),
  HexColor.fromHex(Colors.black87.toHex()),
  HexColor.fromHex(Colors.black.toHex()),
];

class ChangeThemeColorBottomSheet extends StatelessWidget {
  const ChangeThemeColorBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.45),
      onClosing: () {},
      builder: (context) => Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Selecione a cor base para o tema da aplicação",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Flexible(
            child: BlocBuilder<DynaThemeBloc, DynaThemeState>(builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  tileColor: Theme.of(context).cardColor,
                  title: const Text("Usar modo escuro"),
                  value: state.onDarkMode,
                  onChanged: (bool value) => BlocProvider.of<DynaThemeBloc>(context).add(
                    ChangeThemeEvent(toDarkMode: !state.onDarkMode),
                  ),
                ),
              );
            }),
          ),
          Flexible(
            flex: 2,
            child: GridView.count(
              padding: EdgeInsets.only(right: 8),
              shrinkWrap: true,
              semanticChildCount: applicationColorsThemes.length,
              crossAxisCount: applicationColorsThemes.length ~/ 4,
              children: List.generate(
                applicationColorsThemes.length,
                (index) => _buildItemList(
                  context,
                  applicationColorsThemes.elementAt(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemList(BuildContext context, MaterialColor color) {
    final double colorsSize = MediaQuery.of(context).size.width / 12;
    final currenColor = BlocProvider.of<DynaThemeBloc>(context).state.primarySwitchColor;

    final bool currentColorIsEqualThisComponent = currenColor == color;

    return Container(
      decoration: currentColorIsEqualThisComponent
          ? BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(360),
            )
          : null,
      child: RawMaterialButton(
        shape: const CircleBorder(),
        child: Icon(
          Icons.circle,
          color: color,
          size: colorsSize,
        ),
        onPressed: () => BlocProvider.of<DynaThemeBloc>(context).add(
          ChangeThemeEvent(primaryThemeColor: color),
        ),
      ),
    );
  }
}