import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/accueil.dart';
import 'package:linafoot/utils/requete.dart';

class ArbitreController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Rx<TextEditingController> nMatch =
      Rx<TextEditingController>(TextEditingController());
  //
  RxInt competition = 1.obs;
  //
  Rx<TextEditingController> jouea =
      Rx<TextEditingController>(TextEditingController());
  //
  RxMap scoreMitemps = {}.obs;
  //
  RxMap scoreFin = {}.obs;
  //
  RxString date = "".obs;
  //
  RxString heure = "".obs;
  //
  Rx<TextEditingController> nombreSpectateur =
      Rx<TextEditingController>(TextEditingController());
  //

  RxMap equipe = {}.obs;
  //
  RxMap stade = {}.obs;
  //
  RxMap equipeA = {}.obs;
  //
  RxMap equipeB = {}.obs;
  //
  RxMap lieu = {}.obs;
  //
  RxMap resultatMitemps = {}.obs;
  //
  RxMap resultatFinal = {}.obs;
  //
  RxMap arbitreCentral = {}.obs;
  //
  RxMap arbitreAssistant1 = {}.obs;
  //
  RxMap arbitreAssistant2 = {}.obs;
  //
  RxMap arbitreAssistantEvaluation1 = {}.obs;
  //
  RxMap arbitreReserveEvaluation2 = {}.obs;
  //
  RxMap arbitreProtocolaire = {}.obs;
  //________________________________________________
  RxString meteo = "".obs;
  //*
  RxString comportementEquipeA = "".obs;
  //*
  RxInt indexComportementEquipeA = 1.obs;
  //*
  //*
  RxString comportementEquipeB = "".obs;
  //*
  RxInt indexComportementEquipeB = 1.obs;
  //*
  //*
  RxString comportementPubliqueEquipeA = "".obs;
  //*
  RxInt indexComportementPubliqueEquipeA = 1.obs;
  //*
  RxString comportementPubliqueEquipeB = "".obs;
  //*
  RxInt indexComportementPubliqueEquipeB = 1.obs;
  //*
  RxInt etatTerrain = 1.obs;
  //*
  RxList etatsTerrainListe = [].obs;
  //*
  RxInt etatInstallation = 1.obs;
  //*
  RxList etatsInstallationListe = [].obs;
  //
  RxList avertissementsJoueurs = [].obs;
  //
  RxList officierEquipeA = [].obs;
  RxList officierEquipeB = [].obs;
  //
  RxList remplacantEquipeA = [].obs;
  RxList remplacantEquipeB = [].obs;
  //
  RxMap joueurRemplacantEntrant = {}.obs;
  RxMap joueurRemplacantSortant = {}.obs;
  //
  // RxMap joueurRemplacantEntrantB = {}.obs;
  // RxMap joueurRemplacantSortantB = {}.obs;
  //
  RxList joueurEqupeA = [].obs;
  RxList joueurEqupeB = [].obs;
  //
  RxList joueurEquipeRemplacantA = [].obs;
  RxList joueurEquipeRemplacantB = [].obs;
  //
  RxList joueurRemplacantA = [].obs; //Pour les entrée sortie par equipe
  RxList joueurRemplacantB = [].obs;
  //
  RxMap commissaire = {}.obs;
  //
  RxList expulssionsJoueurs = [].obs;
  //
  RxList butsJoueurs = [].obs;
  //__________________________________________________
  RxList avertissementsJoueursGeneralA = [].obs;
  //
  RxList expulssionsJoueursGeneralA = [].obs;
  //
  RxList butsJoueursGeneralA = [].obs;
  //__________________________________________________
  RxList avertissementsJoueursGeneralB = [].obs;
  //
  RxList expulssionsJoueursGeneralB = [].obs;
  //
  RxList butsJoueursGeneralB = [].obs;
  //__________________________________________________
  RxList evaluationArbitreAssistant = [].obs;
  //
  RxList evaluationArbitreReserve = [].obs;
  //__________________________________________________
  Rx<TextEditingController> observationEventuelle =
      Rx<TextEditingController>(TextEditingController());
  //
  Rx<TextEditingController> incident =
      Rx<TextEditingController>(TextEditingController());
  //
  Rx<TextEditingController> observation =
      Rx<TextEditingController>(TextEditingController());
  //
  Rx<TextEditingController> reserves =
      Rx<TextEditingController>(TextEditingController());
  //
  //
  Future<void> envoyerRapport(Map r) async {
    //
    Response response = await requete.postE("rapport", r);
    //
    if (response.isOk) {
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
  //RxList butsJoueursGeneral = [].obs;
}
