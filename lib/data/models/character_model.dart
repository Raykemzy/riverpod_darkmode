// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    this.data,
  });

  Data? data;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.characters,
  });

  Characters? characters;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        characters: Characters.fromJson(json["characters"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "characters": characters!.toJson(),
      };
}

class Characters {
  Characters({
    this.results,
  });

  List<Result>? results;

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        results: json['results'] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.image,
  });

  String? name;
  String? image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
