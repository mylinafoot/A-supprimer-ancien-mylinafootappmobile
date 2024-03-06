import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/utils/requete.dart';

class PaiementController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
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
      List billets = box.read("billets") ?? [];
      //
      //La reponse quee je reçois est une liste de billet(s)
      List lbs = response.body;
      lbs.forEach((billet) {
        //
        billets.add(billet);
      });
      //
      box.write("billets", billets);
      //
      Get.back();
      if (lbs.length == 1) {
        //

        Get.snackbar("Succès", "Billet acheté! voir dans profile, Bon match.");
      } else {
        Get.snackbar(
            "Succès", "Billets achetés, ! voir dans profile, Bon match.");
      }
      //
      return response.body;
    } else {
      Get.back();
      Get.snackbar("Erreur",
          "La transaction n'a pas été approuvé ! Vérifiez votre compte.",
          colorText: Colors.white, backgroundColor: Colors.red);
      print("rep: ${response.body}");
      //
      return {};
    }
  }
  //

  Future<Map> sendOTP(Map data) async {
    Response response = await requete.postE(
        "paiement/otp?telephone=${data['telephone']}&montant=${data['montant']}&devise=${data['devise']}",
        data);
    //844182365//Jonathan
    if (response.isOk) {
      //
      Get.back();
      return response.body;
    } else {
      //
      Get.back();
      return {"place": response.body};
    }
    //
  }
  //
}
