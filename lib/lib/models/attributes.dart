import 'package:rpg_app/lib/models/status_type_enum.dart';

class Attributes {
  int strength;
  int dexterity;
  int constitution;
  int intelligence;
  int wisdom;
  int charisma;

  Attributes({
    this.strength = 0,
    this.dexterity = 0,
    this.constitution = 0,
    this.intelligence = 0,
    this.wisdom = 0,
    this.charisma = 0,
  });

  int getAtribbuteBy(StatusType type) {
    switch (type) {
      case StatusType.Forca:
        return strength;
      case StatusType.Destreza:
        return dexterity;
      case StatusType.Constituicao:
        return constitution;
      case StatusType.Inteligencia:
        return intelligence;
      case StatusType.Sabedoria:
        return wisdom;
      case StatusType.Carisma:
        return charisma;
    }
  }

  void decreaseAttribute(StatusType statusType) {
    switch (statusType) {
      case StatusType.Forca:
        strength--;
        break;
      case StatusType.Destreza:
        dexterity--;
        break;
      case StatusType.Constituicao:
        constitution--;
        break;
      case StatusType.Inteligencia:
        intelligence--;
        break;
      case StatusType.Sabedoria:
        wisdom--;
        break;
      case StatusType.Carisma:
        charisma--;
        break;
    }
  }

  void increaseAttribute(StatusType statusType) {
    switch (statusType) {
      case StatusType.Forca:
        strength++;
        break;
      case StatusType.Destreza:
        dexterity++;
        break;
      case StatusType.Constituicao:
        constitution++;
        break;
      case StatusType.Inteligencia:
        intelligence++;
        break;
      case StatusType.Sabedoria:
        wisdom++;
        break;
      case StatusType.Carisma:
        charisma++;
        break;
    }
  }
}
