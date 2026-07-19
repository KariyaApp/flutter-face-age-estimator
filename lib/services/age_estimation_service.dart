import 'package:flutter/services.dart';

class AgeEstimationService {
  Future<void> loadModel() async {
    final modelData = await rootBundle.load(
      'assets/models/age_estimation.tflite',
    );

    print(
      'Model Size: ${modelData.lengthInBytes} bytes',
    );
  }
}