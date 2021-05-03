
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';

class BaseResponse {
  final int? success;
  final SignInResponse? data;
  final ErrorMessage? error;

  BaseResponse(this.success, this.data, this.error);

  bool isSuccess() {
    return success == 1 && success != null;
  }

  factory BaseResponse.fromJson(dynamic json) {
    return BaseResponse(
        json['success'] == null ? null : json['success'] as int?,
        json['data'] == null ? null : SignInResponse?.fromJson(json['data']),
        json['error'] == null ? null : ErrorMessage.fromJson(json['error'])
    );
  }
}
//
// class BaseResponse<T extends ResponseInner> {
//   final int? success;
//   final T? data;
//   final ErrorMessage? error;
//
//   BaseResponse(this.success, this.data, this.error);
//
//   bool isSuccess() {
//     return success == 1 && success != null;
//   }
//
//   factory BaseResponse.fromJson(dynamic json) {
//     return BaseResponse(
//         json['success'] == null ? null : json['success'] as int?,
//         json['data'] == null ? null : data?.fromJson(json['data']) as T?,
//         json['error'] == null ? null : ErrorMessage.fromJson(json['error'])
//     );
//   }
// }

abstract class ResponseInner {
  ResponseInner fromJson(dynamic json);
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