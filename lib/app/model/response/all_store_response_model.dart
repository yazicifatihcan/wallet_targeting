import 'package:background_json_parser/background_json_parser.dart';

class AllStoreResponseModel extends IBaseModel<AllStoreResponseModel>{
    String? id;
    String? title;
    String? content;
    List<String>? imageUrls;
    String? createdByUserId;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<dynamic>? criteria;
    bool? isAvailable;

    AllStoreResponseModel({
        this.id,
        this.title,
        this.content,
        this.imageUrls,
        this.createdByUserId,
        this.createdAt,
        this.updatedAt,
        this.criteria,
        this.isAvailable,
    });


    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "imageUrls": imageUrls == null ? [] : List<dynamic>.from(imageUrls!.map((x) => x)),
        "createdByUserId": createdByUserId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "criteria": criteria == null ? [] : List<dynamic>.from(criteria!.map((x) => x)),
        "isAvailable": isAvailable,
    };
    
      @override
      AllStoreResponseModel fromJson(Map<String, dynamic> json) =>AllStoreResponseModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrls: json["imageUrls"] == null ? [] : List<String>.from(json["imageUrls"]!.map((x) => x)),
        createdByUserId: json["createdByUserId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        criteria: json["criteria"] == null ? [] : List<dynamic>.from(json["criteria"]!.map((x) => x)),
        isAvailable: json["isAvailable"],
    );
}
