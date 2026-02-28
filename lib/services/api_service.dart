import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> sendRequest(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": "SUCCESS (${DateTime.now().toUtc()})",
        };
      } else {
        return {"success": false, "message": "FAILED (${response.statusCode})"};
      }
    } catch (e) {
      return {"success": false, "message": "ERROR ($e)"};
    }
  }
}
