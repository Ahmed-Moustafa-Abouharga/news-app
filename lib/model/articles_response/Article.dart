

import '../sources_resposnse/Sources.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Kevin Purdy, Ars Technica"
/// title : "Universal Plug-and-Charge for EV Charging Stations Is Set to Launch in 2025"
/// description : "Next year, you won't need to download yet another app to use an EV charger from an unfamiliar brand. Most of the major EV makers and charging networks are on board."
/// url : "https://www.wired.com/story/universal-plug-and-charge-for-evs-launches-in-2025/"
/// urlToImage : "https://media.wired.com/photos/6750ec0728e60fd968b91d84/191:100/w_1280,c_limit/Gear_EVCharging_GettyImages-1564615208.jpg"
/// publishedAt : "2024-12-05T17:20:00Z"
/// content : "To fill a car with gas, you generally just need a credit card or cash. To charge an EV at a DC fast charging station, you need any number of things to worka credit card reader, an app for that charge… [+2993 chars]"

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
