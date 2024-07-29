import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../acceuil/AccueilPage.dart';
import 'widgets/ButtonReutilisable.dart';
import '../../controllers/ControlerPremierParametreInstallation.dart';
import 'DecouvertePage2.dart';
import 'package:provider/provider.dart';

class DecouvertePage1 extends StatefulWidget {
  @override
  State<DecouvertePage1> createState() => _DecouvertePage1State();
}

class _DecouvertePage1State extends State<DecouvertePage1> {
  //Charger l'image en arrière plan bien avant
  @override
  void initState() {
    super.initState();
    var ctrl = context.read<ControlerPremierParametreInstallation>();
    bool firstTime = true;
    ctrl.isFirstTimeBienvenue = firstTime;
  }

  void _precacheImages(BuildContext context) {
    precacheImage(AssetImage('assets/Decouverte1.png'), context);
    precacheImage(AssetImage('assets/mylinafoot2logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    _precacheImages(context); // Appel à precacheImage dans build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              _body(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Decouverte1.png'), // Replace with your image path
          fit: BoxFit.cover, // Adjust the fit as needed (cover, contain, etc.)
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: Get.size.height,
                  width: Get.size.width,
                  padding: EdgeInsets.all(06.0),
                  child : Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.250,
                          child: Image.asset(
                            'assets/mylinafoot2logo.png',
                            height: MediaQuery.of(context).size.height * 0.250,
                            width: MediaQuery.of(context).size.height * 0.250,
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.09),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BIENVENU A MY LINAFOOT',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          'Suivez en temps réel tous les matchs, '
                              'équipes et joueurs de la plus grande '
                              'compétition de football de la région. '
                              'Découvrez les statistiques.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      ButtonReutilisableWidget(
                        text: "DECOUVERTE",
                        fontSize: 14,
                        onPressed: () => Naviguer_a_la_page_choisie(DecouvertePage2()), // To do
                        color: Colors.red
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.001,
                              width: MediaQuery.of(context).size.height * 0.19,
                              color: Colors.white,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height * 0.01,),
                            Text(
                              'O',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height * 0.01,),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.001,
                              width: MediaQuery.of(context).size.height * 0.19,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Avancez !',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                      ButtonReutilisableWidget(
                          text: "SAUTER",
                          borderColor: Colors.red,
                          borderWidth: 2,
                          textColor: Colors.red,
                          onPressed: () => Naviguer_a_la_page_choisie(AccueilPage()),
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void Naviguer_a_la_page_choisie(Widget destinationPage) async {
    Get.offAll(destinationPage);
  }
}
