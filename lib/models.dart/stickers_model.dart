// To parse this JSON data, do
//
//     final stickersImageData = stickersImageDataFromMap(jsonString);

import 'dart:convert';

class StickersImageData {
    StickersImageData({
       required this.status,
       required this.success,
       required this.message,
       required this.data,
    });

    int status;
    bool success;
    String message;
    Data data;

    factory StickersImageData.fromJson(String str) => StickersImageData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StickersImageData.fromMap(Map<String, dynamic> json) => StickersImageData(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toMap(),
    };
}

class Data {
    Data({
      required this.currentPage,
      required this.data,
      required this.from,
      required this.lastPage,
      required this.nextPageUrl,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total,
    });

    int currentPage;
    List<Datum> data;
    int from;
    int lastPage;
    String nextPageUrl;
    int perPage;
    String prevPageUrl;
    int to;
    int total;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        from: json["from"],
        lastPage: json["last_page"],
        nextPageUrl: json["next_page_url"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "from": from,
        "last_page": lastPage,
        "next_page_url": nextPageUrl,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    Datum({
        required this.id,
       required this.image,
    });

    int id;
    String image;

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
    };
}
