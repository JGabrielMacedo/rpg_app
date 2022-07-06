import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg_app/src/models/player.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';

export 'dashboard_bloc.dart';
export 'dashboard_state.dart';

abstract class DashboardRule extends Cubit<DashboardState> {
  DashboardRule(super.initialState);

  Future<void> loadPlayer();

  Future<void> updatePlayer({Player? newPlayer});

  Future<void> createNewPlayer(Player newPlayer);

  Future<void> changePersonName();

  Future<void> increaseAtributo({required int atributoIndex});

  Future<void> decreaseAtributo({required int atributoIndex});

  Future<void> loadInformationWithoutSave({Player? player});

  Future<void> increasePericia({required int periciaIndex});

  Future<void> decreasePericia({required int periciaIndex});

  Future<void> changeHealthPointTo(double value);

  Future<void> changePowerPointTo(double value);
}
