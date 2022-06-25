import 'package:rpg_app/src/models/player.dart';

abstract class PlayerProvider {
  Future<bool> salvarPlayer(Player player);

  Future<Player> getPlayer();

  Future<bool> updatePlayer(Player player);
}
