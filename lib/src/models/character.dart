import 'package:equatable/equatable.dart';
import 'package:rpg_app/src/models/atributos_enum.dart';
import 'package:rpg_app/src/models/expertises_types_enum.dart';

class Personagem {
  final int id;
  final String nome;
  final int level;
  final String fraquezas;
  final int pontosTotaisDeVida;
  final int pontosDeVidaAtuais;
  final int pontosTotaisDePoder;
  final int pontosDePoderAtuais;
  final String equipamentos;
  final String talentos;
  final String habilidades;

  const Personagem({
    this.nome = "",
    this.id = 0,
    this.level = 1,
    this.fraquezas = "",
    this.pontosTotaisDeVida = 30,
    this.pontosDeVidaAtuais = 30,
    this.pontosTotaisDePoder = 30,
    this.pontosDePoderAtuais = 30,
    this.equipamentos = "",
    this.talentos = "",
    this.habilidades = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
      "level": level,
      "fraquezas": fraquezas,
      "pontosTotaisDeVida": pontosTotaisDeVida,
      "pontosDeVidaAtuais": pontosDeVidaAtuais,
      "pontosTotaisDePoder": pontosTotaisDePoder,
      "pontosDePoderAtuais": pontosDePoderAtuais,
      "equipamentos": equipamentos,
      "talentos": talentos,
      "habilidades": habilidades,
    };
  }

  Personagem.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nome = json["nome"],
        level = json["level"],
        fraquezas = json["fraquezas"],
        pontosTotaisDeVida = json["pontosTotaisDeVida"],
        pontosDeVidaAtuais = json["pontosDeVidaAtuais"],
        pontosTotaisDePoder = json["pontosTotaisDePoder"],
        pontosDePoderAtuais = json["pontosDePoderAtuais"],
        equipamentos = json["equipamentos"],
        talentos = json["talentos"],
        habilidades = json["habilidades"];

  Personagem copyWith({
    int? id,
    String? nome,
    int? level,
    String? fraquezas,
    int? pontosTotaisDeVida,
    int? pontosDeVidaAtuais,
    int? pontosTotaisDePoder,
    int? pontosDePoderAtuais,
    String? equipamentos,
    String? talentos,
    String? habilidades,
  }) {
    return Personagem(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      level: level ?? this.level,
      fraquezas: fraquezas ?? this.fraquezas,
      pontosTotaisDeVida: pontosTotaisDeVida ?? this.pontosTotaisDeVida,
      pontosDeVidaAtuais: pontosDeVidaAtuais ?? this.pontosDeVidaAtuais,
      pontosTotaisDePoder: pontosTotaisDePoder ?? this.pontosTotaisDePoder,
      pontosDePoderAtuais: pontosDePoderAtuais ?? this.pontosDePoderAtuais,
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
          pontosTotaisDeVida == other.pontosTotaisDeVida &&
          pontosDeVidaAtuais == other.pontosDeVidaAtuais &&
          pontosTotaisDePoder == other.pontosTotaisDePoder &&
          pontosDePoderAtuais == other.pontosDePoderAtuais &&
          equipamentos == other.equipamentos &&
          talentos == other.talentos &&
          habilidades == other.habilidades;

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      level.hashCode ^
      fraquezas.hashCode ^
      pontosTotaisDeVida.hashCode ^
      pontosDeVidaAtuais.hashCode ^
      pontosTotaisDePoder.hashCode ^
      pontosDePoderAtuais.hashCode ^
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
