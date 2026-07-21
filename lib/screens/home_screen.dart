import 'dart:io';
import 'package:flutter/material.dart';
import '../services/image_service.dart';
import '../services/face_detection_service.dart';
import '../models/age_result.dart';
import '../services/face_crop_service.dart';
import '../services/age_estimation_service.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _imageService = ImageService();
  final _faceDetectionService = FaceDetectionService();
  final _faceCropService = FaceCropService();
  final _ageEstimationService = AgeEstimationService();

  File? _image;
  AgeResult? _result;

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
            if (_result != null)
              Text(
                "推定年齢：${_result!.age}歳",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
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
      //顔の切り出し
      final faces = await _faceDetectionService.detectFaces(image);      
      
      if (faces.isNotEmpty) {
        final croppedImage =
          await _faceCropService.cropFace(
          image,
          faces.first.boundingBox,
        );

        if (croppedImage != null) {

          setState(() {
            _image = croppedImage;
          });

          final age =
              await _ageEstimationService.predictAge(
                croppedImage.path,
          );

          setState(() {
            _result = AgeResult(
            age: age,
            confidence: 1.0,
            );
          });
        }
      }
    }    
  }
  
  @override
  void dispose() {
    _faceDetectionService.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //_loadModel();
  }

 
  
}
