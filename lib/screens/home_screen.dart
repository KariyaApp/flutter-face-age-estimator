import 'dart:io';
import 'package:flutter/material.dart';
import '../services/image_service.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _imageService = ImageService();

  File? _image;
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
            _image != null
                ? Image.file(
                    _image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )            
            :  const Text(
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
              onPressed: _pickImage,
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

  Future<void> _pickImage() async {
    final image = await _imageService.pickImageFromCamera();

    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }
}
