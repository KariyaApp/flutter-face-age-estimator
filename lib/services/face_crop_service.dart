import 'dart:io';

import 'package:image/image.dart' as img;

class FaceCropService {

  Future<img.Image?> loadImage(File file) async {

    final bytes = await file.readAsBytes();

    return img.decodeImage(bytes);

  }

}
