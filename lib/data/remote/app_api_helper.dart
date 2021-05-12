import 'dart:convert';

import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/list_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';
import 'package:flutter_base_by_minhnv/data/remote/api_helper.dart';

import '../model/api/base_response.dart';
import '../model/api/login/sign_in_response.dart';

class AppApiHelper extends ApiHelper {
  static final AppApiHelper _singleton = AppApiHelper.internal();

  factory AppApiHelper() {
    return _singleton;
  }

  AppApiHelper.internal();

  @override
  Future<BaseResponse<SignInResponse>> doLogin(
      String username, String pass) async {
    print("correct acc");
    var response =
        '{"success": 1, "data": {"access_token": "this_is_token", "token_type": "bearer", "expires_in": 3600}}';
    var responseError =
        '{"success": 0, "data" : null, "error" : {"error_code" : "e404", "error_message": "page not found!"}}';
    final json = await jsonDecode(response);
    final baseResponse =
        BaseResponse<SignInResponse>.fromJson(json, SignInResponse);
    return Future.value(baseResponse);
  }

  @override
  Stream<BaseResponse<List<Product>>> doGetList() async* {
    print("do get list");
    var response =
        '{"success": 1, "data": [{"prodName" : "spa","prodContent": "this is content"}]}';
    final json = jsonDecode(response);
    final baseResponse =
        BaseResponse<List<Product>>.fromJson(json, ListResponse);
    yield baseResponse;
  }
}
