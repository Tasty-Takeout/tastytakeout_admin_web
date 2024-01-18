
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:tastytakeout_admin_web/data_sources/event_source.dart';
import 'package:tastytakeout_admin_web/data_sources/firebase_source.dart';
import 'package:tastytakeout_admin_web/data_sources/voucher_source.dart';
import 'package:tastytakeout_admin_web/models/dto/event_model.dart';
import 'package:tastytakeout_admin_web/models/dto/voucher_model.dart';

class EventCreatorViewModel extends GetxController {
  EventSource eventSource = EventSource();
  FirebaseSource uploadCareSource = FirebaseSource();
  VoucherSource voucherSource = VoucherSource();

  RxList<VoucherModel> vouchers = <VoucherModel>[].obs;
  RxBool loading = true.obs;
  RxList<bool> isSelected = <bool>[].obs;

  // Add your controller logic here
  Future<bool> sendEvent(EventModel voucher) {
    return eventSource.createNewEvent(voucher);
  }
  Future<String> uploadImage(Uint8List selectedFileBytes) async {
    String stringUrl = await uploadCareSource.uploadFile(selectedFileBytes);
    return stringUrl;
  }

  Future<void> fetchAllVouchers() async {
    var temp = await voucherSource.getAllVouchers();
    vouchers.clear();
    //isSelected.clear();
    for (var voucher in temp) {
      vouchers.add(voucher);
      if (isSelected.length < vouchers.length)
        isSelected.add(false);
    }
    loading.value = false;
  }

  void updateSelection(int index, bool value) {
    print(isSelected.value[index]);
    isSelected.value[index] = !isSelected.value[index];
    isSelected.refresh();
    update();
  }
}