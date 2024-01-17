import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tastytakeout_admin_web/models/dto/voucher_model.dart';
import 'package:tastytakeout_admin_web/view_models/voucher_creator_view_model.dart';

class VoucherCreatorScreen extends StatelessWidget {
  final List<String> discountTypes = ['CASH', 'PERCENT'];

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController discountAmountController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final VoucherCreatorViewModel controller = Get.put(VoucherCreatorViewModel());

    void submitForm() {
      final VoucherModel voucher = VoucherModel(
        id: "",
        code: codeController.text,
        name: nameController.text,
        description: descriptionController.text,
        endDate: endDateController.text,
        discountAmount: double.parse(discountAmountController.text),
        discountType: discountTypes.first,
        maxPrice: double.parse(maxPriceController.text),
        minPrice: double.parse(minPriceController.text),
      );

      controller.sendVoucher(voucher);
    }

    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Voucher Creator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: InputDecoration(
                  labelText: 'Code',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: endDateController,
                decoration: InputDecoration(
                  labelText: 'End date',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: discountAmountController,
                decoration: InputDecoration(
                  labelText: 'Discount Amount',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Discount type',
                ),
                items: discountTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // TODO: Implement logic for handling selected value
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: maxPriceController,
                decoration: InputDecoration(
                  labelText: 'Max price',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: minPriceController,
                decoration: InputDecoration(
                  labelText: 'Min price',
                ),
                keyboardType: TextInputType.number,
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
