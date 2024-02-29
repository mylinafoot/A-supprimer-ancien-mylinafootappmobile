import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/utils/requete.dart';

class ProfilController {
  //
  Requete requete = Requete();
  //
  Future<Map> getOneCommissaire(String id) async {
    //
    //
    Response response = await requete.getE("commissaire/one?id=$id");
    //
    if (response.isOk) {
      print("rep: ${response.body}");
      //
      return response.body;
    } else {
      //
      print("rep: ${response.body}");
      return {};
    }
  }

  //
  //
  Future<Map> getOneArbitre(String id) async {
    //
    //
    Response response = await requete.getE("arbitre/one?id=$id");
    //
    if (response.isOk) {
      print("Arbitre: ${response.body}");
      //
      return response.body;
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
    Response response = await requete.getE("equipe/one?id=$id");
    //
    if (response.isOk) {
      print("Arbitre: ${response.body}");
      //
      return response.body;
    } else {
      //
      print("Arbitre: ${response.body}");
      return {};
    }
  }

  Future<List> getAllEquipes() async {
    //
    //
    Response response = await requete.getE("equipe/all");
    //
    if (response.isOk) {
      print("Arbitre: ${response.body}");
      //
      return response.body;
    } else {
      //
      print("Arbitre: ${response.body}");
      return [];
    }
  }

  //
  //
  Future<List> getAllCommissaire() async {
    //
    //
    Response response = await requete.getE("commissaire/all");
    //
    if (response.isOk) {
      print("Arbitre: ${response.body}");
      //
      return response.body;
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
    Response response = await requete.getE("arbitre/all");
    //
    if (response.isOk) {
      print("Arbitre: ${response.body}");
      //
      return response.body;
    } else {
      //
      print("Arbitre: ${response.body}");
      return [];
    }
  }

  //
  Future<List> getAllJoueurEquipe(String id) async {
    //
    Response response = await requete.getE("joueur/All/$id");
    //
    if (response.isOk) {
      print("Arbitre: $id: ${response.body}");
      //
      return response.body;
    } else {
      //
      print("Arbitre: $id: ${response.body}");
      return [];
    }
  }
}
