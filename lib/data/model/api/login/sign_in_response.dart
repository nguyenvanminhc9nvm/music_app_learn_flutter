
class SignInResponse {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  SignInResponse Function(dynamic json)? fromJson;

  SignInResponse(this.accessToken, this.tokenType, this.expiresIn);

  factory SignInResponse.fromJson(dynamic json) {
    return SignInResponse(
        json['access_token'] as String?,
        json['token_type'] as String?,
        json['expires_in'] as int?
    );
  }
}
