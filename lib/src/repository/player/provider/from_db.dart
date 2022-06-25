import 'package:rpg_app/src/lite_db/lite_db.dart';
import 'package:rpg_app/src/map_error/error.dart';
import 'package:rpg_app/src/models/player.dart';
import 'package:rpg_app/src/repository/player/interface/player_provider.dart';
import 'package:sqflite/sqflite.dart';

class PlayerFromDB implements PlayerProvider {
  final ApplicationDataBase dataBase;

  const PlayerFromDB({this.dataBase = const ApplicationDataBase()});

  @override
  Future<bool> salvarPlayer(Player player) async {
    try {
      dataBase.salvarDefaultConfigDB(player);
      return true;
    } on DatabaseException catch (err) {
      return Future.error(ProjectError(ProjectError.DB_GENERIC_ERROR, error: err));
    } catch (err) {
      return Future.error(ProjectError(ProjectError.GENERIC_ERROR, error: err));
    }
  }

  @override
  Future<Player> getPlayer() async {
    try {
      return await dataBase.getPlayer();
    } on DatabaseException catch (err) {
      return Future.error(ProjectError(ProjectError.DB_GENERIC_ERROR, error: err));
    } catch (err, stack) {
      print(stack);
      return Future.error(ProjectError(ProjectError.GENERIC_ERROR, error: err));
    }
  }

  @override
  Future<bool> updatePlayer(Player player) async {
    try {
      await dataBase.updtaeAllTables(player);
      return true;
    } on DatabaseException catch (err) {
      return Future.error(ProjectError(ProjectError.DB_GENERIC_ERROR, error: err));
    } catch (err) {
      return Future.error(ProjectError(ProjectError.GENERIC_ERROR, error: err));
    }
  }
}
