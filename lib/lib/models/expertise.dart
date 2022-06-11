import 'package:rpg_app/lib/models/expertises_types_enum.dart';

class Expertise {
  List<int> statusInfluence = List.generate(expertises.length, (index) => 0);

  Expertise();

  void increaseExpertise(ExpertisesType type) {
    final int expertiseIndex = expertises[type]!;
    statusInfluence[expertiseIndex]++;
  }

  void decreaseExpertise(ExpertisesType type) {
    final int expertiseIndex = expertises[type]!;
    statusInfluence[expertiseIndex]--;
  }
}

const Map<ExpertisesType, int> expertises = {
  ExpertisesType.acrobacia: 0,
  ExpertisesType.arcanismo: 1,
  ExpertisesType.atletismo: 2,
  ExpertisesType.atuacao: 3,
  ExpertisesType.enganacao: 4,
  ExpertisesType.furtividade: 5,
  ExpertisesType.historia: 6,
  ExpertisesType.intimidacao: 7,
  ExpertisesType.intuicao: 8,
  ExpertisesType.investigacao: 9,
  ExpertisesType.lidarComAnimais: 10,
  ExpertisesType.medicina: 11,
  ExpertisesType.persuacao: 12,
  ExpertisesType.percepcao: 13,
  ExpertisesType.religiao: 14,
  ExpertisesType.instintoDeSobrevivencia: 15,
};
