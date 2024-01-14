import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastytakeout_admin_web/models/dto/voucher_model.dart';
import 'package:tastytakeout_admin_web/view_models/voucher_creator_view_model.dart';
import 'package:image_picker/image_picker.dart';

class EventCreatorScreen extends StatelessWidget {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDescriptionController = TextEditingController();
  final TextEditingController eventImageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? selectedFile;

  @override
  Widget build(BuildContext context) {
    void submitForm() {
      final String eventName = eventNameController.text;
      final String eventDescription = eventDescriptionController.text;
      final String? selectedFilePath = selectedFile?.path;

      // TODO: Implement logic for submitting the form
    }

    Future<void> pickFile() async {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        selectedFile = file;
        eventImageController.text = file.name;
        // fileSelectorController.text = file.path;
        // selectedFilePath = file.path;
      }
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

            ],
          ),
        ),
      ),
    );
  }
}