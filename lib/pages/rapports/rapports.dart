import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/login/login.dart';

class Rapport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get.to(Rapport());
    return Scaffold(
      appBar: AppBar(
        title: Text("Rapport des matchs"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        children: [
          ListTile(
            onTap: () {
              //
              Get.to(Login(1));
            },
            leading: Icon(Icons.person),
            title: Text("Commissaire de match"),
            subtitle: Text(
              "Rapport",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //
              Get.to(Login(2));
            },
            leading: Icon(Icons.person),
            title: Text("Arbitre central"),
            subtitle: Text(
              "Rapport",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //
              Get.to(Login(3));
            },
            leading: Icon(Icons.person),
            title: Text("Quatrième arbitre"),
            subtitle: Text(
              "Rapport",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
