import 'package:equatable/equatable.dart';
import 'package:rpg_app/src/models/atributos_enum.dart';

class Atributos {
  final int id;
  final int forca;
  final int destreza;
  final int constituicao;
  final int inteligencia;
  final int sabedoria;
  final int carisma;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Atributos &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          forca == other.forca &&
          destreza == other.destreza &&
          constituicao == other.constituicao &&
          inteligencia == other.inteligencia &&
          sabedoria == other.sabedoria &&
          carisma == other.carisma;

  @override
  int get hashCode =>
      id.hashCode ^
      forca.hashCode ^
      destreza.hashCode ^
      constituicao.hashCode ^
      inteligencia.hashCode ^
      sabedoria.hashCode ^
      carisma.hashCode;

  const Atributos({
    this.id = 0,
    this.forca = 0,
    this.destreza = 0,
    this.constituicao = 0,
    this.inteligencia = 0,
    this.sabedoria = 0,
    this.carisma = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "forca": forca,
      "destreza": destreza,
      "constituicao": constituicao,
      "inteligencia": inteligencia,
      "sabedoria": sabedoria,
      "carisma": carisma,
    };
  }

  Atributos.fromJson(Map<String, dynamic> data)
      : id = data["id"],
        forca = data["forca"],
        destreza = data["destreza"],
        constituicao = data["constituicao"],
        inteligencia = data["inteligencia"],
        sabedoria = data["sabedoria"],
        carisma = data["carisma"];

  Atributos copyWith({
    int? id,
    int? forca,
    int? destreza,
    int? constituicao,
    int? inteligencia,
    int? sabedoria,
    int? carisma,
  }) {
    return Atributos(
      id: id ?? this.id,
      forca: forca ?? this.forca,
      destreza: destreza ?? this.destreza,
      constituicao: constituicao ?? this.constituicao,
      inteligencia: inteligencia ?? this.inteligencia,
      sabedoria: sabedoria ?? this.sabedoria,
      carisma: carisma ?? this.carisma,
    );
  }
}

const Map<AtributosType, int> mapAtributoToInt = {
  AtributosType.Forca: 0,
  AtributosType.Destreza: 1,
  AtributosType.Constituicao: 2,
  AtributosType.Inteligencia: 3,
  AtributosType.Sabedoria: 4,
  AtributosType.Carisma: 5,
};

const Map<AtributosType, String> mapAtributoTypeToString = {
  AtributosType.Forca: "forca",
  AtributosType.Destreza: "destreza",
  AtributosType.Constituicao: "constituicao",
  AtributosType.Inteligencia: "inteligencia",
  AtributosType.Sabedoria: "sabedoria",
  AtributosType.Carisma: "carisma",
};

const List<AtributosType> mapIntToAtributoType = [
  AtributosType.Forca,
  AtributosType.Destreza,
  AtributosType.Constituicao,
  AtributosType.Inteligencia,
  AtributosType.Sabedoria,
  AtributosType.Carisma,
];
