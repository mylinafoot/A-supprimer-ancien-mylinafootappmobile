import 'package:get/get.dart';
import 'package:linafoot/utils/requete.dart';

class ProgrammeController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  RxMap equipeA = {}.obs;
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
    change([], status: RxStatus.loading());
    //
    Response response =
        await requete.getE("match/All/journee/$idCalendrier/$categorie");
    //
    if (response.isOk) {
      print("response mt: ${response.statusCode}");
      print("response mt: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
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
    Response response =
        await requete.getE("match/All/match/$idCalendrier/$categorie/$journee");
    //
    if (response.isOk) {
      print("response jr: ${response.statusCode}");
      print("response jr: ${response.body}");
      //
      change(response.body, status: RxStatus.success());
    } else {
      //
      print("response jr: ${response.statusCode}");
      print("response jr: ${response.body}");
      change([], status: RxStatus.empty());
    }
  }

  //
  Future<List> getAllMatchsDeLaJournee2(
      String idCalendrier, String categorie, String journee) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response =
        await requete.getE("match/All/match/$idCalendrier/$categorie/$journee");
    //
    if (response.isOk) {
      // print("response: ${response.statusCode}");
      // print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
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
    Response response = await requete.getE("calendrier/actuel");
    //
    if (response.isOk) {
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change(response.body, status: RxStatus.success());
      return response.body;
    } else {
      //
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      // change([], status: RxStatus.empty());
      return 0;
    }
  }
}
