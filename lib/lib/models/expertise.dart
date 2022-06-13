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
  ExpertisesType.Acrobacia: 0,
  ExpertisesType.Arcanismo: 1,
  ExpertisesType.Atletismo: 2,
  ExpertisesType.Atuacao: 3,
  ExpertisesType.Enganacao: 4,
  ExpertisesType.Furtividade: 5,
  ExpertisesType.historia: 6,
  ExpertisesType.Intimidacao: 7,
  ExpertisesType.Intuicao: 8,
  ExpertisesType.Investigacao: 9,
  ExpertisesType.LidarComAnimais: 10,
  ExpertisesType.Medicina: 11,
  ExpertisesType.Persuacao: 12,
  ExpertisesType.Percepcao: 13,
  ExpertisesType.Religiao: 14,
  ExpertisesType.InstintoDeSobrevivencia: 15,
};
