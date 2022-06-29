import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rpg_app/src/rule/bloc/dyna_theme/dyna_theme_bloc.dart';

@immutable
abstract class DynaThemeEvent extends Equatable {
  const DynaThemeEvent();
}

class ChangeThemeEvent extends DynaThemeEvent {
  final MaterialColor? primaryThemeColor;
  final bool toDarkMode;

  const ChangeThemeEvent({this.primaryThemeColor, this.toDarkMode = false});

  @override
  // TODO: implement props
  List<Object?> get props => [primaryThemeColor];
}

class ToDefaultThemeEvent extends DynaThemeEvent {
  const ToDefaultThemeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [runtimeType];
}

class GetThemeFromRepositoryEvent extends DynaThemeEvent {
  const GetThemeFromRepositoryEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [runtimeType];
}
