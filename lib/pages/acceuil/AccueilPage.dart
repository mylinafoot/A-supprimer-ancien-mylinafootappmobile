import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/CarouselWidget.dart';
import 'widgets/EquipesWidget.dart';
import 'widgets/ProgrammesWidget.dart';

class AccueilPage extends StatelessWidget {
  List pubs = [
    "illicocash png.png",
    "pub_illicocash.jpg",
    "LOGO VERTICAL HD.png",
    "illicocash png.png",
    "LOGO VERTICAL HD.png",
    "LOGO VERTICAL HD.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          // Ajoutez un SizedBox pour contrôler la taille
          height: 100, // Définissez la hauteur souhaitée
          width: 150, //Définissez la largeur souhaitée
          child: Image.asset(
            'assets/mylinafoot2logo.png',
            fit: BoxFit.contain, // Assurez-vous que l'image est contenue dans le SizedBox
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.notifications_sharp),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 80, 80),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 255, 249, 249),
      body: Column(
        children: [
          CarouselWidget(), // Votre widget de carrousel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Espace les textes à chaque extrémité de la ligne
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                // Marge à gauche pour le premier texte
                child: Text(
                  'Equipes',
                  style: TextStyle(color: Color(0xFF3A3838), fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                // Marge à droite pour le deuxième texte
                child: Text(
                  'VOIR TOUT',
                  style: TextStyle(color: Color(0xFF3A3838), fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
          EquipesWidget(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                // Marge à gauche pour le premier texte
                child: Text(
                  'Programme',
                  style: TextStyle(color: Color(0xFF3A3838), fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
          Expanded(
            flex: 1, //Utilisez flex pour contrôler l'espace occupé
            child: ProgrammesWidget(),
          ),
        ],
      ),
    );
  }
}
