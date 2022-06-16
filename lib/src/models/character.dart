import 'package:rpg_app/lib/models/attributes.dart';
import 'package:rpg_app/lib/models/equipments.dart';
import 'package:rpg_app/lib/models/expertise.dart';
import 'package:rpg_app/lib/models/expertises_types_enum.dart';
import 'package:rpg_app/lib/models/skill.dart';
import 'package:rpg_app/lib/models/status_type_enum.dart';
import 'package:rpg_app/lib/models/talent.dart';

class Character {
  String nome;
  int level;
  String fraquezas;
  int pontosDeVida;
  Attributes? atributos;
  Pericia? pericias;
  List<Equipamento>? equipamentos;
  List<Talento>? talentos;
  List<Habilidade>? habilidades;

  Character(
    this.nome, {
    this.level = 1,
    this.fraquezas = "",
    this.pontosDeVida = 30,
    this.atributos,
    this.equipamentos,
    this.talentos,
    this.habilidades,
    this.pericias,
  }) {
    pericias = Pericia();
    equipamentos = [];
    talentos = [];
    habilidades = [];
    atributos = Attributes();
  }

  Character.fromJson(Map<String, dynamic> json)
      : nome = json["nome"],
        level = int.parse(json["level"]),
        fraquezas = json["fraquezas"],
        pontosDeVida = int.parse(json["pontosDeVida"]),
        atributos = Attributes.fromJson(json["atributos"]),
        pericias = Pericia.fromJson(json["pericias"]),
        equipamentos = [],
        talentos = [],
        habilidades = [] {
    if (json["equipamentos"] != null) {
      for (Map<String, dynamic> equipamento in json["equipamentos"]) {
        equipamentos?.add(Equipamento.fromJson(equipamento));
      }
    }

    if (json["talentos"] != null) {
      for (Map<String, dynamic> talento in json["talentos"]) {
        talentos?.add(Talento.fromJson(talento));
      }
    }

    if (json["habilidades"] != null) {
      for (Map<String, dynamic> habilidade in json["habilidades"]) {
        habilidades?.add(Habilidade.fromJson(habilidade));
      }
    }
  }
}

const Map<ExpertisesType, StatusType> mapExpertisesToStatus = {
  ExpertisesType.Acrobacia: StatusType.Destreza,
  ExpertisesType.Arcanismo: StatusType.Inteligencia,
  ExpertisesType.Atletismo: StatusType.Forca,
  ExpertisesType.Atuacao: StatusType.Carisma,
  ExpertisesType.Enganacao: StatusType.Carisma,
  ExpertisesType.Furtividade: StatusType.Destreza,
  ExpertisesType.Intimidacao: StatusType.Carisma,
  ExpertisesType.Intuicao: StatusType.Sabedoria,
  ExpertisesType.Investigacao: StatusType.Carisma,
  ExpertisesType.LidarComAnimais: StatusType.Sabedoria,
  ExpertisesType.Medicina: StatusType.Sabedoria,
  ExpertisesType.Persuacao: StatusType.Carisma,
  ExpertisesType.Percepcao: StatusType.Sabedoria,
  ExpertisesType.Religiao: StatusType.Inteligencia,
  ExpertisesType.InstintoDeSobrevivencia: StatusType.Sabedoria,
};
