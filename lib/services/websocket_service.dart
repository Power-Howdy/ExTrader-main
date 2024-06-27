import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:coinspace/services/secure_storage.dart';

class WebSocketService {
  late WebSocket _socket;
  final _controller = StreamController<dynamic>();
  final SecureStorage _secureStorage = SecureStorage();
  Stream<dynamic> get stream => _controller.stream;

  Future<void> connect(String url) async {
    try {
      var stickyHeader = await _secureStorage.getPersistentCookie();
      _socket = await WebSocket.connect(url, headers: {"COOKIE": stickyHeader});
      _socket.listen(
        (data) {
          _controller.add(json.decode(data));
        },
        onDone: () {
          print("WebSocket connection closed");
        },
        onError: (error) {
          print("WebSocket error: $error");
          _controller.addError(error);
        },
        cancelOnError: true,
      );
    } catch (e) {
      print("WebSocket connection error: $e");
      _controller.addError(e);
    }
  }

  void send(dynamic data) {
    if (_socket != null && _socket.readyState == WebSocket.open) {
      _socket.add(json.encode(data));
    }
  }

  void close() {
    _socket.close();
    _controller.close();
  }
}
