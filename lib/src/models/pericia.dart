import 'package:equatable/equatable.dart';
import 'package:rpg_app/src/models/expertises_types_enum.dart';

class Pericia {
  final int id;
  final int acrobacia;
  final int arcanismo;
  final int atletismo;
  final int atuacao;
  final int enganacao;
  final int furtividade;
  final int intimidacao;
  final int intuicao;
  final int investigacao;
  final int lidarComAnimais;
  final int medicina;
  final int persuasao;
  final int percepcao;
  final int instintoDeSobrevivencia;

  const Pericia({
    this.id = 0,
    this.acrobacia = 0,
    this.arcanismo = 0,
    this.atletismo = 0,
    this.atuacao = 0,
    this.enganacao = 0,
    this.furtividade = 0,
    this.intimidacao = 0,
    this.intuicao = 0,
    this.investigacao = 0,
    this.lidarComAnimais = 0,
    this.medicina = 0,
    this.persuasao = 0,
    this.percepcao = 0,
    this.instintoDeSobrevivencia = 0,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'acrobacia': acrobacia,
        'arcanismo': arcanismo,
        'atletismo': atletismo,
        'atuacao': atuacao,
        'enganacao': enganacao,
        'furtividade': furtividade,
        'intimidacao': intimidacao,
        'intuicao': intuicao,
        'investigacao': investigacao,
        'lidarComAnimais': lidarComAnimais,
        'medicina': medicina,
        'persuasao': persuasao,
        'percepcao': percepcao,
        'instintoDeSobrevivencia': instintoDeSobrevivencia,
      };

  Pericia.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        acrobacia = json['acrobacia'] ?? 0,
        arcanismo = json['arcanismo'] ?? 0,
        atletismo = json['atletismo'] ?? 0,
        atuacao = json['atuacao'] ?? 0,
        enganacao = json['enganacao'] ?? 0,
        furtividade = json['furtividade'] ?? 0,
        intimidacao = json['intimidacao'] ?? 0,
        intuicao = json['intuicao'] ?? 0,
        investigacao = json['investigacao'] ?? 0,
        lidarComAnimais = json['lidarComAnimais'] ?? 0,
        medicina = json['medicina'] ?? 0,
        persuasao = json['persuasao'] ?? 0,
        percepcao = json['percepcao'] ?? 0,
        instintoDeSobrevivencia = json['instintoDeSobrevivencia'] ?? 0;

  Pericia copyWith({
    int? id,
    int? acrobacia,
    int? arcanismo,
    int? atletismo,
    int? atuacao,
    int? enganacao,
    int? furtividade,
    int? intimidacao,
    int? intuicao,
    int? investigacao,
    int? lidarComAnimais,
    int? medicina,
    int? persuasao,
    int? percepcao,
    int? instintoDeSobrevivencia,
  }) {
    return Pericia(
      id: id ?? this.id,
      acrobacia: acrobacia ?? this.acrobacia,
      arcanismo: arcanismo ?? this.arcanismo,
      atletismo: atletismo ?? this.atletismo,
      atuacao: atuacao ?? this.atuacao,
      enganacao: enganacao ?? this.enganacao,
      furtividade: furtividade ?? this.furtividade,
      intimidacao: intimidacao ?? this.intimidacao,
      intuicao: intuicao ?? this.intuicao,
      investigacao: investigacao ?? this.investigacao,
      lidarComAnimais: lidarComAnimais ?? this.lidarComAnimais,
      medicina: medicina ?? this.medicina,
      persuasao: persuasao ?? this.persuasao,
      percepcao: percepcao ?? this.percepcao,
      instintoDeSobrevivencia: instintoDeSobrevivencia ?? this.instintoDeSobrevivencia,
    );
  }
}

const Map<PericiasType, int> mapPericiasTypeToindex = {
  PericiasType.Acrobacia: 0,
  PericiasType.Arcanismo: 1,
  PericiasType.Atletismo: 2,
  PericiasType.Atuacao: 3,
  PericiasType.Enganacao: 4,
  PericiasType.Furtividade: 5,
  PericiasType.Intimidacao: 6,
  PericiasType.Intuicao: 7,
  PericiasType.Investigacao: 8,
  PericiasType.LidarComAnimais: 9,
  PericiasType.Medicina: 10,
  PericiasType.Persuacao: 11,
  PericiasType.Percepcao: 12,
  PericiasType.InstintoDeSobrevivencia: 13,
};

const List<PericiasType> mapIndexToPericiasType = [
  PericiasType.Acrobacia,
  PericiasType.Arcanismo,
  PericiasType.Atletismo,
  PericiasType.Atuacao,
  PericiasType.Enganacao,
  PericiasType.Furtividade,
  PericiasType.Intimidacao,
  PericiasType.Intuicao,
  PericiasType.Investigacao,
  PericiasType.LidarComAnimais,
  PericiasType.Medicina,
  PericiasType.Persuacao,
  PericiasType.Percepcao,
  PericiasType.InstintoDeSobrevivencia,
];

const Map<PericiasType, String> mapPericiasTypeToString = {
  PericiasType.Acrobacia: "acrobacia",
  PericiasType.Arcanismo: "arcanismo",
  PericiasType.Atletismo: "atletismo",
  PericiasType.Atuacao: "atuacao",
  PericiasType.Enganacao: "enganacao",
  PericiasType.Furtividade: "furtividade",
  PericiasType.Intimidacao: "intimidacao",
  PericiasType.Intuicao: "intuicao",
  PericiasType.Investigacao: "investigacao",
  PericiasType.LidarComAnimais: "lidarComAnimais",
  PericiasType.Medicina: "medicina",
  PericiasType.Persuacao: "persuasao",
  PericiasType.Percepcao: "percepcao",
  PericiasType.InstintoDeSobrevivencia: "instintoDeSobrevivencia",
};
