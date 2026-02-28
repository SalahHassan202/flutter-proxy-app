import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  bool _isHttpLoading = false;
  bool _isHttpsLoading = false;

  Future<void> _makeRequest({required String url, required bool isHttp}) async {
    if (!mounted) return;

    setState(() {
      if (isHttp) {
        _isHttpLoading = true;
      } else {
        _isHttpsLoading = true;
      }
    });

    final result = await _apiService.sendRequest(url);

    if (!mounted) return;

    setState(() {
      if (isHttp) {
        _isHttpLoading = false;
      } else {
        _isHttpsLoading = false;
      }
    });

    Navigator.pushNamed(context, '/result', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 142, 227),
        elevation: 4,
        title: const Text(
          "Proxy Me Please",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "HTTP Request",
                color: Colors.green,
                isLoading: _isHttpLoading,
                onPressed: () {
                  _makeRequest(url: "http://httpbin.org/get", isHttp: true);
                },
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: "HTTPS Request",
                color: Colors.orange,
                isLoading: _isHttpsLoading,
                onPressed: () {
                  _makeRequest(url: "https://httpbin.org/get", isHttp: false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
