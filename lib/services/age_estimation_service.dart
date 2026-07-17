import 'package:tflite_flutter/tflite_flutter.dart';
import '../models/age_result.dart';


class AgeEstimationService {
  Interpreter? _interpreter;

  Future<void> loadModel() async {

    _interpreter =
        await Interpreter.fromAsset(
          'models/age_estimation.tflite',
        );
  }

  Future<AgeResult> estimateAge() async {

    // TensorFlow Liteを組み込んだら
    // ここで推論する
    return const AgeResult(
      age: 0,
      confidence: 0,
    );

  }

}
