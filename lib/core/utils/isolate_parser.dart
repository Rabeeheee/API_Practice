import 'dart:convert';
import 'dart:isolate';

class IsolateParser {
  static Future<dynamic> parseJsonInIsolate(String jsonString) async {
    final ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(_parseJson, [receivePort.sendPort, jsonString]);
    
    return await receivePort.first;
  }

  static void _parseJson(List<dynamic> args) {
    final SendPort sendPort = args[0];
    final String jsonString = args[1];
    
    final dynamic result = jsonDecode(jsonString);
    Isolate.exit(sendPort, result);
  }
}
