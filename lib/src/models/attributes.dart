import 'package:rpg_app/lib/models/status_type_enum.dart';

class Attributes {
  int forca;
  int destreza;
  int constituicao;
  int inteligencia;
  int sabedoria;
  int carisma;

  Attributes({
    this.forca = 0,
    this.destreza = 0,
    this.constituicao = 0,
    this.inteligencia = 0,
    this.sabedoria = 0,
    this.carisma = 0,
  });

  int getAtribbuteBy(StatusType type) {
    switch (type) {
      case StatusType.Forca:
        return forca;
      case StatusType.Destreza:
        return destreza;
      case StatusType.Constituicao:
        return constituicao;
      case StatusType.Inteligencia:
        return inteligencia;
      case StatusType.Sabedoria:
        return sabedoria;
      case StatusType.Carisma:
        return carisma;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "forca": forca,
      "destreza": destreza,
      "constituicao": constituicao,
      "inteligencia": inteligencia,
      "sabedoria": sabedoria,
      "carisma": carisma,
    };
  }

  Attributes.fromJson(Map<String, dynamic> data)
      : forca = data["forca"],
        destreza = data["destreza"],
        constituicao = data["constituicao"],
        inteligencia = data["inteligencia"],
        sabedoria = data["sabedoria"],
        carisma = data["carisma"];

  void decreaseAttribute(StatusType statusType) {
    switch (statusType) {
      case StatusType.Forca:
        forca--;
        break;
      case StatusType.Destreza:
        destreza--;
        break;
      case StatusType.Constituicao:
        constituicao--;
        break;
      case StatusType.Inteligencia:
        inteligencia--;
        break;
      case StatusType.Sabedoria:
        sabedoria--;
        break;
      case StatusType.Carisma:
        carisma--;
        break;
    }
  }

  void increaseAttribute(StatusType statusType) {
    switch (statusType) {
      case StatusType.Forca:
        forca++;
        break;
      case StatusType.Destreza:
        destreza++;
        break;
      case StatusType.Constituicao:
        constituicao++;
        break;
      case StatusType.Inteligencia:
        inteligencia++;
        break;
      case StatusType.Sabedoria:
        sabedoria++;
        break;
      case StatusType.Carisma:
        carisma++;
        break;
    }
  }
}
