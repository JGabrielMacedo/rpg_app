class Talento {
  String talentDescription;

  Talento({this.talentDescription = ""});

  Talento.fromJson(Map<String, dynamic> json) : talentDescription = json["talentDescription"];

  Map<String, dynamic> toJson() {
    return {
      "talentDescription": talentDescription,
    };
  }
}
