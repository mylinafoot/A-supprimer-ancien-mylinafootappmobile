import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot/pages/rapports/rapports.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'acceuil/widgets/AfficheProgrammeWidget.dart';
import 'billets/billets.dart';
import 'legale.dart';
import 'nous.dart';
import 'profil/login_utilisateur.dart';
import 'profil/profil_utilisateur.dart';
import 'programme/programme_controller.dart';

class Plus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _Plus();
  }
}

class _Plus extends State<Plus> {
  //
  var box = GetStorage();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Loader.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              //
              Map utilisateur = box.read("utilisateur") ?? {};
              if (utilisateur['telephone'] != null) {
                //
                Get.to(ProfilUtilisateur(utilisateur));
                //
              } else {
                //
                Get.to(LoginUtilisateur());
                //
              }
            },
            leading: const Icon(Icons.person),
            title: Text("Profil"),
            subtitle: Text(
              "Compte",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //
              Get.to(Billet());
            },
            leading: const Icon(CupertinoIcons.ticket),
            title: const Text("Billets"),
            subtitle: const Text(
              "vos billets electronique",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // ListTile(
          //   onTap: () {
          //     //
          //     Get.to(Nous());
          //   },
          //   leading: Icon(Icons.history),
          //   title: Text("Abonnement"),
          //   subtitle: Text(
          //     "Direct et billets",
          //     style: TextStyle(
          //       fontSize: 10,
          //       color: Colors.blue,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          ListTile(
            onTap: () {
              //
              Get.to(Nous());
            },
            leading: Icon(Icons.info_outline_rounded),
            title: Text("Qui sommes nous"),
            subtitle: Text(
              "Missions & objectifs",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //
              Get.to(Legale());
              //
            },
            leading: Icon(Icons.verified_user_outlined),
            title: Text("Mention légale"),
            subtitle: Text(
              "condition d'utilisation",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //
              Get.to(Rapport());
            },
            leading: Icon(Icons.admin_panel_settings),
            title: Text("Administration"),
            subtitle: Text(
              "Rapports",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    //
  }
}
