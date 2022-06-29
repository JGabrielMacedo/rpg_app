import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DynaThemeState extends Equatable {
  final MaterialColor? primarySwitchColor;
  final bool onDarkMode;

  const DynaThemeState({this.primarySwitchColor, this.onDarkMode = false});

  @override
  // TODO: implement props
  List<Object?> get props => [runtimeType, primarySwitchColor, onDarkMode];
}

class CustomThemeState extends DynaThemeState {
  const CustomThemeState({super.primarySwitchColor, super.onDarkMode});
}
