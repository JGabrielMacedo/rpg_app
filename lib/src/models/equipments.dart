import 'package:rpg_app/lib/models/status_type_enum.dart';

class Equipamento {
  String name;
  Map<StatusType, int> attributesAffected;

  Equipamento(this.name, this.attributesAffected);

  Equipamento.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        attributesAffected = json["attributesAffected"];

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "attributesAffected": attributesAffected,
    };
  }
}
