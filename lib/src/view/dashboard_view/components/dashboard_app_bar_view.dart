import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/helper/color_helper.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';
import 'package:rpg_app/src/view/components/my_text_field.dart';
import 'package:rpg_app/src/view/components/sample_curcular_button.dart';
import 'package:rpg_app/src/view/dashboard_view/components/theme_color_bottom_sheet.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardRule, DashboardState>(
      builder: (context, state) {
        return SliverAppBar(
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _buildTitleAppBar(context, state),
          ),
          leading: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _buildLeadingIconButton(context, state),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => showModalBottomSheet(
                  context: context, builder: (context) => const ChangeThemeColorBottomSheet()),
              icon: Icon(
                Icons.color_lens_outlined,
                color: ColorHelper.defineForegroundColorWithContrastOf(
                  Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildTitleAppBar(BuildContext context, DashboardState state) {
    var playerName = state.player.personagem.nome;

    if (state is ChangeNameDashboardSate) {
      return MyTextView(
        labelText: "Novo nome: ",
        initialText: state.player.nome,
        onFinish: (String text) {
          return BlocProvider.of<DashboardRule>(context).loadInformationWithoutSave(
            player: state.player.copyWith(
              personagem: state.player.personagem.copyWith(nome: text),
            ),
          );
        },
      );
    }
    return Text(
      playerName.isNotEmpty ? playerName : "Sem nome",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ColorHelper.defineForegroundColorWithContrastOf(
              Theme.of(context).primaryColor,
            ),
          ),
    );
  }

  Widget _buildLeadingIconButton(context, state) {
    if (state is ChangeNameDashboardSate) {
      return IconButton(
        onPressed: () => BlocProvider.of<DashboardRule>(context).loadInformationWithoutSave(),
        icon: Icon(
          Icons.cancel_outlined,
          color: ColorHelper.defineForegroundColorWithContrastOf(
            Theme.of(context).primaryColor,
          ),
        ),
      );
    }
    return IconButton(
      onPressed: () => BlocProvider.of<DashboardRule>(context).changePersonName(),
      icon: Icon(
        Icons.edit,
        color: ColorHelper.defineForegroundColorWithContrastOf(
          Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
