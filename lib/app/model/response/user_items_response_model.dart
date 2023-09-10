import 'package:background_json_parser/background_json_parser.dart';

class UserItemResponseModel extends IBaseModel<UserItemResponseModel> {
    String? id;
    String? imageUrl;
    String? title;
    String? content;
    String? contractId;
    bool? hasAlready;
    String? userId;
    DateTime? createdAt;
    DateTime? updatedAt;

    UserItemResponseModel({
        this.id,
        this.imageUrl,
        this.title,
        this.content,
        this.contractId,
        this.hasAlready,
        this.userId,
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
        "hasAlready": hasAlready,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
    
      @override
      UserItemResponseModel fromJson(Map<String, dynamic> json) =>UserItemResponseModel(
        id: json["id"],
        imageUrl: json["imageUrl"],
        title: json["title"],
        content: json["content"],
        contractId: json["contractId"],
        hasAlready: json["hasAlready"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );
}
