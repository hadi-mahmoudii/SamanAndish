import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../Config/urls.dart';

import '../Config/app_session.dart';
import '../Widgets/error_result.dart';

class ServerRequest {
  // Future<Either<ErrorResult, List>> fetchDatas(String url,
  //     {List<dynamic>? datas}) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: {
  //         'X-Requested-With': 'XMLHttpRequest',
  //         'Authorization': AppSession.token,
  //       },
  //     );
  //     // // print(response.statusCode);
  //     // print(response.body);
  //     var values = json.decode(response.body);
  //     return Right(values);
  //   } catch (e) {
  //     return Left(ErrorResult.fromException(e));
  //   }
  // }

  Future<Either<ErrorResult, dynamic>> fetchData(String url,
      {List<dynamic>? datas, Map<String, String>? header}) async {
    Map<String, String>? requestHeader = {
      'X-Requested-With': 'XMLHttpRequest',
      'origin': Urls.domain,
      'Authorization': AppSession.token,
    };
    if (header != null) requestHeader = header;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: requestHeader,
      );
      var values = json.decode(response.body);
      return Right(values);
    } catch (e) {
      return Left(ErrorResult.fromException(e));
    }
  }

  Future<Either<ErrorResult, dynamic>> sendData(String url,
      {Map? datas, Map<String, String>? header}) async {
    Map<String, String>? requestHeader = {
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': AppSession.token,
      "Content-Type": "application/json",
      "Accept": "application/json",
      'origin': Urls.domain,
    };
    if (header != null) requestHeader = header;
    try {
      // print(AppSession.token);
      final response = await http.post(
        Uri.parse(url),
        headers: requestHeader,
        body: json.encode(datas),
      );
      // print(json.encode(datas)  );
      // print(response.body);
      var values = json.decode(response.body);
      return Right(values);
    } catch (e) {
      return Left(ErrorResult.fromException(e));
    }
  }

  Future<Either<ErrorResult, dynamic>> updateData(String url,
      {Map? datas}) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'Authorization': AppSession.token,
          'origin': Urls.domain,
          'Accept': 'application/json',
        },
        body: datas,
      );
      var values = json.decode(response.body);
      return Right(values);
    } catch (e) {
      return Left(ErrorResult.fromException(e));
    }
  }

  Future<Either<ErrorResult, dynamic>> deleteData(String url,
      {List<dynamic>? datas}) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'Authorization': AppSession.token,
          'origin': Urls.domain,
          'Accept': 'application/json',
        },
      );
      var values = json.decode(response.body);
      return Right(values);
    } catch (e) {
      return Left(ErrorResult.fromException(e));
    }
  }
}
