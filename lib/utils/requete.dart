import 'dart:convert';
import 'package:get/get.dart';

class Requete extends GetConnect {
  static String url = "http://10.0.2.2:8080";
  Future<Response> getE(String path) async {
    var response = await get("$url/$path");
    return response;
  }

  Future<Response> postE(String path, var e) async {
    var response = await post("$url/$path", e);
    return response;
  }

  Future<Response> putE(String path, Map e) async {
    //print(await http.read(Uri.https('example.com', 'foobar.txt')));

    var response = await put("$url/$path", e);
    return response;
  }

  Future<Response> deleteE(String path, dynamic e) async {
    //var url = Uri.parse("${Connexion.lien}$path");
    var response = await delete("$url/$path");
    //print(await http.read(Uri.https('example.com', 'foobar.txt')));
    return response;
  }
}
