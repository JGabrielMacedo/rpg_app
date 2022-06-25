import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';
import 'package:rpg_app/src/view/components/my_text_field.dart';
import 'package:rpg_app/src/view/components/sample_curcular_button.dart';

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
          actions: [
            SampleCircularButton(
              onPressed: () => BlocProvider.of<DashboardRule>(context).updatePlayer(),
              child: const Icon(Icons.save),
            ),
          ],
          centerTitle: true,
        );
      },
    );
  }

  Widget _buildTitleAppBar(context, state) {
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
    return Text(state.player.personagem?.nome ?? "");
  }

  Widget _buildLeadingIconButton(context, state) {
    if (state is ChangeNameDashboardSate) {
      return IconButton(
        onPressed: () => BlocProvider.of<DashboardRule>(context).loadInformationWithoutSave(),
        icon: const Icon(Icons.cancel_outlined),
      );
    }
    return IconButton(
      onPressed: () => BlocProvider.of<DashboardRule>(context).changePersonName(),
      icon: const Icon(Icons.edit),
    );
  }
}
