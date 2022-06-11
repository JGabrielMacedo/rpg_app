import 'package:rpg_app/lib/models/status_type_enum.dart';

class Equipments {
  String name;
   Map<StatusType, int> attributesAffected;

  Equipments(this.name, this.attributesAffected);
}
