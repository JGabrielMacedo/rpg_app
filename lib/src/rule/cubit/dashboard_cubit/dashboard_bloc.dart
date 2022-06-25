import 'package:rpg_app/src/map_error/error.dart';
import 'package:rpg_app/src/models/atributos.dart';
import 'package:rpg_app/src/models/atributos_enum.dart';
import 'package:rpg_app/src/models/expertises_types_enum.dart';
import 'package:rpg_app/src/models/pericia.dart';
import 'package:rpg_app/src/models/player.dart';
import 'package:rpg_app/src/repository/player/player_repository.dart';
import 'package:rpg_app/src/rule/cubit/dashboard_cubit/dashboard.dart';

class DashboardRuleImpl extends DashboardRule {
  final PlayerRepository repository;

  DashboardRuleImpl({
    this.repository = const PlayerRepository(),
  }) : super(const InitialDashboardState());

  @override
  Future<void> loadPlayer() async {
    final Player player = state.player;
    emit(LoadingDashboardState(player: player));
    try {
      final Player? playerFounded = await repository.getPlayer();
      if (playerFounded == null) return createNewPlayer(player);
      return emit(LoadedDashboardState(player: playerFounded));
    } catch (err) {
      print((err as ProjectError).error);

      return emit(ErrorDashboardState(player: player));
    }
  }

  @override
  Future<void> updatePlayer({Player? newPlayer}) async {
    newPlayer ??= state.player;
    emit(LoadingDashboardState(player: newPlayer));
    try {
      final bool wasUpdated = await repository.updatePlayer(newPlayer);
      if (wasUpdated) return loadPlayer();
      return emit(ErrorDashboardState(player: newPlayer));
    } catch (err) {
      return emit(LoadedDashboardState(player: newPlayer));
    }
  }

  @override
  Future<void> createNewPlayer(Player newPlayer) async {
    final Player player = state.player;
    emit(LoadingDashboardState(player: player));
    try {
      final bool wasCreated = await repository.salvarPlayer(newPlayer);
      if (wasCreated) return loadPlayer();
      return emit(ErrorDashboardState(player: player));
    } catch (err) {
      return emit(LoadedDashboardState(player: player));
    }
  }

  @override
  Future<void> changePersonName() async => emit(ChangeNameDashboardSate(player: state.player));

  @override
  Future<void> loadInformationWithoutSave({Player? player}) async {
    emit(LoadedDashboardState(player: player ?? state.player));
  }

  @override
  Future<void> increaseAtributo({required int atributoIndex}) async {
    final Atributos atributosAtuais = state.player.atributos;
    late final Atributos? newAtributos;
    switch (mapIntToAtributoType[atributoIndex]) {
      case AtributosType.Forca:
        newAtributos = atributosAtuais.copyWith(forca: atributosAtuais.forca + 1);
        break;
      case AtributosType.Destreza:
        newAtributos = atributosAtuais.copyWith(destreza: atributosAtuais.destreza + 1);
        break;
      case AtributosType.Constituicao:
        newAtributos = atributosAtuais.copyWith(constituicao: atributosAtuais.constituicao + 1);
        break;
      case AtributosType.Inteligencia:
        newAtributos = atributosAtuais.copyWith(inteligencia: atributosAtuais.inteligencia + 1);
        break;
      case AtributosType.Sabedoria:
        newAtributos = atributosAtuais.copyWith(sabedoria: atributosAtuais.sabedoria + 1);
        break;
      case AtributosType.Carisma:
        newAtributos = atributosAtuais.copyWith(carisma: atributosAtuais.carisma + 1);
        break;
    }
    emit(LoadedDashboardState(player: state.player.copyWith(atributos: newAtributos)));
  }

  @override
  Future<void> decreaseAtributo({required int atributoIndex}) async {
    final Atributos atributosAtuais = state.player.atributos;
    late final Atributos? newAtributos;
    switch (mapIntToAtributoType[atributoIndex]) {
      case AtributosType.Forca:
        newAtributos = atributosAtuais.copyWith(forca: atributosAtuais.forca - 1);
        break;
      case AtributosType.Destreza:
        newAtributos = atributosAtuais.copyWith(destreza: atributosAtuais.destreza - 1);
        break;
      case AtributosType.Constituicao:
        newAtributos = atributosAtuais.copyWith(constituicao: atributosAtuais.constituicao - 1);
        break;
      case AtributosType.Inteligencia:
        newAtributos = atributosAtuais.copyWith(inteligencia: atributosAtuais.inteligencia - 1);
        break;
      case AtributosType.Sabedoria:
        newAtributos = atributosAtuais.copyWith(sabedoria: atributosAtuais.sabedoria - 1);
        break;
      case AtributosType.Carisma:
        newAtributos = atributosAtuais.copyWith(carisma: atributosAtuais.carisma - 1);
        break;
    }
    emit(LoadedDashboardState(player: state.player.copyWith(atributos: newAtributos)));
  }

  @override
  Future<void> increasePericia({required int periciaIndex}) async {
    final Pericia periciasAtuais = state.player.pericia;
    late final Pericia? newPericia;
    switch (mapIndexToPericiasType[periciaIndex]) {
      case PericiasType.Acrobacia:
        newPericia = periciasAtuais.copyWith(acrobacia: periciasAtuais.acrobacia + 1);
        break;
      case PericiasType.Arcanismo:
        newPericia = periciasAtuais.copyWith(arcanismo: periciasAtuais.arcanismo + 1);
        break;
      case PericiasType.Atletismo:
        newPericia = periciasAtuais.copyWith(atletismo: periciasAtuais.atletismo + 1);
        break;
      case PericiasType.Atuacao:
        newPericia = periciasAtuais.copyWith(atuacao: periciasAtuais.atuacao + 1);
        break;
      case PericiasType.Enganacao:
        newPericia = periciasAtuais.copyWith(enganacao: periciasAtuais.enganacao + 1);
        break;
      case PericiasType.Furtividade:
        newPericia = periciasAtuais.copyWith(furtividade: periciasAtuais.furtividade + 1);
        break;
      case PericiasType.Intimidacao:
        newPericia = periciasAtuais.copyWith(intimidacao: periciasAtuais.intimidacao + 1);
        break;
      case PericiasType.Intuicao:
        newPericia = periciasAtuais.copyWith(intuicao: periciasAtuais.intuicao + 1);
        break;
      case PericiasType.Investigacao:
        newPericia = periciasAtuais.copyWith(investigacao: periciasAtuais.investigacao + 1);
        break;
      case PericiasType.LidarComAnimais:
        newPericia = periciasAtuais.copyWith(lidarComAnimais: periciasAtuais.lidarComAnimais + 1);
        break;
      case PericiasType.Medicina:
        newPericia = periciasAtuais.copyWith(medicina: periciasAtuais.medicina + 1);
        break;
      case PericiasType.Persuacao:
        newPericia = periciasAtuais.copyWith(persuasao: periciasAtuais.persuasao + 1);
        break;
      case PericiasType.Percepcao:
        newPericia = periciasAtuais.copyWith(percepcao: periciasAtuais.percepcao + 1);
        break;
      case PericiasType.InstintoDeSobrevivencia:
        newPericia = periciasAtuais.copyWith(
            instintoDeSobrevivencia: periciasAtuais.instintoDeSobrevivencia + 1);
        break;
    }
    emit(LoadedDashboardState(player: state.player.copyWith(pericia: newPericia)));
  }

  @override
  Future<void> decreasePericia({required int periciaIndex}) async {
    final Pericia periciasAtuais = state.player.pericia;
    late final Pericia? newPericia;
    switch (mapIndexToPericiasType[periciaIndex]) {
      case PericiasType.Acrobacia:
        newPericia = periciasAtuais.copyWith(acrobacia: periciasAtuais.acrobacia - 1);
        break;
      case PericiasType.Arcanismo:
        newPericia = periciasAtuais.copyWith(arcanismo: periciasAtuais.arcanismo - 1);
        break;
      case PericiasType.Atletismo:
        newPericia = periciasAtuais.copyWith(atletismo: periciasAtuais.atletismo - 1);
        break;
      case PericiasType.Atuacao:
        newPericia = periciasAtuais.copyWith(atuacao: periciasAtuais.atuacao - 1);
        break;
      case PericiasType.Enganacao:
        newPericia = periciasAtuais.copyWith(enganacao: periciasAtuais.enganacao - 1);
        break;
      case PericiasType.Furtividade:
        newPericia = periciasAtuais.copyWith(furtividade: periciasAtuais.furtividade - 1);
        break;
      case PericiasType.Intimidacao:
        newPericia = periciasAtuais.copyWith(intimidacao: periciasAtuais.intimidacao - 1);
        break;
      case PericiasType.Intuicao:
        newPericia = periciasAtuais.copyWith(intuicao: periciasAtuais.intuicao - 1);
        break;
      case PericiasType.Investigacao:
        newPericia = periciasAtuais.copyWith(investigacao: periciasAtuais.investigacao - 1);
        break;
      case PericiasType.LidarComAnimais:
        newPericia = periciasAtuais.copyWith(lidarComAnimais: periciasAtuais.lidarComAnimais - 1);
        break;
      case PericiasType.Medicina:
        newPericia = periciasAtuais.copyWith(medicina: periciasAtuais.medicina - 1);
        break;
      case PericiasType.Persuacao:
        newPericia = periciasAtuais.copyWith(persuasao: periciasAtuais.persuasao - 1);
        break;
      case PericiasType.Percepcao:
        newPericia = periciasAtuais.copyWith(percepcao: periciasAtuais.percepcao - 1);
        break;
      case PericiasType.InstintoDeSobrevivencia:
        newPericia = periciasAtuais.copyWith(
            instintoDeSobrevivencia: periciasAtuais.instintoDeSobrevivencia - 1);
        break;
    }
    emit(LoadedDashboardState(player: state.player.copyWith(pericia: newPericia)));
  }
}
