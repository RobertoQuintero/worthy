import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImagesHandler {
  static Future<XFile?> getImages(String source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: source == 'gallery' ? ImageSource.gallery : ImageSource.camera,
      maxWidth: 350,
    );
    return image;
  }

  static Future<String?> uploadImage(XFile? image) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dmq9e2wuv/image/upload?upload_preset=y3isx5p2');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', image!.path);

    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salió mal');
      return null;
    }
    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
