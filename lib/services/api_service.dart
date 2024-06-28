import 'dart:convert';
import 'dart:ffi';
import 'package:coinspace/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as developer;

class APIService {
  final String _baseUrl = "http://127.0.0.1:3000"; //"extrader-sys.com";
  List<String> mt_versions = ['mt4', 'mt5'];
  final SecureStorage secureStorage = SecureStorage();

  // Example: GET request
  Future<dynamic> fetchData(String endpoint, int mt_type,
      {Map<String, dynamic>? queryParams}) async {
    if (mt_type < 0 || mt_type >= mt_versions.length) {
      throw ArgumentError('Invalid mt_type index: $mt_type');
    }
    String? cookie = await secureStorage.getPersistentCookie();
    developer.log('$cookie', name: 'cookie.get');
    Map<String, String> headers = {};
    if (cookie != null) {
      headers['Cookie'] = cookie;
    }
    String queryString =
        queryParams != null ? _encodeQueryParams(queryParams) : '';
    final url =
        'http://${mt_versions[mt_type]}.$_baseUrl/$endpoint?$queryString';
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      //need to improve for json and nonjson  response

      developer.log(response.headers.toString(), name: 'cookie.login.test');
      if (response.headers.containsKey('set-cookie')) {
        String cookieHeader = response.headers['set-cookie']!;
        final cookieNameValue = cookieHeader
            .split(';')
            .first; // Gets the first part, which should be "name=value"

        // Save the cookie to secure storage
        developer.log('setingCookie', name: 'cookie.login');
        await secureStorage.savePersistentCookie(cookieNameValue);
      }

      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String _encodeQueryParams(Map<String, dynamic> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');
  }

  // Example: POST request
  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    String? cookie = await secureStorage.getPersistentCookie();
    developer.log('$cookie', name: 'cookie.post');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (cookie != null) {
      headers['Cookie'] = cookie;
    }
    print("sending request");

    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    print("sent request");
    // return json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Raw response body: " + response.body);
      if (response.body == '') {
        return "OK"; //{ "msg": "OK"};
      }
      return json.decode(response.body);
    } else {
      var errRes = json.decode(response.body);
      var errMsg = "Whoops! Something went wrong.\n" + errRes["error"];
      
      Fluttertoast.showToast(
          msg: errMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
          return;
    }
  }

  // Add more methods for PUT, DELETE, etc., as needed
  Future<dynamic> connect({
    required String user,
    required String password,
    required String host,
    int port = 443,
  }) async {
    return fetchData('Connect', 0, queryParams: {
      'user': user,
      'password': password,
      'host': host,
      'port': port.toString(),
    });
  }

  Future<dynamic> subscribe(
      {required String access_token, required String symbol}) async {
    return fetchData('Subscribe', 0, queryParams: {
      'id': access_token,
      'symbol': symbol,
    });
  }

  Future<dynamic> subscribeMany(
      {required String access_token, int? interval = 0}) async {
    return fetchData('SubscribeMany', 0, queryParams: {
      'id': access_token,
      'interval': interval,
    });
  }
}
