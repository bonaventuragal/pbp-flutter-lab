// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);
import 'dart:convert';

List<WatchList> watchListFromJson(String str) =>
    List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String watchListToJson(List<WatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
  WatchList({
    required this.rating,
    required this.releaseDate,
    required this.title,
    required this.watched,
    required this.review,
  });

  double rating;
  String releaseDate;
  String title;
  bool watched;
  String review;

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        rating: json["fields"]["rating"].toDouble(),
        releaseDate: json["fields"]["release_date"],
        title: json["fields"]["title"],
        watched: json["fields"]["watched"],
        review: json["fields"]["review"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "release_date": releaseDate,
        "title": title,
        "watched": watched,
        "review": review,
      };
}
