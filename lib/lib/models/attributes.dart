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
      case StatusType.strength:
        return strength;
      case StatusType.dexterity:
        return dexterity;
      case StatusType.constitution:
        return constitution;
      case StatusType.intelligence:
        return intelligence;
      case StatusType.wisdom:
        return wisdom;
      case StatusType.charisma:
        return charisma;
    }
  }

  void decreaseAttribute(StatusType statusType) {
    switch (statusType) {
      case StatusType.strength:
        strength++;
        break;
      case StatusType.dexterity:
        dexterity++;
        break;
      case StatusType.constitution:
        constitution++;
        break;
      case StatusType.intelligence:
        intelligence++;
        break;
      case StatusType.wisdom:
        wisdom++;
        break;
      case StatusType.charisma:
        charisma++;
        break;
    }
  }

  void increaseAttribute(StatusType statusType) {
    switch (statusType) {
      case StatusType.strength:
        strength++;
        break;
      case StatusType.dexterity:
        dexterity++;
        break;
      case StatusType.constitution:
        constitution++;
        break;
      case StatusType.intelligence:
        intelligence++;
        break;
      case StatusType.wisdom:
        wisdom++;
        break;
      case StatusType.charisma:
        charisma++;
        break;
    }
  }
}
