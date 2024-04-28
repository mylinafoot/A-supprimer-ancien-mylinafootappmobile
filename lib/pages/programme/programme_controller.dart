import 'dart:convert';

import 'package:get/get.dart';
import 'package:linafoot/utils/requete.dart';
import 'package:http/http.dart' as http;

class ProgrammeController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  RxMap equipeA = {}.obs;
  //
  RxInt journee = 0.obs;
  //
  RxMap equipeB = {}.obs;
  //
  //RxString stade = {}.obs;
  //
  RxMap commissaire = {}.obs;
  RxMap arbitreCentrale = {}.obs;
  RxMap arbitreAssitant1 = {}.obs;
  RxMap arbitreAssitant2 = {}.obs;
  RxMap arbitreProtocolaire = {}.obs;
  //
  //
  Future<List> getAllJourneeDeLaSaison(
      String idCalendrier, String categorie) async {
    //
    http.Response response =
        await requete.getE("match/All/journee/$idCalendrier/$categorie");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return jsonDecode(response.body);
    } else {
      //
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }

  //
  Future<List> getAllJourneeDeLaSaison2(String idCalendrier) async {
    //
    http.Response response = await requete.getE("match/all/$idCalendrier");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return jsonDecode(response.body);
    } else {
      //
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }

  //
  //
  Future<void> getAllMatchsDeLaJournee(
      String idCalendrier, String categorie, String journee) async {
    //
    change([], status: RxStatus.loading());
    //
    http.Response response =
        await requete.getE("match/All/match/$idCalendrier/$categorie/$journee");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response Jn: ${response.statusCode}");
      print("response Jn: ${response.body}");
      //
      change(jsonDecode(response.body), status: RxStatus.success());
    } else {
      //
      print("response Jn: ${response.statusCode}");
      print("response Jn: ${response.body}");
      change([], status: RxStatus.empty());
    }
  }

  //
  Future<List> getAllMatchsDeLaJournee2(
      String idCalendrier, String categorie, String journee) async {
    //
    change([], status: RxStatus.loading());
    //
    http.Response response =
        await requete.getE("match/All/match/$idCalendrier/$categorie/$journee");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return jsonDecode(response.body);
    } else {
      //
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }

  //
  Future<int> getCalendrier() async {
    //
    http.Response response = await requete.getE("calendrier/actuel");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return jsonDecode(response.body);
    } else {
      //
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change([], status: RxStatus.empty());
      return 0;
    }
  }

  //
  Future<List> getAfficher(String idCalendrier) async {
    //
    http.Response response =
        await requete.getE("match/allaffiches/$idCalendrier");
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response: all ${response.statusCode}");
      print("response: all ${response.body}");
      // change(response.body, status: RxStatus.success());
      return jsonDecode(response.body);
    } else {
      //
      print("response: all ${response.statusCode}");
      print("response: all ${response.body}");
      // change([], status: RxStatus.empty());
      return [];
    }
  }
}
