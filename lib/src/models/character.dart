import 'package:equatable/equatable.dart';
import 'package:rpg_app/src/models/atributos_enum.dart';
import 'package:rpg_app/src/models/expertises_types_enum.dart';

class Personagem {
  final int id;
  final String nome;
  final int level;
  final String fraquezas;
  final int pontosDeVida;
  final String equipamentos;
  final String talentos;
  final String habilidades;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
      "level": level,
      "fraquezas": fraquezas,
      "pontosDeVida": pontosDeVida,
      "equipamentos": equipamentos,
      "talentos": talentos,
      "habilidades": habilidades,
    };
  }

  const Personagem({
    this.nome = "",
    this.id = 0,
    this.level = 1,
    this.fraquezas = "",
    this.pontosDeVida = 30,
    this.equipamentos = "",
    this.talentos = "",
    this.habilidades = "",
  });

  Personagem.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nome = json["nome"],
        level = json["level"],
        fraquezas = json["fraquezas"],
        pontosDeVida = json["pontosDeVida"],
        equipamentos = json["equipamentos"],
        talentos = json["talentos"],
        habilidades = json["habilidades"];

  Personagem copyWith({
    int? id,
    String? nome,
    int? level,
    String? fraquezas,
    int? pontosDeVida,
    String? equipamentos,
    String? talentos,
    String? habilidades,
  }) {
    return Personagem(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      level: level ?? this.level,
      fraquezas: fraquezas ?? this.fraquezas,
      pontosDeVida: pontosDeVida ?? this.pontosDeVida,
      equipamentos: equipamentos ?? this.equipamentos,
      talentos: talentos ?? this.talentos,
      habilidades: habilidades ?? this.habilidades,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Personagem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          level == other.level &&
          fraquezas == other.fraquezas &&
          pontosDeVida == other.pontosDeVida &&
          equipamentos == other.equipamentos &&
          talentos == other.talentos &&
          habilidades == other.habilidades;

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      level.hashCode ^
      fraquezas.hashCode ^
      pontosDeVida.hashCode ^
      equipamentos.hashCode ^
      talentos.hashCode ^
      habilidades.hashCode;
}

const Map<PericiasType, AtributosType> mapExpertisesToStatus = {
  PericiasType.Acrobacia: AtributosType.Destreza,
  PericiasType.Arcanismo: AtributosType.Inteligencia,
  PericiasType.Atletismo: AtributosType.Forca,
  PericiasType.Atuacao: AtributosType.Carisma,
  PericiasType.Enganacao: AtributosType.Carisma,
  PericiasType.Furtividade: AtributosType.Destreza,
  PericiasType.Intimidacao: AtributosType.Carisma,
  PericiasType.Intuicao: AtributosType.Sabedoria,
  PericiasType.Investigacao: AtributosType.Carisma,
  PericiasType.LidarComAnimais: AtributosType.Sabedoria,
  PericiasType.Medicina: AtributosType.Sabedoria,
  PericiasType.Persuacao: AtributosType.Carisma,
  PericiasType.Percepcao: AtributosType.Sabedoria,
  PericiasType.InstintoDeSobrevivencia: AtributosType.Sabedoria,
};
