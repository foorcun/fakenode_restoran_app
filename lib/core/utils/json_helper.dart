import 'dart:convert';

class JsonHelper {
  static List convertResponseToList(String responseBody) {
    return jsonDecode(responseBody);
  }
}
