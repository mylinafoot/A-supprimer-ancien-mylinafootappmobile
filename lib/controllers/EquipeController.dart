import 'dart:convert'; // Importez dart:convert
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/requete.dart';

class EquipeController extends GetxController with StateMixin<List> {//
  Requete requete = Requete();
  //
  Future<void> getAllEquipes() async {
    change([], status: RxStatus.loading());
    http.Response httpResponse = await requete.getE("equipe/All");
    if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
      List<dynamic> equipeList = jsonDecode(httpResponse.body); // Décodez la chaîne JSON
      Response response = Response(
        body: equipeList, // Utilisez la liste décodée
        statusCode: httpResponse.statusCode,
      );
      print("response: ${response.statusCode}");
      print("response: ${response.body}");
      change(response.body, status: RxStatus.success());
    } else {
      print("response: ${httpResponse.statusCode}");
      print("response: ${httpResponse.body}");
      change([], status: RxStatus.empty());
    }
  }
}