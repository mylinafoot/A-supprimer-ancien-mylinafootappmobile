import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:linafoot/pages/bienvenue/DecouvertePage1.dart';
import 'widgets/ButtonReutilisable.dart';
import 'DecouvertePage3.dart';

class DecouvertePage2 extends StatefulWidget {
  @override
  State<DecouvertePage2> createState() => _DecouvertePage2State();
}

class _DecouvertePage2State extends State<DecouvertePage2> {
  //Charger l'image en arrière plan bien avant
  @override
  void initState() {
    super.initState();
  }

  void _precacheImages(BuildContext context) {
    precacheImage(AssetImage('assets/arriere_plan_2.png'), context);
    precacheImage(AssetImage('assets/mylinafoot2logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
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
    _precacheImages(context); // Appel à precacheImage dans build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/arriere_plan_2.png'), // Replace with your image path
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
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Naviguer_a_la_page_choisie(DecouvertePage1());
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Row(
                          children: [
                            Icon(Icons.notifications, color: Colors.pinkAccent,),
                          ],
                        )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.017),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'VOIR LES RESULTATS',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          'Nous vous disposons les résultats de tous les matches joués.',
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
                              '1/3',
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
                              color: Colors.white,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height * 0.01,),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.002,
                              width: MediaQuery.of(context).size.height * 0.125,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                      ButtonReutilisableWidget(
                          text: "SUIVANT",
                          fontSize: 14,
                          onPressed: () => Naviguer_a_la_page_choisie(DecouvertePage3()), // To do
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
