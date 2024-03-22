import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/accueil.dart';
import 'package:linafoot/utils/requete.dart';
import 'package:http/http.dart' as http;

class ProfilController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Future<Map> getOneCommissaire(String id) async {
    //
    //
    http.Response response = await requete.getE("commissaire/one?id=$id");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("rep: ${response.body}");
      //
      return jsonDecode(response.body);
    } else {
      //
      print("rep: ${response.body}");
      return {};
    }
  }

  //
  Future<Map> getOneArbitre(String id) async {
    //
    //
    http.Response response = await requete.getE("arbitre/one?id=$id");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Arbitre: ${response.body}");
      //
      return jsonDecode(response.body);
    } else {
      //
      print("Arbitre: ${response.body}");
      return {};
    }
  }

  //
  Future<Map> getOneEquipe(String id) async {
    //
    //
    http.Response response = await requete.getE("equipe/one?id=$id");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Arbitre: ${response.body}");
      //
      return jsonDecode(response.body);
    } else {
      //
      print("Arbitre: ${response.body}");
      return {};
    }
  }

  Future<List> getAllEquipes() async {
    //
    //
    http.Response response = await requete.getE("equipe/all");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Arbitre: ${response.body}");
      //
      return jsonDecode(response.body);
    } else {
      //
      print("Arbitre: ${response.body}");
      return [];
    }
  }

  //____________________________________________________________________________
  //
  Future<void> loginUser(Map e, int i) async {
    //commissaire/login?telephone=0987654312&mdp=1234567&date=27-2-2024
    print(
        "${Requete.url}/commissaire/login?mdp=${e['mdpMatch']}"); //&profil=agent
    //
    http.Response? rep;
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
      List e = jsonDecode(rep.body);
      //

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
  Future<void> creerUser(Map e) async {
    //pseudo,pwd,profil, etat
    print("${Requete.url}/utilisateur"); //&profil=agent
    print("e: $e");
    //
    Response rep = await requete.postE("utilisateur", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.body}");
      Map e = jsonDecode(rep.body);

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
  Future<void> updateMdpUser(Map e) async {
    //pseudo,pwd,profil, etat
    print("${Requete.url}utilisateur");
    //&profil=agent
    //
    http.Response rep = await requete.putE("utilisateur/mdp", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.body}");
      Map e = jsonDecode(rep.body);
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

  //____________________________________________________________________________
  Future<List> getAllCommissaire() async {
    //
    //
    http.Response response = await requete.getE("commissaire/all");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Arbitre: ${response.body}");
      //
      return jsonDecode(response.body);
    } else {
      //
      print("Arbitre: ${response.body}");
      return [];
    }
  }

  //
  Future<List> getAllArbitre() async {
    //
    //
    http.Response response = await requete.getE("arbitre/all");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Arbitre: ${response.body}");
      //
      return jsonDecode(response.body);
    } else {
      //
      print("Arbitre: ${response.body}");
      return [];
    }
  }

  //
  Future<List> getAllJoueurEquipe(String id) async {
    //
    http.Response response = await requete.getE("joueur/All/$id");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Arbitre: $id: ${response.body}");
      //
      return jsonDecode(response.body);
    } else {
      //
      print("Arbitre: $id: ${response.body}");
      return [];
    }
  }
}
