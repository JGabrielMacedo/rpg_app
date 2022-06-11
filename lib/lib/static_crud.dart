import 'package:rpg_app/lib/models/character.dart';
import 'package:rpg_app/lib/models/expertises_types_enum.dart';
import 'package:rpg_app/lib/models/status_type_enum.dart';

class SampleCrud {
  static Character? _character;

  static Character get character {
    _character ??= Character("YourPerson");
    return _character!;
  }

  static void increaseAttribute({required StatusType statusType}) =>
      character.attributes?.increaseAttribute(statusType);

  static void decreaseAttribute({required StatusType statusType}) =>
      character.attributes?.decreaseAttribute(statusType);

  static void changeCharacterName(String name) => character.name = name;

  static void increaseExpertise(ExpertisesType type) =>
      character.expertises?.increaseExpertise(type);

  static void decreaseExpertise(ExpertisesType type) =>
      character.expertises?.decreaseExpertise(type);
}
