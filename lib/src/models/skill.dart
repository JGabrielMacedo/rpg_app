class Habilidade {
  int level;
  String effect;

  Habilidade({
    required this.level,
    required this.effect,
  });

  Map<String, dynamic> toJson() {
    return {
      "level": this.level,
      "effect": this.effect,
    };
  }

  Habilidade.fromJson(Map<String, dynamic> json)
      : level = int.parse(json["level"]),
        effect = json["effect"];
}
