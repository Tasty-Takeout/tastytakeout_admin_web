import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastytakeout_admin_web/models/dto/event_model.dart';
import 'package:tastytakeout_admin_web/view_models/event_creator_view_model.dart';
import 'package:file_picker/file_picker.dart';

class EventCreatorScreen extends StatelessWidget {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDescriptionController = TextEditingController();
  final TextEditingController eventImageController = TextEditingController();
  Uint8List? selectedFileBytes;

  @override
  Widget build(BuildContext context) {
    final EventCreatorViewModel controller = Get.put(EventCreatorViewModel());
    Future<void> submitForm() async {
      final String eventName = eventNameController.text;
      final String eventDescription = eventDescriptionController.text;
      // final String selectedFilePath = selectedFile?.path;

      final String imageUrl = await controller.uploadImage(selectedFileBytes!);
    
      final EventModel event = EventModel(
        name: eventName,
        description: eventDescription,
        imageUrl: imageUrl,
      );

      print("???" + event.name + " " + event.description + " " + event.imageUrl);

      // TODO: Implement logic for submitting the form
      // controller.sendEvent(event);
    }

    Future<void> pickFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        Uint8List file = result.files.first.bytes!;
        selectedFileBytes = file;
        eventImageController.text = result.files.first.name;
      } else {
        // User canceled the picker
      }
      // if (file != null) {
      //   selectedFile = file;
      //   eventImageController.text = file.name;
      //   // fileSelectorController.text = file.path;
      //   // selectedFilePath = file.path;
      // }
    }

    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Event Creator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: eventNameController,
                decoration: InputDecoration(
                  labelText: 'Event Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: eventDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Event Description',
                ),
              ),
              SizedBox(height: 16.0),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Event Image',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.file_upload),  // You can replace this with your desired icon
                    onPressed: () {
                      // Call your pickFile function here
                      pickFile();
                    },
                  ),
                ),
                readOnly: true,
                controller: eventImageController,
              ),
              SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}