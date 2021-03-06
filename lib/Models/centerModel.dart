class CenterModel {
  String name;
  double latitude;
  double langitude;
  DateTime creationDate;
  String adresse;
  String Gsm;

  CenterModel({
    required this.name,
    required this.Gsm,
    required this.creationDate,
    required this.latitude,
    required this.langitude,
    required this.adresse,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) {
    return CenterModel(
      name: json["name"],
      Gsm: json["Gsm"],
      langitude: json["langitude"],
      latitude: json["latitude"],
      creationDate: json["creationDate"].toDate(),
      adresse: json["adresse"],
    );
  }
  Map<String, dynamic> Tojson() {
    return {
      "name": name,
      "latitude": latitude,
      "langitude": langitude,
      "creationDate": creationDate,
      "adresse": adresse,
      "Gsm": Gsm,
    };
  }
}
