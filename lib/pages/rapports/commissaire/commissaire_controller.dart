import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/accueil.dart';
import 'package:linafoot/utils/requete.dart';
import 'package:http/http.dart' as http;

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
  RxList avertissementsJoueursGeneralA = [].obs;
  //*
  RxList expulssionsJoueursGeneralA = [].obs;
  //*
  RxList butsJoueursGeneralA = [].obs;
  //__________________________________________________
  //*
  RxList avertissementsJoueursGeneralB = [].obs;
  //*
  RxList expulssionsJoueursGeneralB = [].obs;
  //*
  RxList butsJoueursGeneralB = [].obs;
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
  //_____________________________________________________
  RxMap scoreMitemps = {}.obs;
  RxMap scoreFin = {}.obs;
  //_____________________________________________________
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
  Rx<TextEditingController> commentaire =
      Rx<TextEditingController>(TextEditingController());
  //*
  RxList evaluationArbitreAssistant = [].obs;
  //*
  RxList evaluationArbitreReserve = [].obs;
  //
  //RxList butsJoueursGeneral = [].obs;
  //
  //
  Future<void> envoyerRapport(Map r) async {
    //
    Response response = await requete.postE("rapport", r);
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      //
      box.write("rapport${r['match']}", {});
      //
      print("Arbitre: ${response.body}");
      //
      Get.offAll(Accueil());
      //
      Get.snackbar("Succès", "Rapport envoyé");
      //
      //return response.body;
    } else {
      //
      Get.snackbar("Erreur", "Rapport non envoyé, vérifier votre connexion",
          backgroundColor: Colors.red);
      print("Arbitre: ${response.body}");
      //return [];
    }
  }
  //
}
