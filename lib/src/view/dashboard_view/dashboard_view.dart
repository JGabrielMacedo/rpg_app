import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';
import 'package:rpg_app/src/view/components/sample_curcular_button.dart';
import 'package:rpg_app/src/view/dashboard_view/components/attributes_view.dart';
import 'package:rpg_app/src/view/dashboard_view/components/dashboard_app_bar_view.dart';
import 'package:rpg_app/src/view/dashboard_view/components/pericia_view.dart';
import 'package:rpg_app/src/view/dashboard_view/components/theme_color_bottom_sheet.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardRule>(
      create: (_) => DashboardRuleImpl(),
      child: BlocBuilder<DashboardRule, DashboardState>(
        builder: (context, state) {
          if (state is InitialDashboardState) BlocProvider.of<DashboardRule>(context).loadPlayer();
          if (state is ErrorDashboardState) {
            return Center(
              child: Column(
                children: [
                  const Text("Erro"),
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<DashboardRule>(context).loadPlayer(),
                    child: const Text("Tentar novamente"),
                  ),
                ],
              ),
            );
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: state is LoadedDashboardState || state is ChangeNameDashboardSate
                ? CustomScrollView(
                    slivers: [
                      const DashboardAppBar(),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SampleCircularButton(
                            borderColor: Colors.grey,
                            backgroundColor: Theme.of(context).cardColor,
                            onPressed: () => BlocProvider.of<DashboardRule>(context).updatePlayer(),
                            child: Text(
                              "Salvar informações",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(child: Divider()),
                      SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            "Atributos",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                      const AttributesView(),
                      const SliverToBoxAdapter(child: Divider()),
                      const SliverToBoxAdapter(child: Center(child: Text("Pericias"))),
                      const PericiasView()
                    ],
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
