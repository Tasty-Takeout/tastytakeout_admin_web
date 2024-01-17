import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastytakeout_admin_web/models/dto/event_model.dart';
import 'package:tastytakeout_admin_web/models/dto/voucher_model.dart';
import 'package:tastytakeout_admin_web/view_models/event_creator_view_model.dart';
import 'package:file_picker/file_picker.dart';

class EventCreatorScreen extends StatefulWidget {
  @override
  _EventCreatorScreenState createState() => _EventCreatorScreenState();
}

class _EventCreatorScreenState extends State<EventCreatorScreen> {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDescriptionController = TextEditingController();
  final TextEditingController eventImageController = TextEditingController();
  Uint8List? selectedFileBytes;
  final EventCreatorViewModel controller = Get.put(EventCreatorViewModel());

  @override
  void initState() {
    super.initState();
    controller.fetchAllVouchers();
  }

  Future<void> submitForm() async {
    final String eventName = eventNameController.text;
    final String eventDescription = eventDescriptionController.text;
    final String imageUrl = await controller.uploadImage(selectedFileBytes!);

    // get all ids from controller.vouchers
    List<String> voucherIds = [];
    for (int i = 0; i < controller.isSelected.length; i++) {
      if (controller.isSelected[i]) {
        voucherIds.add(controller.vouchers[i].id);
      }
    }

    final EventModel event = EventModel(
      name: eventName,
      description: eventDescription,
      imageUrl: imageUrl,
      vouchers: voucherIds,
    );



    print("???" + event.name + " " + event.description + " " + event.imageUrl);
    for (var voucherId in event.vouchers) {
      print(voucherId);
    }

    controller.sendEvent(event);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Event Creator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              Text(
                'Vouchers',
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Obx(() {
                if (controller.loading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.vouchers.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(controller.vouchers[index].code),
                        subtitle: Text(controller.vouchers[index].description),
                        // value: true,
                        value: controller.isSelected[index],
                        onChanged: (value) {
                          setState(() {
                            controller.updateSelection(index, value!);
                          });
                        },
                      );
                    },
                  );
                }
                
              }),
              SizedBox(height: 16.0),

              Center(
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


