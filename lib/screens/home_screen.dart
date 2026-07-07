import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Age Estimator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "😊",
              style: TextStyle(fontSize: 80),
            ),
            const SizedBox(height: 20),
            const Text(
              "顔写真から年齢を推定します",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text("写真を撮る"),
            ),
            const SizedBox(height: 30),
            const Text(
              "Powered by Flutter",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
