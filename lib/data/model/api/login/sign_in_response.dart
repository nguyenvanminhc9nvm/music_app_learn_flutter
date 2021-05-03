
import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';

class SignInResponse implements ResponseInner {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;

  SignInResponse(this.accessToken, this.tokenType, this.expiresIn);

  factory SignInResponse.fromJson(dynamic json) {
    return SignInResponse(
        json['access_token'] as String?,
        json['token_type'] as String?,
        json['expires_in'] as int?
    );
  }

  @override
  ResponseInner fromJson(json) {
    return SignInResponse(
        json['access_token'] as String?,
        json['token_type'] as String?,
        json['expires_in'] as int?
    );
  }

}
