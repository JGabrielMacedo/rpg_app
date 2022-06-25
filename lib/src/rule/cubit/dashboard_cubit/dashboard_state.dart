import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rpg_app/src/models/atributos.dart';
import 'package:rpg_app/src/models/character.dart';
import 'package:rpg_app/src/models/pericia.dart';
import 'package:rpg_app/src/models/player.dart';

@immutable
abstract class DashboardState extends Equatable {
  final Player player;

  const DashboardState({required this.player});

  Atributos get atributos => player.atributos;

  Pericia get pericia => player.pericia;

  Personagem get personagem => player.personagem;
}

class InitialDashboardState extends DashboardState {
  const InitialDashboardState({super.player = const Player()});

  @override
  List<Object?> get props => [player, personagem, atributos, pericia];
}

class LoadingDashboardState extends DashboardState {
  const LoadingDashboardState({required super.player});

  @override
  List<Object?> get props => [player, personagem, atributos, pericia];
}

class LoadedDashboardState extends DashboardState {
  const LoadedDashboardState({required super.player});

  @override
  List<Object?> get props => [player, personagem, atributos, pericia];
}

class UpdatedDashboardState extends DashboardState {
  const UpdatedDashboardState({required super.player});

  @override
  List<Object?> get props => [player, personagem, atributos, pericia];
}

class ErrorDashboardState extends DashboardState {
  const ErrorDashboardState({required super.player});

  @override
  List<Object?> get props => [player, personagem, atributos, pericia];
}

class ChangeNameDashboardSate extends DashboardState {
  const ChangeNameDashboardSate({required super.player});

  @override
  List<Object?> get props => [player, personagem, atributos, pericia];
}
