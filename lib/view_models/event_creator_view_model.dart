

import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tastytakeout_admin_web/data_sources/event_source.dart';
import 'package:tastytakeout_admin_web/data_sources/firebase_source.dart';
import 'package:tastytakeout_admin_web/models/dto/event_model.dart';

class EventCreatorViewModel extends GetxController {
  EventSource eventSource = EventSource();
  FirebaseSource uploadCareSource = FirebaseSource();
  // Add your controller logic here
  void sendEvent(EventModel voucher) {
    eventSource.createNewEvent(voucher);
  }
  Future<String> uploadImage(Uint8List selectedFileBytes) async {
    String stringUrl = await uploadCareSource.uploadFile(selectedFileBytes);
    return stringUrl;
  }
}