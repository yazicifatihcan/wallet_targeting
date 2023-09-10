import 'package:background_json_parser/background_json_parser.dart';

class GameDetailResponseModel extends IBaseModel<GameDetailResponseModel> {
    String? id;
    String? title;
    String? content;
    List<String>? imageUrls;
    String? createdByUserId;
    DateTime? createdAt;
    DateTime? updatedAt;

    GameDetailResponseModel({
        this.id,
        this.title,
        this.content,
        this.imageUrls,
        this.createdByUserId,
        this.createdAt,
        this.updatedAt,
    });


    @override
      Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "imageUrls": imageUrls == null ? [] : List<dynamic>.from(imageUrls!.map((x) => x)),
        "createdByUserId": createdByUserId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
    
      @override
      GameDetailResponseModel fromJson(Map<String, dynamic> json) =>GameDetailResponseModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrls: json["imageUrls"] == null ? [] : List<String>.from(json["imageUrls"]!.map((x) => x)),
        createdByUserId: json["createdByUserId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );
}
