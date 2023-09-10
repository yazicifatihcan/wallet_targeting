import 'package:background_json_parser/background_json_parser.dart';

class AllCriteriaResponseModel extends IBaseModel<AllCriteriaResponseModel> {
    String? id;
    String? imageUrl;
    String? title;
    String? content;
    String? contractId;
    String? currency;
    String? itemValue;
    String? gameId;
    DateTime? createdAt;
    DateTime? updatedAt;
    Game? game;

    AllCriteriaResponseModel({
        this.id,
        this.imageUrl,
        this.title,
        this.content,
        this.contractId,
        this.currency,
        this.itemValue,
        this.gameId,
        this.createdAt,
        this.updatedAt,
        this.game,
    });

    @override
      Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "title": title,
        "content": content,
        "contractId": contractId,
        "currency": currency,
        "itemValue": itemValue,
        "gameId": gameId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "game": game?.toJson(),
    };
    
      @override
      AllCriteriaResponseModel fromJson(Map<String, dynamic> json) => AllCriteriaResponseModel(
        id: json["id"],
        imageUrl: json["imageUrl"],
        title: json["title"],
        content: json["content"],
        contractId: json["contractId"],
        currency: json["currency"],
        itemValue: json["itemValue"],
        gameId: json["gameId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        game: json["game"] == null ? null : Game.fromJson(json["game"]),
    );

}

class Game {
    String? id;
    String? title;
    String? content;
    List<String>? imageUrls;
    String? createdByUserId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Game({
        this.id,
        this.title,
        this.content,
        this.imageUrls,
        this.createdByUserId,
        this.createdAt,
        this.updatedAt,
    });

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrls: json["imageUrls"] == null ? [] : List<String>.from(json["imageUrls"]!.map((x) => x)),
        createdByUserId: json["createdByUserId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "imageUrls": imageUrls == null ? [] : List<dynamic>.from(imageUrls!.map((x) => x)),
        "createdByUserId": createdByUserId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
