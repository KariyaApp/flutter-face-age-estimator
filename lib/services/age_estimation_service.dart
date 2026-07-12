import 'package:tflite_flutter/tflite_flutter.dart';

class AgeEstimationService {
  Interpreter? _interpreter;

  Future<void> loadModel() async {

    _interpreter =
        await Interpreter.fromAsset(
          'models/age_estimation.tflite',
        );
  }

  Future<int> estimateAge() async {

    // TensorFlow Liteを組み込んだら
    // ここで推論する

    return 0;
  }

}
