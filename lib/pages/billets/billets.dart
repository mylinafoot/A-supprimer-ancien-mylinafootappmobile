import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Billet extends StatelessWidget {
  //
  var box = GetStorage();
  //
  RxList billets = [].obs;
  //
  Billet() {
    //
    billets.value = box.read("billets") ?? [];
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Billets"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: List.generate(billets.length, (index) {
          //
          return ListTile();
        }),
      ),
    );
  }
  //
}
