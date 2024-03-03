import 'package:flutter/services.dart';
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
  payerVerification(Map billet) async {
    //
    Response response = await requete.postE("paiement/billet", billet);
    if (response.isOk) {
      print("rep: ${response.body}");
      //
      return response.body;
    } else {
      print("rep: ${response.body}");
      //
      return {};
    }
  }
  //

  Future<Map> sendOTP(Map data) async {
    Response response = await requete.getE(
        "paiement/otp?telephone=${data['telephone']}&montant=${data['montant']}&devise=${data['devise']}");
    //844182365//Jonathan
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
