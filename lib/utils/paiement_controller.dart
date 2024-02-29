import 'package:get/get.dart';
import 'package:linafoot/utils/requete.dart';

class PaiementController extends GetxController {
  //
  Requete requete = Requete();
  //
  Future<Map> payerBiller(Map billet) async {
    //
    Response response = await requete.getE("");
    if (response.isOk) {
      //
      return response.body;
    } else {
      //
      return {};
    }
  }

  //
  payerDirect(Map billet) async {
    //
    Response response = await requete.getE("");
    if (response.isOk) {
      //
      return response.body;
    } else {
      //
      return {};
    }
  }

  //
  payerVerification(String otp) async {
    //
  }
  //

  Future<Map> sendOTP(Map data) async {
    Response response = await requete.getE("");
    //
    if (response.isOk) {
      //
      Get.back();
      return response.body;
    } else {
      //
      Get.back();
      return {};
    }
    //
  }
  //
}
