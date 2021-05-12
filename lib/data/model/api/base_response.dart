
import 'package:flutter_base_by_minhnv/data/model/api/list_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';
import 'login/sign_in_response.dart';

class BaseResponse<T> {
  final int? success;
  final T? data;
  final ErrorMessage? error;

  BaseResponse(this.success, this.data, this.error);

  bool isSuccess() {
    return success == 1 && success != null;
  }

  factory BaseResponse.fromJson(dynamic json, Type type) {
    return BaseResponse(
        json['success'] == null ? null : json['success'] as int?,
        json['data'] == null ? null : parseJson(type, json),
        json['error'] == null ? null : ErrorMessage.fromJson(json['error'])
    );
  }

  static parseJson(Type type, dynamic json) {
    switch (type) {
      case SignInResponse:
        return SignInResponse.fromJson(json['data']);
      case ListResponse:
        List<dynamic> products = json['data'] as List;
        return products.map((e) => Product.fromJson(e)).toList();
      default:
        throw Exception("Missing method fromJson from: $type");
    }
  }
}

class ErrorMessage {
  final String? errorCode;
  final String? errorMessage;

  ErrorMessage(this.errorCode, this.errorMessage);

  factory ErrorMessage.fromJson(dynamic json) {
    return ErrorMessage(
      json['error_code'] as String?,
      json['error_message'] as String?
    );
  }
}