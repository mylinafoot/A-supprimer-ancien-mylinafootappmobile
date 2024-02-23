import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/utils/requete.dart';

class CommissaireController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //*
  RxMap commissaire = {}.obs;
  //*
  RxString heure = "".obs;
  //*
  RxString date = "".obs;
  //
  RxMap equipe = {}.obs;
  //*
  RxMap stade = {}.obs;
  //*
  RxMap equipeA = {}.obs;
  //*
  RxMap equipeB = {}.obs;
  //
  RxMap lieu = {}.obs;
  //*
  RxMap resultatMitemps = {}.obs;
  //*
  RxMap resultatFinal = {}.obs;
  //*
  RxMap arbitreCentral = {}.obs;
  //*
  RxMap arbitreAssistant1 = {}.obs;
  //*
  RxMap arbitreAssistant2 = {}.obs;
  //
  RxMap arbitreAssistantEvaluation1 = {}.obs;
  //
  RxMap arbitreReserveEvaluation2 = {}.obs;
  //*
  RxMap arbitreProtocolaire = {}.obs;
  //
  RxList avertissementsJoueurs = [].obs;
  //
  RxList expulssionsJoueurs = [].obs;
  //
  RxList butsJoueurs = [].obs;
  //__________________________________________________
  //*
  RxList avertissementsJoueursGeneral = [].obs;
  //*
  RxList expulssionsJoueursGeneral = [].obs;
  //*
  RxList butsJoueursGeneral = [].obs;
  //__________________________________________________
  //*
  Rx<TextEditingController> nombreSpectateur =
      Rx<TextEditingController>(TextEditingController());
  //*
  RxInt attitudeJouerA = 1.obs;
  //*
  RxInt attitudeJouerB = 1.obs;
  //*
  RxInt attitudePublic = 1.obs;
  //*
  RxInt etatTerrain = 1.obs;
  //*
  RxList etatsTerrainListe = [].obs;
  //*
  RxInt etatInstallation = 1.obs;
  //*
  RxList etatsInstallationListe = [].obs;
  //*
  Rx<TextEditingController> incident =
      Rx<TextEditingController>(TextEditingController());
  //_____________________________________________________
  //*
  RxInt organisationGenerale = 1.obs;
  //*
  RxInt serviceControle = 1.obs;
  //*
  RxInt servicePolice = 1.obs;
  //*
  RxInt serviceSanitaire = 1.obs;
  //*
  RxInt organisation = 1.obs;
  //____________________________________________________
  //
  //RxString personnalite = "".obs;
  //*
  RxMap personnalite = {}.obs;
  //*
  RxMap conditionPhysique = {}.obs;
  //*
  RxMap capacite = {}.obs;
  //*
  RxMap execution = {}.obs;
  //*
  RxMap discipline = {}.obs;
  //

  RxList evaluationArbitreAssistant = [].obs;
  //
  RxList evaluationArbitreReserve = [].obs;
  //
  //RxList butsJoueursGeneral = [].obs;
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
      //
      return response.body;
    } else {
      //
      return {};
    }
  }
  //
}
