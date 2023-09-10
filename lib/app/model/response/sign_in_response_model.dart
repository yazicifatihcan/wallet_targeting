import 'package:background_json_parser/background_json_parser.dart';

class SignInAndSignUpResponseModel extends IBaseModel<SignInAndSignUpResponseModel> {
  String? accessToken;
  User? user;

  SignInAndSignUpResponseModel({
    this.accessToken,
    this.user,
  });

  @override
  SignInAndSignUpResponseModel fromJson(Map<String, dynamic> json) => SignInAndSignUpResponseModel(
        accessToken: json["access_token"],
        user: json["user"] == null ? null : User().fromJson(json["user"]),
      );

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class User extends IBaseModel<User> {
  String? id;
  String? email;
  String? username;
  String? imageUrl;
  double? balance;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.email,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.balance
  });

  @override
  User fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        balance: json["balance"].toDouble(),
        imageUrl: json["imageUrl"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
