import 'dart:convert';
import 'package:http/http.dart' as http;

class AgeEstimationService {

  Future<int> predictAge(String imagePath) async {

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/age'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        imagePath,
      ),
    );

    var response  = await request.send();

    var body = await response.stream.bytesToString();

    final json = jsonDecode(body);

    return json['age'];

  }
}
