import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/map_error/error.dart';
import 'package:rpg_app/src/repository/theme_color/theme_repository.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_event.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_state.dart';

class DynaThemeBloc extends Bloc<DynaThemeEvent, DynaThemeState> {
  final ThemeRepository themeRepository;

  DynaThemeBloc({
    required DynaThemeState themeState,
    this.themeRepository = const ThemeRepository(),
  }) : super(themeState) {
    on<ChangeThemeEvent>(_onChangeTheme);
    on<ToDefaultThemeEvent>(_onToDefaultTheme);
    on<GetThemeFromRepositoryEvent>(_onGetThemeFromRepository);
  }

  Future<void> _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<DynaThemeState> emit,
  ) async {
    if (event.toDarkMode) {
      return emit(const CustomThemeState(onDarkMode: true));
    }
    if (event.primaryThemeColor == null) {
      return emit(const CustomThemeState(primarySwitchColor: Colors.deepPurple));
    }
    emit(CustomThemeState(primarySwitchColor: event.primaryThemeColor));
  }

  Future<void> _onToDefaultTheme(
    DynaThemeEvent event,
    Emitter<DynaThemeState> emit,
  ) async {
    emit(const CustomThemeState(primarySwitchColor: Colors.deepPurple));
  }

  Future<void> _onGetThemeFromRepository(
    GetThemeFromRepositoryEvent event,
    Emitter<DynaThemeState> emit,
  ) async {
    try {
      final MaterialColor colorFromRepository = await themeRepository.getThemeColor();
      add(ChangeThemeEvent(primaryThemeColor: colorFromRepository, toDarkMode: false));
    } catch (err) {
      emit(const CustomThemeState(primarySwitchColor: Colors.deepPurple));
    }
  }
}
