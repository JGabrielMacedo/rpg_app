import 'package:rpg_app/lib/models/attributes.dart';
import 'package:rpg_app/lib/models/equipments.dart';
import 'package:rpg_app/lib/models/expertise.dart';
import 'package:rpg_app/lib/models/expertises_types_enum.dart';
import 'package:rpg_app/lib/models/skill.dart';
import 'package:rpg_app/lib/models/status_type_enum.dart';
import 'package:rpg_app/lib/models/talent.dart';

class Character {
  String name;
  int level;
  String fraquezas;
  int life;
  Attributes? attributes;
  Expertise? expertises;
  List<Equipments>? equipments;
  List<Talent>? talents;
  List<Skill>? habilidade;

  Character(
    this.name, {
    this.level = 1,
    this.fraquezas = "",
    this.life = 30,
    this.attributes,
    this.equipments,
    this.talents,
    this.habilidade,
    this.expertises,
  }) {
    expertises = Expertise();
    equipments = [];
    talents = [];
    habilidade = [];
    attributes = Attributes();
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
