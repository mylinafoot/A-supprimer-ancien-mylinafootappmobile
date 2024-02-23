import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/utils/requete.dart';

class ArbitreController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
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
  RxList avertissementsJoueursGeneral = [].obs;
  //
  RxList expulssionsJoueursGeneral = [].obs;
  //
  RxList butsJoueursGeneral = [].obs;
  //__________________________________________________
  RxList evaluationArbitreAssistant = [].obs;
  //
  RxList evaluationArbitreReserve = [].obs;
  //
  //RxList butsJoueursGeneral = [].obs;
}
