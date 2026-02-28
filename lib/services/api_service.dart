import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> sendRequest(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      final now = DateTime.now();

      final formattedTime =
          "${now.hour.toString().padLeft(2, '0')}:"
          "${now.minute.toString().padLeft(2, '0')}:"
          "${now.second.toString().padLeft(2, '0')}";

      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": "SUCCESS at $formattedTime",
          "statusCode": response.statusCode,
        };
      } else {
        return {
          "success": false,
          "message": "FAILED (${response.statusCode}) at $formattedTime",
          "statusCode": response.statusCode,
        };
      }
    } catch (e) {
      return {"success": false, "message": "ERROR: $e"};
    }
  }
}
