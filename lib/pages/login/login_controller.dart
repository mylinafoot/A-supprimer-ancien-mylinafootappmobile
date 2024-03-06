import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:linafoot/pages/profil/profile.dart';
import 'package:linafoot/pages/rapports/arbitre/arbitre.dart';
import 'package:linafoot/pages/rapports/commissaire/commissaire.dart';
import 'package:linafoot/pages/rapports/officier/officier.dart';
import 'package:linafoot/utils/requete.dart';
import '../accueil.dart';

class LoginController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Future<void> login(Map e, int i) async {
    //commissaire/login?telephone=0987654312&mdp=1234567&date=27-2-2024
    print(
        "${Requete.url}/commissaire/login?mdp=${e['mdpMatch']}"); //&profil=agent
    //
    Response? rep;
    //
    if (i == 1) {
      rep = await requete
          .getE("commissaire/login?mdp=${e['mdpMatch']}"); //&profil=agent
      //
    }
    if (i == 2) {
      rep = await requete
          .getE("arbitre/login?mdp=${e['mdpMatch']}"); //&profil=agent
      //
    }
    if (i == 3) {
      rep = await requete
          .getE("arbitre/loginofficier?mdp=${e['mdpMatch']}"); //&profil=agent
      //
    }

    //
    if (rep!.statusCode == 200 || rep.statusCode == 201) {
      //
      print(rep.statusCode);
      print(rep.body);
      List e = rep.body;
      //
      Get.back();

      if (e.isNotEmpty) {
        Get.snackbar(
          "Compte",
          "Authentification reussi!",
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        box.write("matchs", e);
        if (i == 1) {
          Get.to(Profile(e, 1));
          //Get.to(CommissaireFormulaire());
        }
        if (i == 2) {
          Get.to(Profile(e, 2));
          //Get.to(HarbitreRapport());
        }
        if (i == 3) {
          Get.to(Profile(e, 3));
          //Get.to(OfficierRapport());
        }
        //Get.offAll(Accueil());
      }
      // else if (e['jouer'] != true) {
      //   Get.snackbar(
      //     "Match",
      //     "Ce match à déjà fait l'objet d'un rapport.",
      //     backgroundColor: Colors.orange.shade900,
      //     colorText: Colors.white,
      //   );
      // }
      else {
        Get.snackbar(
          "Match",
          "Vous n'etes pas associé à ce match.",
          backgroundColor: Colors.orange.shade900,
          colorText: Colors.white,
        );
      }

      //
    } else if (rep.statusCode == 300) {
      //
      print(rep.statusCode);
      print(rep.body);
      Get.back();
      Get.snackbar(
        "Compte",
        "Pas de compte avec se numéro veuille en créer svp!",
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
      );
    } else {
      //
      print(rep.statusCode);
      print(rep.body);
      //
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de l'authentification");
    }
  }

  //
  Future<void> creer(Map e) async {
    //pseudo,pwd,profil, etat
    print("${Requete.url}/agent"); //&profil=agent
    print("e: $e");
    //
    Response rep = await requete.postE("agent", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.body}");
      Map e = json.decode(rep.body);
      //
      Get.back();
      box.write("user", e);
      Get.snackbar(
        "Compte",
        "Compte crée avec succès",
        backgroundColor: Colors.teal,
        colorText: Colors.white,
      );
      Get.offAll(Accueil());
      //
    } else if (rep.statusCode == 300) {
      Get.back();
      Get.snackbar(
        "Compte",
        "Se numéro a déjà un Compte veuillez vous authentifier",
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
      );
    } else {
      //
      print(rep.statusCode);
      print(rep.body);
      //
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de l'enregistrement");
    }
  }

  //
  Future<void> updateMdp(Map e) async {
    //pseudo,pwd,profil, etat
    print("${Requete.url}utilisateur");
    //&profil=agent
    //
    Response rep = await requete.putE("utilisateur/mdp", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.body}");
      Map e = json.decode(rep.body);
      //
      Get.back();
      box.write("user", e);
      Get.snackbar(
        "Compte",
        "Mise à jour éffectué",
        backgroundColor: Colors.teal,
        colorText: Colors.white,
      );
      Get.offAll(Accueil());
      //
    } else if (rep.statusCode == 300) {
      Get.back();
      Get.snackbar(
        "Compte",
        "Se numéro a déjà un Compte veuillez vous authentifier",
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
      );
    } else {
      //
      print(rep.statusCode);
      print(rep.body);
      //
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }

  //
  Future<Map> sendCode(String telephone, bool exit) async {
    var i1 = math.Random().nextInt(10);
    var i2 = math.Random().nextInt(10);
    var i3 = math.Random().nextInt(10);
    var i4 = math.Random().nextInt(10);
    var i5 = math.Random().nextInt(10);
    var i6 = math.Random().nextInt(10);
    var i7 = math.Random().nextInt(10);
    var i8 = math.Random().nextInt(10);
    var i9 = math.Random().nextInt(10);

    String code = "$i1$i2$i3$i4$i5$i6$i7$i8$i9";
    print("le code: $code");
    //
    Response response =
        await requete.getE("utilisateur/sendmdp/$telephone/$code/$exit");
    if (response.statusCode == 200 || response.statusCode == 201) {
      //
      Map e = {
        "envoi": true,
        "code": code,
      };
      //
      return e;
    } else {
      return {
        "envoi": false,
        "code": response.statusCode,
      };
    }

    //return code;
  }
}
