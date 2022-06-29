// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    Task({
        required this.message,
        required this.data,
    });

    bool message;
    List<Datum> data;

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.title,
        required this.media,
        required this.v,
    });

    String id;
    String title;
    String media;
    int v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title:  json["title"],
        media: json["media"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "media": media,
        "__v": v,
    };
}

 

 
