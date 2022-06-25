import 'dart:core';

import 'package:rpg_app/src/models/player.dart';
import 'package:rpg_app/src/repository/player/interface/player_provider.dart';
import 'package:rpg_app/src/repository/player/provider/from_db.dart';

class PlayerRepository {
  final PlayerProvider? provider;

  const PlayerRepository({this.provider = const PlayerFromDB()});

  Future<Player?> getPlayer() async {
    return await provider?.getPlayer();
  }

  Future<bool> salvarPlayer(Player player) async {
    final bool? wasSaved = await provider?.salvarPlayer(player);
    return wasSaved ?? false;
  }

  Future<bool> updatePlayer(Player player) async {
    final bool? wasUpdated = await provider?.updatePlayer(player);
    return wasUpdated ?? false;
  }
}
