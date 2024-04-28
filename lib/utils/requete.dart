import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Requete extends GetConnect {
  //static String url = "http://10.0.2.2:8080";
  //static String url = "http://192.168.1.65:8080";
  static String url = "https://serveurmylinafoot-f8addca483a9.herokuapp.com";
  //static String url = "https://linafoot-d19a287c9c29.herokuapp.com";
  //https://linafoot-d19a287c9c29.herokuapp.com/
  //
  Future<http.Response> getE(String path) async {
    var response = await http.get(Uri.parse("$url/$path"));
    return response;
  }

  Future<Response> getEEE(String path) async {
    var response = await get("$url/$path");
    return response;
  }

  Future<Response> postE(String path, var e) async {
    var response = await post("$url/$path", e);
    return response;
  }

  Future<http.Response> putE(String path, Map e) async {
    //print(await http.read(Uri.https('example.com', 'foobar.txt')));
    var response = await http.put(Uri.parse("$url/$path"), body: e);
    return response;
  }

  Future<http.Response> deleteE(String path, dynamic e) async {
    //var url = Uri.parse("${Connexion.lien}$path");
    var response = await http.delete(Uri.parse("$url/$path"));
    //print(await http.read(Uri.https('example.com', 'foobar.txt')));
    return response;
  }
}
