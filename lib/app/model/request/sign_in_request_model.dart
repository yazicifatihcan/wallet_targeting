import 'package:background_json_parser/background_json_parser.dart';

class SignInRequestModel extends IBaseModel<SignInRequestModel>{
    String email;
    String password;
    String fcmToken;

    SignInRequestModel({
        required this.email,
        required this.password,
        required this.fcmToken,
    });

    @override
    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "fcmToken":fcmToken,
    };
    
      @override
      SignInRequestModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
      }
}
