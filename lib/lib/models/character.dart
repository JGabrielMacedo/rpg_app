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

const Map<ExpertisesType, StatusType> relacaoExpertisesToStatus = {
  ExpertisesType.acrobacia: StatusType.dexterity,
  ExpertisesType.arcanismo: StatusType.intelligence,
  ExpertisesType.atletismo: StatusType.strength,
  ExpertisesType.atuacao: StatusType.charisma,
  ExpertisesType.enganacao: StatusType.charisma,
  ExpertisesType.furtividade: StatusType.dexterity,
  ExpertisesType.intimidacao: StatusType.charisma,
  ExpertisesType.intuicao: StatusType.wisdom,
  ExpertisesType.investigacao: StatusType.charisma,
  ExpertisesType.lidarComAnimais: StatusType.wisdom,
  ExpertisesType.medicina: StatusType.wisdom,
  ExpertisesType.persuacao: StatusType.charisma,
  ExpertisesType.percepcao: StatusType.wisdom,
  ExpertisesType.religiao: StatusType.intelligence,
  ExpertisesType.instintoDeSobrevivencia: StatusType.wisdom,
};
