import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_bloc.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_state.dart';
import 'package:rpg_app/src/view/dashboard_view/dashboard_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DynaThemeBloc>(
      create: (context) =>
          DynaThemeBloc(themeState: CustomThemeState(primarySwitchColor: Colors.deepPurple)),
      child: BlocBuilder<DynaThemeBloc, DynaThemeState>(
        builder: (context, state) => MaterialApp(
          title: 'RPG App',
          theme: state.onDarkMode
              ? ThemeData.dark()
              : ThemeData(primarySwatch: state.primarySwitchColor),
          home: const Scaffold(body: DashboardView()),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
