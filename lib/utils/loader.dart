import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Loader {
  static loading() {
    Get.dialog(
      Center(
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  //#DD0707

  static var backgroundColor = Colors.white;

  static Widget loadingW() {
    return Center(
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 255, 80, 80),), // Couleur rouge
        ),
      ),
    );
  }
}
