import 'package:get/get.dart';
import 'package:tastytakeout_admin_web/data_sources/voucher_source.dart';
import 'package:tastytakeout_admin_web/models/dto/voucher_model.dart';

class VoucherCreatorViewModel extends GetxController {
  VoucherSource voucherSource = VoucherSource();
  // Add your controller logic here
  void sendVoucher(VoucherModel voucher) {
    voucherSource.createNewVoucher(voucher);
  }
}