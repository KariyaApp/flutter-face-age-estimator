import 'dart:io';
import 'dart:ui';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class FaceCropService {

  Future<img.Image?> loadImage(File file) async {

    final bytes = await file.readAsBytes();

    return img.decodeImage(bytes);

  }

  Future<File?> cropFace(
    File imageFile,
    Rect boundingBox,
  ) async {
    final image = await loadImage(imageFile);

    if (image == null) {
      return null;
    }

    // 次のステップでここを書きます
    final x = boundingBox.left.round().clamp(0, image.width - 1);
    final y = boundingBox.top.round().clamp(0, image.height - 1);
    final width = boundingBox.width
        .round()
        .clamp(1, image.width - x);

    final height = boundingBox.height
        .round()
        .clamp(1, image.height - y);

    final cropped = img.copyCrop(
      image,
      x: x,
      y: y,
      width: width,
      height: height,
    );

    final resized = img.copyResize(
      cropped,
      width: 224,
      height: 224,
    );

    debugPrint(
      "Crop Size: ${cropped.width} x ${cropped.height}",
    );

    final tempDir = await getTemporaryDirectory();

    final croppedFile = File(
      '${tempDir.path}/cropped_face.png',
    );

    await croppedFile.writeAsBytes(
      img.encodePng(resized),
    );
    print(
      "Resize Size: ${resized.width} x ${resized.height}",
    );
    return croppedFile;
  }
}
