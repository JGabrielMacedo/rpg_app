import 'package:equatable/equatable.dart';
import 'package:rpg_app/src/models/atributos.dart';
import 'package:rpg_app/src/models/character.dart';
import 'package:rpg_app/src/models/pericia.dart';

class Player {
  final Personagem personagem;
  final Pericia pericia;
  final Atributos atributos;

  String get nome => personagem.nome;

  const Player(
      {this.personagem = const Personagem(),
      this.pericia = const Pericia(),
      this.atributos = const Atributos()});

  Map<String, dynamic> toJson() {
    return {
      "personagem": personagem.toJson(),
      "pericia": pericia.toJson(),
      "atributos": atributos.toJson(),
    };
  }

  Player.fromJson(Map<String, dynamic> json)
      : personagem = Personagem.fromJson(json["personagem"]),
        pericia = Pericia.fromJson(json["pericias"]),
        atributos = Atributos.fromJson(json["atributos"]);

  Player copyWith({
    Personagem? personagem,
    Pericia? pericia,
    Atributos? atributos,
  }) {
    return Player(
      personagem: personagem ?? this.personagem,
      pericia: pericia ?? this.pericia,
      atributos: atributos ?? this.atributos,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          personagem == other.personagem &&
          pericia == other.pericia &&
          atributos == other.atributos;

  @override
  int get hashCode => personagem.hashCode ^ pericia.hashCode ^ atributos.hashCode;
}
