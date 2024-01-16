
import 'dart:io' as io;
import 'dart:html' as html;
import 'dart:typed_data';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uploadcare_client/uploadcare_client.dart';

class FirebaseSource {
  final client = UploadcareClient(
  options: ClientOptions(
    authorizationScheme: AuthSchemeRegular(
      apiVersion: 'v0.5',
      publicKey: 'f8264b1bd14864c247f8',
      privateKey: 'd73aca1c6ac83489e950',
    ),
    // rest options...
  ),
  );
  
  // UploadCareSource() : super('uploadcare');

  Future<String> uploadFile(Uint8List fileBytes) async {
    // /// For small files
    // // print(file);
    // // final url = html.Url.createObjectUrlFromBlob(file.path);
    // // File file = uint8ListToFile(fileBytes, "temp.jpg");
    // // File file = File.fromRawPath(fileBytes);
    // final fileId = await client.upload.base(UCFile(io.File.fromRawPath(fileBytes)));
    // // final fileId = await client.upload.fromUrl(file.path);
    // String url = "https://ucarecdn.com/$fileId/";
    // return url;

    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

    // Create a reference to "mountains.jpg"
    var time = DateTime.now().millisecondsSinceEpoch.toString();
    final tempImageRef = storageRef.child('images/$time.png');

    try {
      // Upload raw data.
      await tempImageRef.putData(fileBytes);
      String url = await tempImageRef.getDownloadURL();
      return url;
    } catch (e) {
      print("Error during upload: $e");
      return "";
    }
  }
}

