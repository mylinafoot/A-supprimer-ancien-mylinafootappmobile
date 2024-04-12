import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:linafoot/pages/affiche/affiche.dart';
import 'package:linafoot/pages/choix.dart';
import 'package:linafoot/pages/live/direct.dart';
import 'package:linafoot/pages/login/login.dart';
import 'package:linafoot/pages/nous.dart';
import 'package:linafoot/pages/programme/programme.dart';
import 'package:linafoot/pages/statistique/classement/classement.dart';
import 'package:linafoot/pages/statistique/statistique.dart';
import 'package:linafoot/utils/loader.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:svg_flutter/svg.dart';

import 'actus/actus.dart';
import 'billets/billets.dart';
import 'entree.dart';
import 'historique/historique.dart';
import 'live/direct3.dart';
import 'live/live.dart';
import 'plus.dart';
import 'profil/login_utilisateur.dart';
import 'programme/programme_controller.dart';
import 'rapports/commissaire/commissaire.dart';
import 'rapports/rapports.dart';
import 'sababalar/sababalar.dart';

class Accueil extends StatelessWidget {
  //Choix//Historique//Programme//Live//Statistique//

  //
  Rx vue = Rx(Entree());
  //
  Accueil({super.key}) {
    //
    _controller = PersistentTabController(initialIndex: 0);
  }
  //
  late PersistentTabController _controller;

  //
  RxInt currentIndex = 0.obs;
  //
  List rencontres = [
    ["AS DAUPHIN NOIR.png", "AS MANIEMA UNION.png"],
  ];
  //
  List vues = [
    {"titre": "Accueil", "icon": "IcBaselineSportsSoccer.svg"},
    {"titre": "Match en direct", "icon": "IonSocialYoutubeOutline.svg"},
    {"titre": "Calendrier", "icon": "GalaEditor.svg"},
    {"titre": "Achat billet", "icon": "MakiSoccer11.svg"},
    {"titre": "Admin", "icon": "GalaPortrait1.svg"},
    //{"titre": "A propos", "icon": "IonHelpOutline.svg"},
  ];

  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Loader.backgroundColor,
      body: Stack(
        children: [
          Container(
            height: Get.size.height,
            width: Get.size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Get.size.height,
                    width: Get.size.width,
                    decoration: const BoxDecoration(
                      //color: Colors.amber,
                      image: DecorationImage(
                        image: ExactAssetImage("assets/arriere_plan.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Get.size.height,
                    width: Get.size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage("assets/arriere_plan.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Get.size.height,
                    width: Get.size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage("assets/arriere_plan.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Get.size.height,
                    width: Get.size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage("assets/arriere_plan.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => vue.value)
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (e) {
            //
            currentIndex.value = e;
            //
            if (e == 0) {
              vue.value = Entree();
            }
            if (e == 1) {
              vue.value = Programme();
            }
            // if (e == 2) {
            //   vue.value = Statistique();
            // }
            if (e == 2) {
              vue.value = Direct();
            }
            if (e == 3) {
              vue.value = Actualites();
            }
            // if (e == 5) {
            //   vue.value = Sababalar();
            // }
            if (e == 4) {
              vue.value = Plus();
            }
          },
          currentIndex: currentIndex.value,
          unselectedItemColor: Colors.grey.shade500,
          selectedItemColor: Loader.backgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "Accueil"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "Calendrier"),
            //BottomNavigationBarItem(
            //  icon: Icon(CupertinoIcons.chart_pie), label: "Classements"),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle), label: "Direct"),
            BottomNavigationBarItem(
                icon: Icon(Icons.language), label: "Actualité"),
            //BottomNavigationBarItem(icon: Icon(Icons.games), label: "Jeux"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled), label: "Plus"),
          ],
        ),
      ),
      // body: PersistentTabView(
      //   context,
      //   controller: _controller,
      //   screens: [
      //     Scaffold(
      //       backgroundColor: Loader.backgroundColor,
      //       appBar: AppBar(
      //         title: const Text("Linafoot"),
      //         centerTitle: true,
      //         backgroundColor: Loader.backgroundColor,
      //         // leading: Container(
      //         //   height: 70,
      //         //   width: 70,
      //         //   decoration: const BoxDecoration(
      //         //       image: DecorationImage(
      //         //     image: ExactAssetImage("assets/illicocash png.png"),
      //         //     fit: BoxFit.cover,
      //         //   )),
      //         //   // child: Image.asset(
      //         //   //   'assets/illicocash png.png',
      //         //   //   //'assets/LOGO LINAFOOT RDC.png',
      //         //   //   width: 100,
      //         //   //   height: 100,
      //         //   // ),
      //         // ),
      //         actions: [
      //           IconButton(
      //             onPressed: () {
      //               //BxsHelpCircle
      //               Get.to(Nous());
      //               //
      //             },
      //             icon: SvgPicture.asset(
      //               'assets/BxsHelpCircle.svg',
      //               width: 30,
      //               height: 30,
      //               semanticsLabel: 'BxsHelpCircle.svg',
      //               color: Colors.white,
      //             ),
      //           ),
      //         ],
      //       ),
      //       body: ListView(
      //         //mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           const SizedBox(
      //             height: 25,
      //           ),
      //           Container(
      //             height: Get.size.height / 2.2,
      //             //color: Colors.red,
      //             child: CarouselSlider(
      //               options: CarouselOptions(
      //                 height: 350,
      //                 autoPlay: true,
      //                 viewportFraction: 0.9,
      //                 autoPlayAnimationDuration: const Duration(seconds: 1),
      //                 enlargeCenterPage: true,
      //               ),
      //               items: pubs.map((i) {
      //                 return Builder(
      //                   builder: (BuildContext context) {
      //                     return Card(
      //                       elevation: 1,
      //                       child: Container(
      //                         padding: const EdgeInsets.all(20),
      //                         alignment: Alignment.bottomCenter,
      //                         width: MediaQuery.of(context).size.width,
      //                         //margin: EdgeInsets.symmetric(horizontal: 5.0),
      //                         decoration: BoxDecoration(
      //                           image: DecorationImage(
      //                             image: ExactAssetImage("assets/$i"),
      //                           ),
      //                         ),
      //                         child: i == "illicocash png.png"
      //                             ? const Text(
      //                                 "Achèter avec votre numéro IllicoCash")
      //                             : Container(),
      //                       ),
      //                       // child: Text(
      //                       //   'text $i',
      //                       //   style: TextStyle(fontSize: 16.0),
      //                       // ),
      //                     );
      //                   },
      //                 );
      //               }).toList(),
      //             ),
      //           ),
      //           const Align(
      //             alignment: Alignment.center,
      //             child: Padding(
      //               padding:
      //                   EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 5),
      //               child: Text(
      //                 "Acheter votre billet",
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(
      //               top: 5,
      //               left: 30,
      //               right: 30,
      //               bottom: 0,
      //             ),
      //             child: FutureBuilder(
      //               future: programmeController.getCalendrier(),
      //               builder: (c, t) {
      //                 //
      //                 if (t.hasData) {
      //                   var id = t.data as int;
      //                   print("id: $id");
      //                   return Affiche("$id");
      //                 } else if (t.hasError) {
      //                   return Container();
      //                 }
      //                 return Center(
      //                   child: Container(
      //                     height: 40,
      //                     width: 40,
      //                     child: const CircularProgressIndicator(),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 40,
      //           ),
      //         ],
      //       ),
      //     ),
      //     Programme(),
      //     Statistique(),
      //     Direct(),
      //     Actualites(),
      //     Sababalar(),
      //     Container(
      //       color: Loader.backgroundColor,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           ListTile(
      //             onTap: () {
      //               //
      //               Get.to(LoginUtilisateur());
      //               //
      //             },
      //             leading: Icon(Icons.person),
      //             title: Text("Profil"),
      //             subtitle: Text(
      //               "Compte",
      //               style: TextStyle(
      //                 fontSize: 10,
      //                 color: Colors.blue,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //           ListTile(
      //             onTap: () {
      //               //
      //               Get.to(Billet());
      //             },
      //             leading: const Icon(CupertinoIcons.ticket),
      //             title: const Text("Billets"),
      //             subtitle: const Text(
      //               "vos billets electronique",
      //               style: TextStyle(
      //                 fontSize: 10,
      //                 color: Colors.blue,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //           // ListTile(
      //           //   onTap: () {
      //           //     //
      //           //     Get.to(Nous());
      //           //   },
      //           //   leading: Icon(Icons.history),
      //           //   title: Text("Abonnement"),
      //           //   subtitle: Text(
      //           //     "Direct et billets",
      //           //     style: TextStyle(
      //           //       fontSize: 10,
      //           //       color: Colors.blue,
      //           //       fontWeight: FontWeight.bold,
      //           //     ),
      //           //   ),
      //           // ),
      //           ListTile(
      //             onTap: () {
      //               //
      //               Get.to(Nous());
      //             },
      //             leading: Icon(Icons.info_outline_rounded),
      //             title: Text("Qui sommes nous"),
      //             subtitle: Text(
      //               "Missions & objectifs",
      //               style: TextStyle(
      //                 fontSize: 10,
      //                 color: Colors.blue,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //           ListTile(
      //             onTap: () {
      //               //
      //               //Get.to(Login());
      //             },
      //             leading: Icon(Icons.verified_user_outlined),
      //             title: Text("Mention légale"),
      //             subtitle: Text(
      //               "condition d'utilisation",
      //               style: TextStyle(
      //                 fontSize: 10,
      //                 color: Colors.blue,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //           ListTile(
      //             onTap: () {
      //               //
      //               Get.to(Rapport());
      //             },
      //             leading: Icon(Icons.admin_panel_settings),
      //             title: Text("Administration"),
      //             subtitle: Text(
      //               "Rapports",
      //               style: TextStyle(
      //                 fontSize: 10,
      //                 color: Colors.blue,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      //   items: [
      //     PersistentBottomNavBarItem(
      //       icon: Icon(Icons.home_rounded),
      //       title: ("Accueil"),
      //       activeColorPrimary: CupertinoColors.activeBlue,
      //       inactiveColorPrimary: CupertinoColors.systemGrey,
      //     ),
      //     PersistentBottomNavBarItem(
      //       icon: Icon(Icons.history),
      //       title: ("Calendrier"),
      //       activeColorPrimary: CupertinoColors.activeBlue,
      //       inactiveColorPrimary: CupertinoColors.systemGrey,
      //     ),
      //     PersistentBottomNavBarItem(
      //       icon: Icon(CupertinoIcons.chart_pie),
      //       title: ("Classements"),
      //       activeColorPrimary: CupertinoColors.activeBlue,
      //       inactiveColorPrimary: CupertinoColors.systemGrey,
      //     ),
      //     PersistentBottomNavBarItem(
      //       icon: Icon(CupertinoIcons.play_circle),
      //       title: ("Direct"),
      //       activeColorPrimary: CupertinoColors.activeBlue,
      //       inactiveColorPrimary: CupertinoColors.systemGrey,
      //     ),
      //     PersistentBottomNavBarItem(
      //       icon: Icon(Icons.language),
      //       title: ("Actualité"),
      //       activeColorPrimary: CupertinoColors.activeBlue,
      //       inactiveColorPrimary: CupertinoColors.systemGrey,
      //     ),
      //     PersistentBottomNavBarItem(
      //       icon: Icon(Icons.games),
      //       title: ("Jeux"),
      //       activeColorPrimary: CupertinoColors.activeBlue,
      //       inactiveColorPrimary: CupertinoColors.systemGrey,
      //     ),
      //     //
      //     PersistentBottomNavBarItem(
      //       icon: Icon(CupertinoIcons.profile_circled),
      //       title: ("Plus"),
      //       activeColorPrimary: CupertinoColors.activeBlue,
      //       inactiveColorPrimary: CupertinoColors.systemGrey,
      //     ),
      //   ],
      //   confineInSafeArea: true,
      //   backgroundColor: Colors.grey.shade900, // Default is Colors.white.
      //   handleAndroidBackButtonPress: true, // Default is true.
      //   resizeToAvoidBottomInset:
      //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      //   stateManagement: true, // Default is true.
      //   hideNavigationBarWhenKeyboardShows:
      //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      //   decoration: NavBarDecoration(
      //     borderRadius: BorderRadius.circular(10.0),
      //     colorBehindNavBar: Colors.white,
      //   ),
      //   popAllScreensOnTapOfSelectedTab: false,
      //   popAllScreensOnTapAnyTabs: true,
      //   popActionScreens: PopActionScreensType.once,
      //   itemAnimationProperties: const ItemAnimationProperties(
      //     // Navigation Bar's items animation properties.
      //     duration: Duration(milliseconds: 200),
      //     curve: Curves.ease,
      //   ),
      //   screenTransitionAnimation: const ScreenTransitionAnimation(
      //     // Screen transition animation on change of selected tab.
      //     animateTabTransition: true,
      //     curve: Curves.ease,
      //     duration: Duration(milliseconds: 100),
      //   ),
      //   navBarStyle:
      //       NavBarStyle.style1, // Choose the nav bar style with this property.
      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     Get.dialog(
      //       Center(
      //         child: Card(
      //           elevation: 1,
      //           child: Container(
      //             padding: EdgeInsets.all(10),
      //             height: 200,
      //             width: 200,
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 Align(
      //                   alignment: Alignment.topCenter,
      //                   child: Text(
      //                     "Billet(s) achetés avec succès cliquez sur voir",
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(
      //                       fontSize: 20,
      //                     ),
      //                   ),
      //                 ),
      //                 ElevatedButton(
      //                   onPressed: () async {
      //                     //
      //                     Get.back();
      //                     Get.to(Billet());
      //                     //
      //                   },
      //                   style: ButtonStyle(
      //                     fixedSize: MaterialStateProperty.all(
      //                       const Size(
      //                         double.maxFinite,
      //                         45,
      //                       ),
      //                     ),
      //                     shape: MaterialStateProperty.all(
      //                       RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                     ),
      //                     backgroundColor:
      //                         MaterialStateProperty.all(Colors.black),
      //                   ),
      //                   child: Container(
      //                     alignment: Alignment.center,
      //                     width: double.maxFinite,
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         const Text(
      //                           "Voir",
      //                           style: TextStyle(
      //                             fontSize: 15,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                         const SizedBox(
      //                           width: 5,
      //                         ),
      //                         Icon(Icons.qr_code)
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.filter),
      // ),
    );
    // return Scaffold(
    //   //body: Obx(() => vue.value),
    //   body: Obx(
    //     () => currentIndex.value == 0
    //         ? Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               const SizedBox(
    //                 height: 25,
    //               ),
    //               Container(
    //                 height: 230,
    //                 //color: Colors.red,
    //                 child: CarouselSlider(
    //                   options: CarouselOptions(
    //                     height: 350,
    //                     autoPlay: true,
    //                     autoPlayAnimationDuration: const Duration(seconds: 1),
    //                   ),
    //                   items: pubs.map((i) {
    //                     return Builder(
    //                       builder: (BuildContext context) {
    //                         return Card(
    //                           child: Container(
    //                             width: MediaQuery.of(context).size.width,
    //                             //margin: EdgeInsets.symmetric(horizontal: 5.0),

    //                             decoration: BoxDecoration(
    //                               image: DecorationImage(
    //                                 image: ExactAssetImage("assets/$i"),
    //                               ),
    //                             ),
    //                           ),
    //                           // child: Text(
    //                           //   'text $i',
    //                           //   style: TextStyle(fontSize: 16.0),
    //                           // ),
    //                         );
    //                       },
    //                     );
    //                   }).toList(),
    //                 ),
    //               ),

    //               // Expanded(
    //               //   flex: 1,
    //               //   child: GridView.count(
    //               //     padding: const EdgeInsets.all(20),
    //               //     crossAxisCount: 2,
    //               //     crossAxisSpacing: 7,
    //               //     mainAxisSpacing: 7,
    //               //     children: List.generate(
    //               //       vues.length,
    //               //       (index) {
    //               //         return Card(
    //               //           elevation: 1,
    //               //           child: Column(
    //               //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               //             children: [
    //               //               SvgPicture.asset(
    //               //                 'assets/${vues[index]['icon']}',
    //               //                 width: 80,
    //               //                 height: 80,
    //               //                 semanticsLabel: '${vues[index]['icon']}',
    //               //                 color: Colors.blue,
    //               //               ),
    //               //               Align(
    //               //                 alignment: Alignment.center,
    //               //                 child: Text(
    //               //                   "${vues[index]['titre']}",
    //               //                   style: TextStyle(
    //               //                     fontSize: 15,
    //               //                   ),
    //               //                 ),
    //               //               )
    //               //             ],
    //               //           ),
    //               //         );
    //               //       },
    //               //     ),
    //               //   ),
    //               // )
    //             ],
    //           )
    //         : currentIndex.value == 1
    //             ? Statistique()
    //             : currentIndex.value == 2
    //                 ? Statistique()
    //                 : currentIndex.value == 3
    //                     ? Live()
    //                     : currentIndex.value == 4
    //                         ? Programme()
    //                         : currentIndex.value == 5
    //                             ? Historique()
    //                             : Login(),
    //   ),
    //   bottomNavigationBar: Obx(
    //     () => BottomNavigationBar(
    //       onTap: (e) {
    //         //
    //         currentIndex.value = e;
    //         //
    //         // if (e == 0) {
    //         //   vue.value = Statistique();
    //         // }
    //         // //
    //         // if (e == 1) {
    //         //   vue.value = Live();
    //         // }
    //         // //
    //         // if (e == 2) {
    //         //   vue.value = Programme();
    //         // }
    //         // //
    //         // if (e == 3) {
    //         //   vue.value = Historique();
    //         // }
    //         // //
    //         // if (e == 4) {
    //         //   vue.value = Login();
    //         // }
    //         //
    //       },
    //       selectedItemColor: Colors.blue,
    //       currentIndex: currentIndex.value,
    //       items: List.generate(
    //         vues.length,
    //         (index) {
    //           if (index == 2) {
    //             //IMG-20240116-WA0003.jpg
    //             return BottomNavigationBarItem(
    //               label: vues[index]['titre'],
    //               icon: Image.asset(
    //                 'assets/LOGO LINAFOOT RDC.png',
    //                 width: 30,
    //                 height: 30,
    //               ),
    //               activeIcon: Image.asset(
    //                 'assets/LOGO LINAFOOT RDC.png',
    //                 width: 35,
    //                 height: 35,
    //               ),
    //             );
    //           } else {
    //             return BottomNavigationBarItem(
    //               label: vues[index]['titre'],
    //               icon: SvgPicture.asset(
    //                 'assets/${vues[index]['icon']}',
    //                 width: 25,
    //                 height: 25,
    //                 semanticsLabel: '${vues[index]['icon']}',
    //               ),
    //               activeIcon: SvgPicture.asset(
    //                 'assets/${vues[index]['icon']}',
    //                 width: 30,
    //                 height: 30,
    //                 semanticsLabel: '${vues[index]['icon']}',
    //                 color: Colors.blue,
    //               ),
    //             );
    //           }
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
