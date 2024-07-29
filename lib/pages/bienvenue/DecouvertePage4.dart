import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:linafoot/pages/bienvenue/DecouvertePage3.dart';
import 'package:provider/provider.dart';
import '../acceuil/AccueilPage.dart';
import 'widgets/ButtonReutilisable.dart';
import '../../controllers/ControlerPremierParametreInstallation.dart';

class DecouvertePage4 extends StatefulWidget {
  @override
  State<DecouvertePage4> createState() => _DecouvertePage4State();
}

class _DecouvertePage4State extends State<DecouvertePage4> {
  //Charger l'image en arrière plan bien avant
  @override
  void initState() {
    super.initState();
    var ctrl = context.read<ControlerPremierParametreInstallation>();
    bool firstTime = true;
    ctrl.isFirstTimeBienvenue = firstTime;
  }

  void _precacheImages(BuildContext context) {
    precacheImage(AssetImage('assets/arriere_plan_3.png'), context);
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
          image: AssetImage('assets/arriere_plan_3.png'), // Replace with your image path
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Naviguer_a_la_page_choisie(DecouvertePage3());
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                //color: Colors.black,
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height * 0.05),
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
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.21),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Row(
                            children: [
                              Icon(Icons.star_half_outlined, color: Colors.pinkAccent,),
                            ],
                          )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'DECOUVREZ PAR VOUS-MEMES TANT D’AUTRES BENEFICES',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          'Explorer en profondeur l’application, et soyez-en satisfait au maximum...',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '3/3',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.004),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.002,
                              width: MediaQuery.of(context).size.height * 0.125,
                              color: Colors.red,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height * 0.01,),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.002,
                              width: MediaQuery.of(context).size.height * 0.125,
                              color: Colors.red,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height * 0.01,),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.002,
                              width: MediaQuery.of(context).size.height * 0.125,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                      ButtonReutilisableWidget(
                          text: "SUIVANT",
                          fontSize: 14,
                          onPressed: () => Naviguer_a_la_page_choisie(AccueilPage()),// To do
                          color: Colors.red
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
