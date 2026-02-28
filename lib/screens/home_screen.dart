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
  bool _isLoading = false;

  Future<void> _makeRequest(String url) async {
    if (!mounted) return;

    setState(() => _isLoading = true);

    final result = await _apiService.sendRequest(url);

    if (!mounted) return;

    setState(() => _isLoading = false);

    Navigator.pushNamed(context, '/result', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proxy Me Please'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.public, size: 80, color: Colors.blue),
                  const SizedBox(height: 30),

                  CustomButton(
                    text: "HTTP Request",
                    color: Colors.green,
                    isLoading: _isLoading,
                    onPressed: () {
                      _makeRequest("http://httpbin.org/get");
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomButton(
                    text: "HTTPS Request",
                    color: Colors.orange,
                    isLoading: _isLoading,
                    onPressed: () {
                      _makeRequest("https://httpbin.org/get");
                    },
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Tap a button to send request",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
