import 'package:background_json_parser/background_json_parser.dart';

class StoreItemsResponseModel extends IBaseModel<StoreItemsResponseModel> {
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

    StoreItemsResponseModel({
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
    };
    
      @override
      StoreItemsResponseModel fromJson(Map<String, dynamic> json) =>StoreItemsResponseModel(
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
    );

}
