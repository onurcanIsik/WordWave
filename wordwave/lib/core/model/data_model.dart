// To parse this JSON data, do
//
//     final datas = datasFromJson(jsonString);

import 'dart:convert';

class Datas {
  String title;
  List<String> names;

  Datas({
    required this.title,
    required this.names,
  });

  factory Datas.fromRawJson(String str) => Datas.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        title: json["title"],
        names: List<String>.from(json["names"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "names": List<dynamic>.from(names.map((x) => x)),
      };
}
