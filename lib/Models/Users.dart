class Cusers {
  String userName;
  String uid;
  String Gsm;

  String Role;
  String Email;
  String Url;

  /*


  * */
// from json to object cusers
  Cusers(
      {required this.uid,
      required this.userName,
      required this.Email,
      required this.Gsm,
      required this.Role,
      required this.Url});
  factory Cusers.fromJson(Map<String, dynamic>? json) {
    return Cusers(
      uid: json!["uid"],
      userName: json["name"],
      Email: json["email"],
      Role: json["role"],
      Gsm: json["Gsm"],
      Url: json["url"],
    );
  }
// from object to json
  Map<String, dynamic> Tojson() {
    return {
      "uid": uid,
      "name": userName,
      "email": Email,
      "role": Role,
      "url": Url
    };
  }
}
